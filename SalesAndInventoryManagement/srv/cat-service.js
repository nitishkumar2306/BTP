const cds = require('@sap/cds');
const LOG = cds.log('processor-service');
const { sendMail } = require('@sap-cloud-sdk/mail-client');


module.exports = cds.service.impl(async function () {
    
    this.before(['CREATE', 'UPDATE'], 'Orders', async (req) => {
        const user = req.user.id;
        const action = req.event;
        const order = req.data;

        //custom log
        LOG.info(
            `=======User ${user} is performing ${action} on Order ID: ${order.orderId}========`
        );
    });

    // Users - requires authenticated user only
    this.before(['READ', 'CREATE', 'UPDATE', 'DELETE'], 'Users', async (req) => {
        if (!req.user.is('authenticated-user')) {
            return req.reject(403, 'Authentication required')
        }
    })

    this.before(['READ', 'CREATE', 'UPDATE', 'DELETE'], 'Customers', async (req) => {
        if (req.user.is('Admin')) return // Admin has full access
        
        if (req.user.is('SalesReps')) {
            // Add filter for SalesRep's customers only
            const SELECT = cds.parse.cql(`SELECT 1 FROM Orders WHERE Orders.CustomerID = Customers.CustomerID AND Orders.EmployeeID = '${req.user.id}'`)
            req.query.where(SELECT)
            return
        }
        
        if (req.user.is('InventoryManager')) {
            if (req.event !== 'READ') {
                return req.reject(403, 'InventoryManager has read-only access to Customers')
            }
            return
        }
        
        return req.reject(403, 'Insufficient permissions')
    })

   

    this.after('UPDATE', 'Products', async (data) => {
      
        const productId = data.productId;
        const product = await SELECT.from('CatalogService_Products').where({ productId: productId });
        console.log('=====line num 49', product);

        if (product[0].UNITSINSTOCK >= product[0].REORDERLEVEL) {
            const managers = await SELECT.from('CatalogService_Users').where({ Role: 'InventoryManager' });
            //console.log('=====line num 14', managers.length);
            if (managers.length > 0) {
                //console.log('=====line num 55');
                for (const manager of managers) {
                    console.log('=====line num 18', manager.EMAIL);
                    const mailConfig = {
                        to: manager.email,
                        subject: `Low Stock Alert: ${product[0].PRODUCTNAME}`,
                        text: `
                    Dear ${manager.userId},
                    This is an automated notification regarding low inventory levels.
                        Product Details:
                        - Product Name: ${product[0].PRODUCTNAME}
                    Best regards,
                    Inventory Management System        `
                    };

                    try {
                        await sendMail({ destinationName: 'mail_destination' }, [mailConfig]);
                        
                        console.log(`======Stock alert email sent to manager: ${manager.EMAIL}======`);
                    } catch (error) {
                        console.error(`=======Failed to send stock alert email to ${manager.EMAIL}:======`, error.message);

                    }
                }
            }
        }
    })

    this.on('placeOrder', async (req) => {
        
        const { input } = req.data;
        let totalCost = 0;
        try {
            const customer = await SELECT.from('CatalogService_Customers').where({ customerId: input.customerId });
            if (!customer.length) {
                req.error(400, `customer with ID ${input.customerId} not found`);
            }

            const orderId = cds.utils.uuid();
            const orderData = {
                orderId: orderId,
                customerId: input.customerId,
                employeeId: input.employeeId,
                orderDate: input.orderDate || new Date(),
                shipName: input.shipping.shipName,
                shipAddress: input.shipping.shipAddress,
                shipCity: input.shipping.shipCity,
                shipRegion: input.shipping.shipRegion,
                shipPostalCode: input.shipping.shipPostalCode,
                freight: input.freight,
                orderStatus: 'Pending'
            };

            const orderDetailsEntries = [];
            for (const item of input.orderItems) {
                const product = await SELECT.from('CatalogService_Products').where({ productId: item.productId });
                //console.log('======= line num 120: ',product);
                if (!product.length) {
                    req.error(400, `Product with ID ${item.productId} not found`);
                }
            
                // Use camelCase property names as defined in the CDS model
                if (product[0].unitsInStock < item.quantity) {
                    req.error(400, `Insufficient stock for the product ${item.productId}`);
                }
            
                const orderDetail = {
                    orderDetailsId: cds.utils.uuid(),
                    orderId: orderId,
                    productId: item.productId,
                    unitPrice: product[0].UNITPRICE,
                    quantity: item.quantity,
                    discount: 0
                }
                //console.log('======= line num 138: ',orderDetail);

                totalCost += orderDetail.unitPrice * orderDetail.quantity;
                // console.log('======= line num 140: ',totalCost);
                orderDetailsEntries.push(orderDetail);

                //console.log('Starting product update for:', item.ProductID);

                const srv = await cds.connect.to('CatalogService');
                await srv.update('Products').set({
                    unitsInStock: { '-=': item.quantity },
                    unitsOnOrder: { '+=': item.quantity }
                }).where({ productId: item.productId });
            }

            // Create Order Status History entry
            const historyEntry = {
                HistoryID: cds.utils.uuid(),
                orderId: orderId,
                oldStatus: null,
                newStatus: 'Pending',
                createdAt: new Date().toISOString(),
                createdBy: req.user.id,
                modifiedAt: new Date().toISOString(),
                modifiedBy: req.user.id
            };

            //Execute all database operations in a single transaction
            // await cds.transaction(req).run([
            //     INSERT.into('CatalogService_Orders').entries(orderData),
            //     INSERT.into('CatalogService_OrderDetails').entries(orderDetailsEntries),
            //     INSERT.into('CatalogService_OrderStatusHistory').entries(historyEntry)
            // ]);

            return {
                message: 'Order placed successfully',
                orderId: orderId,
                totalCost: totalCost
            };
        } catch (error) {
            req.error(500, `Error creating order: ${error.message}`);
        }
    });


    this.on('updateOrderStatus', async (req) => {

        try {
            const { orderId, newStatus, comments } = req.data;
            //console.log('===== line num 25 req.data', req.user);

            if (!(orderId || newStatus)) {
                req.error(400, 'Sorry, data not found for the given Order Id and  Status provided');
            }

            const validTransactions = {
                'Pending': ['Shipped', 'Delivered', 'Cancelled', 'Returned'],
                'Shipped': ['Delivered', 'Cancelled', 'Returned'],
                'Delivered': ['Returned'],
                'Cancelled': [],
                'Returned': ['Pending']
            }
            
            const order = await SELECT.from('CatalogService_Orders').where({ orderId: orderId }).columns(['orderStatus', 'customerId']);

            if (!order.length) {
                return {
                    success: false,
                    message: `Order ${orderId} not found!`
                };
            }
            //console.log('===== line num 36 order', order);

            const currentOrderStatus = order[0].ORDERSTATUS;

            if (!validTransactions[currentOrderStatus]?.includes(newStatus)) {
                return {
                    success: false,
                    message: `Invalid status transition from ${currentOrderStatus} to ${newStatus}`
                }
            }

            // await UPDATE.entity('CatalogService_Orders').set({ orderStatus: newStatus }).where({ OrderID: orderId });

            onerowdata = {
                historyId: cds.utils.uuid(),
                orderId: orderId,
                oldStatus: order[0].ORDERSTATUS,
                newStatus: newStatus,
                createdAt: new Date().toISOString(),
                createdBy: req.user.id,
                modifiedAt: new Date().toISOString(),
                modifiedBy: req.user.id
            };
            const srv = await cds.connect.to('CatalogService');
            await srv.update('Orders').where({ orderId: orderId }).set({ orderStatus: newStatus });
            
            // await cds.transaction(req).run([
            //     srv.update('CatalogService_Orders').set({ orderStatus: newStatus }).where({ orderId: orderId }),
            //     srv.create('CatalogService_OrderStatusHistory').entries(onerowdata)
            // ]);

            try {
                const email = await SELECT.from('CatalogService_Customers').where({ customerId: order[0].CUSTOMERID }).columns(['email']);
                //console.log('Customer email:', email[0].EMAIL);

                const mailConfig = {
                    to: email[0].EMAIL,
                    subject: `Order Status Update for Order ID: ${orderId}`,
                    text: `Dear Customer,\n\nYour order status has been updated from ${currentOrderStatus} to ${newStatus}.\n\nComments: ${comments || 'N/A'}\n\nThank you for choosing our service!`
                };
                //Use sendMail from SAP Cloud SDK
                //await sendMail({ destinationName: 'mail_destination' }, [mailConfig]);

            } catch (error) {
                console.error('Failed to send email notification:', error.message);
            }

            return {
                message: `Successfully updated for the order Id ${orderId} from ${currentOrderStatus} to ${newStatus}`,
                success: true
            }
        } catch (error) {
            console.log('Found some error: ', error);
            req.error(500, `Error finding details: ${error.message}`);
        }
    })

    this.on('orderCancellationRequest', async (req) => {
        const { orderId } = req.data;

        try {
            if (typeof orderId != 'string' || orderId.trim() === '') {
                req.error(400, 'Invalid Order Id. Must be a non-empty value.');
                return;
            }

            const orderStatus = await SELECT.from('CatalogService_Orders')
                .where({ orderId: orderId })
                .columns(['orderStatus']);
            if (orderStatus.length != 0) {

                if (orderStatus[0].ORDERSTATUS === 'Cancelled') {
                    return 'Order is already Cancelled!';
                } else if (orderStatus[0].ORDERSTATUS === 'Shipped' || orderStatus[0].ORDERSTATUS === 'Delivered') {
                    return 'Sorry,Order cannot be cancelled once it is Shipped or Delivered';
                }
                const srv = await cds.connect.to('CatalogService');
                await srv.update('Orders')
                    .where({ orderId: orderId })
                    .set({ orderStatus: 'Cancelled' });

                return `Updated the Order Status Successfully for the Order Id ${orderId}`;
            } else {
                return `Sorry, Order Id ${orderId} is not found`;
            }

        } catch (error) {
            console.log('Found some error: ', error);
            req.error(500, `Error finding details: ${error.message}`);
        }
    })

//     async function getUnitPrice(productId) {
//         const product = await cds.tx(req).run(
//             SELECT.one.from('CatalogService_Products').where({ ProductID: productID })
//         );
//         return product.UnitPrice;
//     }

    this.on('restoreProductStocksBatch', async (req) => {
        //console.log('====== req:', req.user);

        const ltt = `#ltt_${cds.utils.uuid().replace(/-/g, '')}`;
        try {

            await cds.run(`CREATE LOCAL TEMPORARY TABLE ${ltt} (ProductName NVARCHAR(100), QuantityToAdd INTEGER)`);

            const productUpdates = req.data.ProductUpdates.map(({ ProductName, QuantityToAdd }) => [ProductName, QuantityToAdd]);

            await cds.run(`INSERT INTO ${ltt} VALUES (?, ?)`, productUpdates);

            const query = `CALL "94097B236BFB4FA2B98D9CB59E50D1A7"."RestoreProductsBatchProcedure"(PRODUCTUPDATES => ${ltt}, RESULTMESSAGE => ?)`;
            const { ResultMessage } = await cds.run(query);

            await cds.run(`DROP TABLE ${ltt}`);
            return { ResultMessage: ResultMessage || "Operation completed" };
        } catch (error) {
            req.error(500, `Error calling stored procedure: ${error.message}`);
        }
    });


    this.on('updateInventoryAfterOrderPlacement', async (req) => {
        const { productname, quantity } = req.data;
        if (typeof productname !== 'string' || productname.trim() === '') {
            req.error(400, 'Invalid product name. Must be a non-empty string.');
            return;
        }
        if (typeof quantity !== 'number' || quantity <= 0) {
            req.error(400, 'Invalid quantity. Must be a positive number.');
            return;
        }
        try {

            // Properly format the SQL query
            const query = `
            CALL "94097B236BFB4FA2B98D9CB59E50D1A7"."UpdateInventoryAfterOrderPlacement"(
                PRODUCTNAME => ?, 
                QUANTITY => ?, 
                RESULTMESSAGE => ?
            )`;

            // Use parameterized query to avoid syntax issues
            const queryResult = await cds.run(query, [productname, quantity]);

            // console.log('========Procedure Result:', queryResult);

            const resultMessage = queryResult.RESULTMESSAGE;

            return { ResultMessage: resultMessage };

        } catch (error) {
            // console.log('Found some error: ', error);
            req.error(500, `Error updating the stock level: ${error.message}`);
        }
    });

    this.on('calculateCustomerLifetimeValue', async (req) => {
        const { contactName, startDate, endDate } = req.data;

        try {

            if (typeof contactName !== 'string' || contactName.trim() === '') {
                req.error(400, 'Invalid Contact Name. Must be a non-empty String.');
                return;
            }

            // Validate startDate and endDate are Date objects and not empty
            const isValidDate = (date) => !(date instanceof Date) && isNaN(date);

            if (!isValidDate(startDate)) {
                req.error(400, 'Invalid startDate. Must be a non-empty date.');
                return;
            }

            if (!isValidDate(endDate)) {
                req.error(400, 'Invalid endDate. Must be a non-empty date.');
                return;
            }

            const query = `SELECT SUM(od.quantity * od.unitPrice) AS CLTV
                            FROM CatalogService_OrderDetails od
                            JOIN CatalogService_Orders o ON o.orderId = od.orderId   
                            WHERE o.orderDate >= ?
                            AND o.orderDate <= ?
                            AND o.customerId IN (SELECT customerId FROM CatalogService_Customers WHERE contactName = ?)
                            GROUP BY o.customerId
                            `;

            const queryResult = await cds.run(query, [startDate, endDate, contactName]);

            const cltv = (queryResult.length != 0) ? queryResult[0].CLTV : `No details found with Company Name: ${contactName}, Start date: ${startDate} and End date: ${endDate}`;

            return cltv;
        } catch (error) {
            console.error(`Error finding details for the Contact Name - ${contactName}:`, error);
            req.error(500, `Error finding details: ${error.message}`);
        }
    });

    this.on('getProductStockLevel', async (req) => {
        const { productName } = req.data;

        try {
            if (typeof productName !== 'string' || productName.trim() === '') {
                req.error(400, 'Invalid Product Name. Must be a non-empty String.');
                return;
            }

            const query = `SELECT unitsInStock
                            FROM  CatalogService_Products
                            WHERE productName = ? `;

            const queryResult = await cds.run(query, [productName]);
            //console.log('=====query result: ', queryResult);

            const availableStock = (queryResult.length != 0) ? queryResult[0].UNITSINSTOCK : `No Product found with Name ${productName}`;

            if (typeof availableStock !== 'number') {
                return availableStock;
            } else {
                const stock = availableStock >= 50 ? "Sufficient" : availableStock >= 5 ? "Low" : "Out of Stock";
                return stock;
            }
        } catch (error) {
            console.error(`Error finding stock level for the Product Name - ${productName}:`, error);
            req.error(500, `Error finding the stock level: ${error.message}`);
        }
    });

    this.on('calculateAverageDeliveryTimeByCity', async (req) => {
        const { city, startDate, endDate } = req.data;

        // Validate that customerId is a number and not empty
        if (typeof city !== 'string' || city.trim() === '') {
            req.error(400, 'Invalid customerId. Must be a non-empty String.');
            return;
        }

        // Validate startDate and endDate are Date objects and not empty
        const isValidDate = (date) => !(date instanceof Date) && isNaN(date);

        if (!isValidDate(startDate)) {
            req.error(400, 'Invalid startDate. Must be a non-empty date.');
            return;
        }

        if (!isValidDate(endDate)) {
            req.error(400, 'Invalid endDate. Must be a non-empty date.');
            return;
        }

        try {
            const query = `SELECT shipCity, AVG(DAYS_BETWEEN(orderDate, deliveredDate)) AS AvgDeliveryTime
                            FROM 
                                CatalogService_Orders
                            WHERE 
                                deliveredDate IS NOT NULL
                                AND orderDate > ? 
                                AND orderDate < ?
                                AND shipCity = ?
                            GROUP BY 
                                shipCity`;

            const queryResult = await cds.run(query, [startDate, endDate, city]);

            //console.log('======== queryResult:', queryResult);
            const averageDeliveryTime = (queryResult.length != 0) ? Math.round(queryResult[0].AVGDELIVERYTIME) : `No details found with city ${city}, Start date: ${startDate} and End date: ${endDate}`;

            return { "Average Delivery Time": averageDeliveryTime };
        } catch (error) {
            console.error(`Error calculating Average Delivery Time for the ${city}:`, error);
            req.error(500, `Error calculating Average Delivery Time: ${error.message}`);
        }

    });

    this.on('calculateTotalRevenue', async (req) => {
        const { productName, startDate, endDate } = req.data;

        try {
            // Validate that customerId is a number and not empty
            if (typeof productName !== 'string' || productName.trim() === '') {
                req.error(400, 'Invalid Product Name. Must be a non-empty String.');
                return;
            }

            // Validate startDate and endDate are Date objects and not empty
            const isValidDate = (date) => !(date instanceof Date) && isNaN(date);

            if (!isValidDate(startDate)) {
                req.error(400, 'Invalid startDate. Must be a non-empty date.');
                return;
            }

            if (!isValidDate(endDate)) {
                req.error(400, 'Invalid endDate. Must be a non-empty date.');
                return;
            }
            const totalRevenueQuery = `
                            SELECT SUM(od.quantity * od.unitPrice) as revenue
                            FROM CatalogService_OrderDetails od
                            JOIN CatalogService_Orders o ON o.orderId = od.orderId
                            JOIN CatalogService_Products p ON od.ProductID = p.productId
                            WHERE p.productName = ?
                            AND o.orderDate > ? 
                            AND o.orderDate < ?
                        `;

            const totalRevenueResult = await cds.run(totalRevenueQuery, [productName, startDate, endDate]);
            //console.log('====totalrevenueresult: ', totalRevenueResult);

            const totalRevenue = totalRevenueResult[0].REVENUE || `No details found with Product Name: ${productName}, Start date: ${startDate} and End date: ${endDate}`;
            //console.log('======== totalRevenueResult:', totalRevenueResult);
            return totalRevenue;

        } catch (error) {
            console.error(`Error calculating total revenue for ${productName} in the given date range:`, error);
            req.error(500, `Error calculating total revenue: ${error.message}`);
        }
    });
//     //return service
});
