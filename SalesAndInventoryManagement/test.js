const axios = require('axios');

const testProcedure = async()=>{
    try {
        const response = await axios.post('https://port43163-workspaces-ws-zwgfb.us10.trial.applicationstudio.cloud.sap/odata/v4/catalog/restoreProductStocksBatch', {
          ProductUpdates: [
            { productID: 101, QuantityToAdd: 10 },
            { productID: 102, QuantityToAdd: 20 },
          ],
        }, {
          headers: {
             Authorization: 'Colin',
            'Content-Type': 'application/json'
          },
        });
    
        console.log('Response:', response.data);
      } catch (error) {
        console.error('Error:', error.response?.data || error.message);
      }

}

testProcedure();