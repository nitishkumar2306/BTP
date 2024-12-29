sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/routing/History",
    "sap/ui/core/UIComponent"
], (Controller,History,UIComponent) => {
    "use strict";

    return Controller.extend("com.orders.ordersapp.controller.Details", {
        onInit(){
            var oRouter = UIComponent.getRouterFor(this);
            oRouter.getRoute("RouteDetails").attachPatternMatched(this.onRouterMethod, this);
        },

        onNavBack: function(){
            var oHistory = History.getInstance();
            var sPreviousHash = oHistory.getPreviousHash();
        
            if (sPreviousHash !== undefined) {
              window.history.go(-1);
            } else {
              var oRouter = UIComponent.getRouterFor(this);
              oRouter.navTo("Routehome", {}, true);
            }
        },

        onRouterMethod: function(oEvent){
            var sId = oEvent.getParameter("arguments").OrderID;
            //alert(sId);
            //var sPath = this.getView().getModel().createKey("Orders",OrderID",sId);
            var oModel = this.getView().getModel();
            oModel.read(`/Orders(${sId})`, {
                urlParameters: {
                    "$expand": "Order_Details"
                },
                success: function(oData) {
                    // Get the Order_Details array
                    const oViewModel = new sap.ui.model.json.JSONModel({
                        Order_Details: oData.Order_Details.results
                    });
                    this.getView().setModel(oViewModel, "orderView");
                }.bind(this),
                error: function(oError) {
                    console.log(oError);
                }
            });
        }
    });
});