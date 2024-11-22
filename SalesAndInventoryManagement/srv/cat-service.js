const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

    // this.on('READ','Orders',async(req)=>{
    //     console.log('====== req',req);
    //     const Admin = req.user.is('Admin');
    //     const SalesRep = req.user.is('SalesReps');

    //     if(!Admin){
    //         req.reject(403, 'The user is not authorized to access this resource');
    //     }

    //     var result = await cds.run(req.query);

    //     if(Admin){
    //         result = result.filter(temp => temp.EmployeeID > 4);
    //     }

    //     return result;
    // });

    this.before('UPDATE', 'CatalogService.Orders', async (req) => {
        const { orderId, orderStatus } = req.data;

        console.log('===== id and status values are: ', orderId, ' ', orderStatus);

        if (!orderStatus){
            req.reject(400, 'Order status is required');
        };
    })

    this.on('orderCancellationRequest', async (req) => {
        const { orderId } = req.data;

        try {
            if (typeof orderId != 'string' || orderId.trim() === '') {
                req.error(400, 'Invalid Order Id. Must be a non-empty value.');
                return;
            }

            const orderStatus = await SELECT.from('CatalogService_Orders')
                .where({ OrderID: orderId })
                .columns(['OrderStatus']);
            if (orderStatus.length != 0) {

                if (orderStatus[0].ORDERSTATUS === 'Cancelled') {
                    return 'Order is already Cancelled!';
                } else if (orderStatus[0].ORDERSTATUS === 'Shipped' || orderStatus[0].ORDERSTATUS === 'Delivered') {
                    return 'Sorry,Order cannot be cancelled once it is Shipped or Delivered';
                }

                await cds.transaction(req).run( UPDATE('CatalogService_Orders')
                    .where({ OrderID: orderId })
                    .set({ OrderStatus: 'Cancellled' })) ;

                return `Updated the Order Status Successfully for the Order Id ${orderId}`;
            } else {
                return `Sorry, Order Id ${orderId} is not found`;
            }

        } catch (error) {
            console.log('Found some error: ', error);
            req.error(500, `Error finding details: ${error.message}`);
        }
    })

    this.on('placeOrder', async (req) => {
        const { input } = req.data;
        let totalCost = 0;
        let resultMessage = '';

        for (let item in input.OrderItems) {
            const { ProductID, Quantity } = item;

            const result = await cds.tx(req).run(
                SELECT.one`UpdateInventoryAfterOrderPlacement(${ProductID}, ${Quantity}) AS resultMessage`
            );

            if (result.resultMessage !== 'Inventory Updated Successfully') {
                return { message: result.resultMessage };
            }

            const price = await getUnitPrice(ProductID);
            totalCost += price * Quantity;

            const order = await INSERT.into('Orders').entries({

            })
        }
    });

    async function getUnitPrice(productId) {
        const product = await cds.tx(req).run(
            SELECT.one.from('CatalogService_Products').where({ ProductID: productID })
        );
        return product.UnitPrice;
    }

    this.on('restoreProductStocksBatch', async (req) => {
        //const { ProductUpdates } = req.data;
        const ltt = `#ltt_${cds.utils.uuid().replace(/-/g, '')}`;
        console.log('======req parameter check: ', req);
        try {

            //const query = `CALL "A3B0E6B70CD04735BB7058780C704D3A"."RestoreProductsBatchProcedure"(PRODUCTID => ${productId}, QUANTITYTOADD => ${quantity}, RESULTMESSAGE => ?)`;
            await cds.run(`CREATE LOCAL TEMPORARY TABLE ${ltt} (productID INTEGER, QuantityToAdd INTEGER)`);

            // Step 2: Insert data into the temporary table
            const productUpdates = req.data.ProductUpdates.map(({ productID, QuantityToAdd }) => [productID, QuantityToAdd]);
            await cds.run(`INSERT INTO ${ltt} VALUES (?, ?)`, productUpdates);

            // Step 3: Call the stored procedure with the temporary table as input
            const query = `CALL "A3B0E6B70CD04735BB7058780C704D3A"."RestoreProductsBatchProcedure"(PRODUCTUPDATES => ${ltt}, RESULTMESSAGE => ?)`;
            const { ResultMessage } = await cds.run(query);

            // Clean up by dropping the temporary table
            await cds.run(`DROP TABLE ${ltt}`);

            // Step 4: Return the result message
            return { ResultMessage: ResultMessage || "Operation completed" };

        } catch (error) {
            req.error(500, `Error calling stored procedure: ${error.message}`);
        }
    })


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

            const query = ` SELECT SUM(od.Quantity * od.UnitPrice) AS CLTV
                            FROM CatalogService_OrderDetails od
                            JOIN CatalogService_Orders o ON o.OrderID = od.OrderID   
                            WHERE o.OrderDate >= ?
                            AND o.OrderDate <= ?
                            AND o.CustomerID IN (SELECT CustomerID FROM CatalogService_Customers WHERE ContactName = ?)
                            GROUP BY o.CustomerID
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

            const query = ` SELECT UnitsInStock
                            FROM  CatalogService_Products
                            WHERE ProductName = ? `;

            const queryResult = await cds.run(query, [productName]);
            console.log('=====query result: ', queryResult);

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
            const query = ` SELECT ShipCity, AVG(DAYS_BETWEEN(OrderDate, DeliveredDate)) AS AvgDeliveryTime
                            FROM 
                                CatalogService_Orders
                            WHERE 
                                DeliveredDate IS NOT NULL
                                AND OrderDate > ? 
                                AND OrderDate < ?
                                AND ShipCity = ?
                            GROUP BY 
                                ShipCity`;

            const queryResult = await cds.run(query, [startDate, endDate, city]);

            console.log('======== queryResult:', queryResult);

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
                            SELECT SUM(od.Quantity * od.UnitPrice) as revenue
                            FROM CatalogService_OrderDetails od
                            JOIN CatalogService_Orders o ON o.OrderID = od.OrderID
                            JOIN CatalogService_Products p ON od.ProductID = p.ProductID
                            WHERE p.ProductName = ?
                            AND o.OrderDate > ? 
                            AND o.OrderDate < ?
                        `;

            const totalRevenueResult = await cds.run(totalRevenueQuery, [productName, startDate, endDate]);
            console.log('====totalrevenueresult: ', totalRevenueResult);

            const totalRevenue = totalRevenueResult[0].REVENUE || `No details found with Product Name: ${productName}, Start date: ${startDate} and End date: ${endDate}`;
            //console.log('======== totalRevenueResult:', totalRevenueResult);
            return totalRevenue;

        } catch (error) {
            console.error(`Error calculating total revenue for ${productName} in the given date range:`, error);
            req.error(500, `Error calculating total revenue: ${error.message}`);
        }
    });
});
