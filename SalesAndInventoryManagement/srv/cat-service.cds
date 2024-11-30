using SalesInventoryManagement as my from '../db/schema';

type placeOrderReturnType {
    message   : String;
    orderID   : Integer;
    totalCost : Decimal(10, 2)
};

// @cds.persistence: 'db'
@(requires: 'authenticated-user')
service CatalogService {

    entity Users        as projection on my.users;

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
    entity Customers    as projection on my.Customers;

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
    entity OrderDetails as projection on my.OrderDetails;

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
    entity Products     as
        projection on my.Products {
            ProductID,
            ProductName,
            SupplierID,
            QuantityPerUnit,
            @(restrict: [{
                grant: '*',
                to   : [
                    'InventoryManager',
                    'Admin'
                ]
            }])
            UnitPrice,
            @(restrict: [{
                grant: '*',
                to   : [
                    'InventoryManager',
                    'Admin'
                ]
            }])
            UnitsInStock,
            @(restrict: [{
                grant: '*',
                to   : [
                    'InventoryManager',
                    'Admin'
                ]
            }])
            UnitsOnOrder,
            @(restrict: [{
                grant: '*',
                to   : [
                    'InventoryManager',
                    'Admin'
                ]
            }])
            ReorderLevel,
            Discontinued,
            Supplier
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
    entity Orders       as projection on my.Orders;

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
    entity Suppliers    as projection on my.Suppliers;


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
        customerID         : UUID; // Change from String(10) to UUID
        OrderItems         : many {
            ProductID      : UUID; // Change from Integer to UUID
            Quantity       : Integer;
        };
        shipping           : {
            ShipName       : String(40);
            ShipAddress    : String(60);
            ShipCity       : String(15);
            ShipRegion     : String(15);
            ShipPostalCode : String(10);
            ShipCountry    : String(15);
        };
        employeeID         : Integer;
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
    action   updateOrderStatus(orderId : String, newStatus : String, comments : String)             returns {
        message : String;
        success : Boolean;
    }
}