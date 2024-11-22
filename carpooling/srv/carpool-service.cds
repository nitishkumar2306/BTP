using com.sap.carpooling as db from '../db/schema';

service CatalogService{

    entity RideAvailable as projection on db.Rides;
    entity AdressInfo {
        addressId : UUID;
        displayName: String(255);
        address: String(255);
    }

    //function fetchLocation(city: String, state: String) returns AdressInfo;

    type countryDetails {
        capital: String;
        population: Integer;
        timezone: String;
        continent: String;
        language: array of String;
    }

    function fetchCountryDetails(country: String) returns countryDetails;

    function add(a: Integer, b:Integer) returns Integer;

    function fetchCountryDetails2(location : String) returns String;
}