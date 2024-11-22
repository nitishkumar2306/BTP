namespace com.sap.carpooling;

using { cuid, managed } from '@sap/cds/common';

type Status : String enum{
    Available;
    Booked;
    Completed;
}

type RequestStatus : String enum{
    Not_Requested;
    Pending;
    Accepted;
}

entity Users: cuid, managed{
    username: String(50) @mandatory;
    email: String(100) @mandatory;
    phoneNumber: String(20);
    postRides: Association to many Rides on postRides.driver=$self;
    rideRequests: Association to many RideRequests on rideRequests.requester = $self;
}


entity Rides: cuid, managed{
    driver: Association to Users;
    startLocation: String(50) @mandatory;
    endLocation: String(50) @mandatory;
    vehicleType: String(30) @mandatory;
    model: String @mandatory;
    date: Date;
    departureTime: Time;
    seatsAvailable: Integer @manditory;
    status: Status;
    charge: Decimal(10,2) @mandatory;
    request: Association to many RideRequests on request.ride = $self; 
    carbonFootPrint: Association to CarbonFootPrints;
    distance: Decimal(10,2);
}

entity RideRequests: cuid, managed{
    requester: Association to Users;
    ride: Association to Rides;
    startLocation: String(50) @mandatory;
    endLocation: String(50) @mandatory;
    seatsRequested: Integer @mandatory;
    requestStatus: RequestStatus;
    requestDate: Date @mandatory;
    comments: String @mandatory;
}


entity CarbonFootPrints: cuid, managed{
    ride: Association to Rides;
    carbonSaved: Decimal(10,2);
}