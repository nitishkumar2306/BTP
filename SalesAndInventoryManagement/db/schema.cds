namespace SalesInventoryManagement;
using { managed } from '@sap/cds/common';

type OrderStatus : String enum{
    Pending;
    Shipped;
    Delivered;
    Cancelled;
    Returned;

}
entity users {
    key UserID : UUID;
    userName: String(50) @Common.FieldControl: #Mandatory;
    Email: String(100) @Common.FieldControl: #Mandatory; 
    Role: String(20) enum { SalesRep; InventoryManager; Admin; };
    Active : Boolean default true;

    Orders: Association to many Orders on Orders.EmployeeID = $self.UserID;
}
entity Customers {
    key CustomerID   : UUID;
        CompanyName : String(40);
        ContactName  : String(30);
        ContactTitle : String(30);
        Address      : String(60);
        City         : String(15);
        Region       : String(25);
        PostalCode   : String(10);
        Country      : String(15);
        Phone        : String(24);
        Fax          : String(24);
        Email : String(100) @Common.FieldControl: #Mandatory;

        // Association to Orders
        Orders       : Association to many Orders
                           on Orders.CustomerID = $self.CustomerID;
}

entity Orders {
    key OrderID        : UUID;
        CustomerID     : UUID; // Foreign Key to Customers
        EmployeeID     : UUID; // Foreign Key to Employees (not created here but can be added if needed)
        OrderDate      : Date;
        DeliveredDate  : Date;
        ShippedDate    : Date;
        Freight        : Decimal(10, 2);
        ShipName       : String(40);
        ShipAddress    : String(60);
        ShipCity       : String(15);
        ShipRegion     : String(15);
        ShipPostalCode : String(10);
        OrderStatus  : OrderStatus @default: 'Pending';

        // Association to OrderDetails
        OrderDetails   : Composition of many OrderDetails on OrderDetails.OrderID = $self.OrderID;

        // Association to history
        histories       : Composition of many OrderStatusHistory on histories.OrderID = $self.OrderID;

        // Association to SalesReps
        SalesRep        : Association to users on SalesRep.UserID = $self.EmployeeID and SalesRep.Role = 'SalesRep';
}

entity OrderStatusHistory : managed{
  key HistoryID : UUID;
  OrderID       : UUID;
  OldStatus     : String;
  NewStatus     : String;
  createdAt     : DateTime;
  createdBy     : String;
  modifiedAt    : DateTime;
  modifiedBy    : String;
}

entity OrderDetails {
    key OrderDetailsId : UUID;
        OrderID : UUID;
        ProductID : UUID;
        UnitPrice : Decimal(10, 2);
        Quantity  : Integer;
        Discount  : Decimal(3, 2);

        Order   : Association to Orders on Order.OrderID = $self.OrderID;
        Product : Association to Products on Product.ProductID = $self.ProductID;
}

entity Products {
    key ProductID       : UUID;
        SupplierID      : UUID;
        ProductName     : String(40);
        QuantityPerUnit : String(20);
        UnitPrice       : Decimal(10, 2);
        UnitsInStock    : Integer;
        UnitsOnOrder    : Integer;
        ReorderLevel    : Integer;
        Discontinued    : Boolean;

        // Association to Suppliers
        Supplier        : Association to Suppliers on Supplier.SupplierID = $self.SupplierID;
}

entity Suppliers {
    key SupplierID   : UUID;
        CompanyName  : String(40);
        ContactName  : String(30);
        ContactTitle : String(30);
        Address      : String(60);
        City         : String(15);
        Region       : String(15);
        PostalCode   : String(10);
        Country      : String(15);
        Phone        : String(24);
        Fax          : String(24);

        // Association to Products
        Products     : Association to many Products
                           on Products.SupplierID = $self.SupplierID;
}
