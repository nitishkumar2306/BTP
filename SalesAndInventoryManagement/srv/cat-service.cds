using SalesInventoryManagement as my from '../db/schema';

type placeOrderReturnType {
    message   : String;
    orderID   : Integer;
    totalCost : Decimal(10, 2)
};

// @cds.persistence: 'db'
@(requires: 'authenticated-user')
service CatalogService {

    entity Users              as
        projection on my.users {
            UserID as userId,
            userName,
            Email  as email,
            Role   as role,
            Active as active
        };

    @(restrict: [
        {
            grant: '*',
            to   : 'Admin'
        },
        {
            grant: '*',
            to   : 'SalesReps',
            where: 'exists (SELECT 1 FROM Orders WHERE Orders.CustomerID = Customers.CustomerID AND Orders.EmployeeID = $user)'
        },
        {
            grant: 'READ',
            to   : 'InventoryManager'
        }
    ])
    entity Customers          as
        projection on my.Customers {
            CustomerID   as customerId,
            CompanyName  as companyName,
            ContactName  as contactName,
            ContactTitle as contactTitle,
            Address      as address,
            City         as city,
            Region       as region,
            PostalCode   as postalCode,
            Country      as country,
            Phone        as phone,
            Fax          as fax,
            Email        as email
        };

    @(restrict: [{
        grant: '*',
        to   : 'Admin'
    }])
    entity OrderStatusHistory as
        projection on my.OrderStatusHistory {
            HistoryID  as historyId,
            OrderID    as orderId,
            OldStatus  as oldStatus,
            NewStatus  as newStatus,
            createdAt  as createdAt,
            createdBy  as createdBy,
            modifiedAt as modifiedAt,
            modifiedBy as modifiedBy
        };

    @(restrict: [
        {
            grant: '*',
            to   : 'Admin'
        },
        {
            grant: 'Read',
            to   : 'InventoryManager'
        },
        {
            grant: '*',
            to   : 'SalesReps',
            where: 'exists (SELECT 1 FROM Orders WHERE OrderDetails.OrderID = Orders.OrderID AND Orders.EmployeeID = $user)'
        }
    ])
    entity OrderDetails       as
        projection on my.OrderDetails {
            OrderDetailsId as orderDetailsId,
            OrderID        as orderId,
            ProductID      as productId,
            UnitPrice      as unitPrice,
            Quantity       as quantity,
            Discount       as discount
        };

    @(restrict: [
        {
            grant: '*',
            to   : [
                'InventoryManager',
                'Admin'
            ]
        },
        {
            grant: 'Read',
            to   : 'SalesReps'
        }
    ])
    entity Products           as
        projection on my.Products {
            ProductID       as productId,
            ProductName     as productName,
            SupplierID      as supplierId,
            QuantityPerUnit as quantityPerUnit,
            @(restrict: [{
                grant: '*',
                to   : [
                    'InventoryManager',
                    'Admin'
                ]
            }])
            UnitPrice       as unitPrice,
            @(restrict: [{
                grant: '*',
                to   : [
                    'InventoryManager',
                    'Admin'
                ]
            }])
            UnitsInStock    as unitsInStock,
            @(restrict: [{
                grant: '*',
                to   : [
                    'InventoryManager',
                    'Admin'
                ]
            }])
            UnitsOnOrder    as unitsOnOrder,
            @(restrict: [{
                grant: '*',
                to   : [
                    'InventoryManager',
                    'Admin'
                ]
            }])
            ReorderLevel    as reorderLevel,
            Discontinued    as discontinued,
            Supplier        as supplier
        };

    @(restrict: [
        {
            grant: '*',
            to   : 'Admin'

        },
        {
            grant: '*',
            to   : 'SalesReps',
            where: 'exists (SELECT 1 FROM Orders WHERE Orders.EmployeeID = $user)'
        },
        {
            grant: 'Read',
            to   : 'InventoryManager'
        }
    ])
    entity Orders             as
        projection on my.Orders {
            OrderID        as orderId,
            CustomerID     as customerId,
            EmployeeID     as employeeId,
            OrderDate      as orderDate,
            DeliveredDate  as deliveredDate,
            ShippedDate    as shippedDate,
            Freight        as freight,
            ShipName       as shipName,
            ShipAddress    as shipAddress,
            ShipCity       as shipCity,
            ShipRegion     as shipRegion,
            ShipPostalCode as shipPostalCode,
            OrderStatus    as orderStatus
        };

    @(restrict: [
        {
            grant: '*',
            to   : [
                'Admin',
                'InventoryManager'
            ]
        },
        {
            grant: 'Read',
            to   : 'SalesReps'
        }
    ])
    entity Suppliers          as
        projection on my.Suppliers {
            SupplierID   as supplierId,
            CompanyName  as companyName,
            ContactName  as contactName,
            ContactTitle as contactTitle,
            Address      as address,
            City         as city,
            Region       as region,
            PostalCode   as postalCode,
            Country      as country,
            Phone        as phone,
            Fax          as fax
        };


    function calculateTotalRevenue(productName : String, startDate : Date, endDate : Date)          returns Decimal(10, 2);
    function calculateAverageDeliveryTimeByCity(city : String, startDate : Date, endDate : Date)    returns Integer;
    function getProductStockLevel(productName : String)                                             returns String;
    function calculateCustomerLifetimeValue(contactName : String, startDate : Date, endDate : Date) returns Decimal(10, 2);
    action   updateInventoryAfterOrderPlacement(productname : String, quantity : Integer)           returns String;
    action   orderCancellationRequest(orderId : String)                                             returns String;

    @(restrict: [
        {
            grant: '*',
            to   : 'Admin'
        },
        {
            grant: '*',
            to   : 'InventoryManager'
        }
    ])
    action   restoreProductStocksBatch(ProductUpdates : many {
        ProductName : String;
        QuantityToAdd : Integer;
    })                                                                                              returns {
        ResultMessage : String;
    };

    type OrderInput {
        customerId         : UUID; // Change from String(10) to UUID
        orderItems         : many {
            productId      : UUID; // Change from Integer to UUID
            quantity       : Integer;
        };
        shipping           : {
            shipName       : String(40);
            shipAddress    : String(60);
            shipCity       : String(15);
            shipRegion     : String(15);
            shipPostalCode : String(10);
            shipCountry    : String(15);
        };
        employeeId         : Integer;
        orderDate          : Date;
        freight            : Decimal(10, 2);
    };

    @(restrict: [
        {
            grant: '*',
            to   : 'Admin'
        },
        {
            grant: '*',
            to   : 'SalesReps'
        }
    ])
    action   placeOrder(input : OrderInput)                                                         returns placeOrderReturnType;

    @(restrict: [
        {
            grant: '*',
            to   : 'Admin'
        },
        {
            grant: '*',
            to   : 'SalesReps'
        }
    ])
    action updateOrderStatus(orderId : String, newStatus : String, comments : String)             returns {
        message : String;
        success : Boolean;
    };

    function callNorthwindDestination() returns{
        success: Boolean
    }
}
