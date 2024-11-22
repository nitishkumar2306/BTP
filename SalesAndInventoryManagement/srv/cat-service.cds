using SalesInventoryManagement as my from '../db/schema';

    type placeOrderReturnType {
        message: String;
        orderID: Integer;
        totalCost: Decimal(10, 2)
    }; 

    type OrderInput {
        customerID: String(10);
        OrderItems: many {
            ProductID : Integer;
            Quantity : Integer;
        };

        shipping: {
            ShipName: String(40);
            ShipAddress: String(60);
            ShipCity: String(15);
            ShipRegion: String(15);
            ShipPostalCode: String(10);
            ShipCountry: String(15);
        };

        employeeID: Integer;
        orderDate: Date;
        freight: Decimal(10,2);
    };

// @cds.persistence: 'db'
// @(requires: 'authenticated-user')
service CatalogService  {
    // @(restrict: [{
    //     grant: '*',
    //     to   : [
    //         'SalesReps',
    //         'Admin'
    //     ]
    // }])
    entity Customers    as projection on my.Customers;

    // @(restrict: [
    //     {
    //         grant: '*',
    //         to   : [
    //             'SalesReps',
    //             'Admin'
    //         ]
    //     },
    //     {
    //         grant: 'Read',
    //         to   : 'InventoryManager'
    //     }
    // ])
    entity OrderDetails as projection on my.OrderDetails;

    // @(restrict: [
    //     {
    //         grant: '*',
    //         to   : [
    //             'InventoryManager',
    //             'Admin'
    //         ]
    //     },
    //     {
    //         grant: 'Read',
    //         to   : 'SalesReps'
    //     }
    // ])
    entity Products     as
        projection on my.Products {
            ProductID,
            ProductName,
            SupplierID,
            QuantityPerUnit ,
            // @(restrict: [{
            //     grant: '*',
            //     to   : [
            //         'InventoryManager',
            //         'Admin'
            //     ]
            // }])
            UnitPrice ,      
            // @(restrict: [{
            //     grant: '*',
            //     to   : [
            //         'InventoryManager',
            //         'Admin'
            //     ]
            // }])
            UnitsInStock ,   
            // @(restrict: [{
            //     grant: '*',
            //     to   : [
            //         'InventoryManager',
            //         'Admin'
            //     ]
            // }])
            UnitsOnOrder ,   
            // @(restrict: [{
            //     grant: '*',
            //     to   : [
            //         'InventoryManager',
            //         'Admin'
            //     ]
            // }])
            ReorderLevel,
            Discontinued,
            Supplier
        };

    // @(restrict: [
    //     {
    //         grant: '*',
    //         to   : [
    //             'SalesReps',
    //             'Admin'
    //         ]
    //     },
    //     {
    //         grant: 'Read',
    //         to   : 'InventoryManager'
    //     }
    // ])
    entity Orders       as projection on my.Orders;

    // @(restrict: [{
    //     grant: '*',
    //     to   : [
    //         'InventoryManager',
    //         'Admin'
    //     ]
    // }])
    entity Suppliers as projection on my.Suppliers;

    function calculateTotalRevenue(productName : String, startDate : Date, endDate : Date) returns Decimal(10,2);

    function calculateAverageDeliveryTimeByCity(city: String, startDate : Date, endDate : Date) returns Integer;

    function getProductStockLevel(productName : String) returns String;

    function calculateCustomerLifetimeValue(contactName : String, startDate : Date, endDate : Date) returns Decimal(10,2);

    function updateInventoryAfterOrderPlacement(productname: String, quantity: Integer) returns String;

    action orderCancellationRequest(orderId: String) returns String;

    action restoreProductStocksBatch(ProductUpdates : many {
        ProductID : Integer;
        QuantityToAdd : Integer;
    }) returns {
        ResultMessage : String;
    };

    action placeOrder(input : OrderInput) returns placeOrderReturnType;
}