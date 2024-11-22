const cds = require('@sap/cds');
const { executeHttpRequest } = require('@sap-cloud-sdk/http-client');
const { GoogleMapsClient } = require('@googlemaps/google-maps-services-js');
const client = new GoogleMapsClient({
    key: 'AIzaSyCrwiGvbRzI1ZhGn0-kDxFZhgdrmfrST04',
    version: '1'
  });

module.exports = cds.service.impl(async function () {

    this.on('add', async (req) => {
        const { a, b } = req.data;

        return a + b;
    })
    this.on('fetchCountryDetails', async (req) => {
        const { country } = req.data;
        try {
            const response = await executeHttpRequest(
                {
                    destinationName: 'RestCountriesAPI'
                },
                {
                    method: 'Get',
                    url: `/v3.1/name/${country}`
                }
            );

            if (response.data && response.data.length > 0) {
                return {
                    capital: response.data[0].capital[0],
                    population: response.data[0].population,
                    timezone: response.data[0].timezones[0],
                    continent: response.data[0].continents[0],
                    language: response.data[0].languages
                };
            } else {
                return req.reject(404, `${country} details not found`);
            }
        }
        catch (error) {
            return req.reject(500, `Error fetching details for ${country}`);
        }
    });

    this.on('fetchCountryDetails2', async (req) => {
        const { location } = req.data;
        try {
            const textSearchRequest = {
                query: 'restaurants near Bengaluru',
                location: { lat: 12.9716, lng: 77.6423 },
                radius: 5000
              };
              
              client.placesNearby(textSearchRequest)
                .then((response) => {
                  console.log(response.results);
                })
                .catch((error) => {
                  console.error(error);
                });
              
            if (response.data) {
                return "Got data";
            } else {
                return req.reject(404, `${country} details not found`);
            }
        }
        catch (error) {
            console.error('Detailed error:', error.response ? error.response.data : error);
            return req.reject(500, `Error fetching details for ${location}`);
        }
    });
});