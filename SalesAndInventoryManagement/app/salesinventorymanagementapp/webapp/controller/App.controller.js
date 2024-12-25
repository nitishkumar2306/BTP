sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/ui/model/json/JSONModel"
], (BaseController,JSONModel) => {
  "use strict";

  return BaseController.extend("com.sap.salesinventorymanagementapp.controller.App", {
      onInit() {
        const oModel = this.getOwnerComponent().getModel("capModel");
        
        // For OData V4, use:
        // oModel.requestObject("/Products").then((oData) => {
        //   console.log("Data retrieved successfully:", oData);
        // }).catch((oError) => {
        //     console.error("Error fetching data:", oError);
        // });
                // Create a list binding
        const oBinding = oModel.bindList("/Products");
        
        // Request the data
        oBinding.requestContexts(0, 5).then((aContexts) => {
            const aProducts = aContexts.map(context => context.getObject());
            console.log("Products:", aProducts);
        });
      }
  });
});