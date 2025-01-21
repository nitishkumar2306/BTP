sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent",
    "sap/ui/core/routing/History",
    "sap/ui/model/json/JSONModel",
    "sap/m/MessageToast"
], (Controller,UIComponent,History,JSONModel,MessageToast) => {
    "use strict";

    return Controller.extend("com.sap.salesinventorymanagementapp.controller.details", {
        onInit() {
            var oRouter = this.getOwnerComponent().getRouter();
            oRouter.getRoute("detailRoute").attachPatternMatched(this._onObjectMatched, this);

            var oProductsEnableJSONModel = new JSONModel({
                isProductsDataEditable: false
            });

            this.getView().setModel(oProductsEnableJSONModel,'oProductEnableModel');
        },

        handleNavButton: function(){
            var oHistory = History.getInstance();
            var sPreviousHash = oHistory.getPreviousHash();

            if(sPreviousHash != undefined){
                window.history.go(-1);
            }else{
                var oRouter = UIComponent.getRouterFor(this);
                oRouter.navTo("homeRoute", {}, true);
            }
        },

        _onObjectMatched: function(oEvent){
            this.getView().bindElement("/Products(" + oEvent.getParameter("arguments").productId+")");
        },

        onProductEdit: function(){
            var oModel = this.getView().getModel('oProductEnableModel');

            var bCurrentState = oModel.getProperty('/isProductsDataEditable');
            oModel.setProperty('/isProductsDataEditable',!bCurrentState);
        },

        onProductSave: function(){
            var oView = this.getView();
            var oContext = oView.getBindingContext();
            var oResourceBundle = oView.getModel("i18n").getResourceBundle();

        
            // Fetch field values
            var sProductName = this.byId('productName').getValue().trim();
            var sQuantityPerUnit = this.byId('quantityPerUnit').getValue().trim();
            var sUnitPrice = this.byId('unitPrice').getValue().trim();
            var sUnitsInStock = this.byId('unitsInStock').getValue().trim();
            var sReorderLevel = this.byId('reorderLevel').getValue().trim();
            var sUnitsOnOrder = this.byId('unitsOnOrder').getValue().trim();
            
            // Validation helper functions
            function isNonEmptyString(value) {
                return typeof value === "string" && value.length > 0;
            }
        
            function isNonNegativeInteger(value) {
                return /^[0-9]+$/.test(value) && parseInt(value) >= 0;
            }
        
            function isPositiveFloat(value) {
                return /^[0-9]+(\.[0-9]{1,2})?$/.test(value) && parseFloat(value) > 0;
            }
        
            // Perform validations
            if (!isNonEmptyString(sProductName)) {
                MessageToast.show(oResourceBundle.getText("errorProductName"));
                
                return;
            }
        
            if (!isNonNegativeInteger(sReorderLevel)) {
                MessageToast.show(oResourceBundle.getText("errorReorderLevel"));
                return;
            }
        
            if (!isNonNegativeInteger(sUnitsInStock)) {
                MessageToast.show(oResourceBundle.getText("errorUnitsInStock"));
                return;
            }
        
            if (!isNonNegativeInteger(sUnitsOnOrder)) {
                MessageToast.show(oResourceBundle.getText("errorUnitsOnOrder"));
                return;
            }
        
            if (!isPositiveFloat(sUnitPrice)) {
                MessageToast.show(oResourceBundle.getText("errorUnitPrice"));
                return;
            }
        
            // Set validated properties to the model
            oContext.setProperty("productName", sProductName);
            oContext.setProperty("quantityPerUnit", sQuantityPerUnit);
            oContext.setProperty("unitPrice", parseFloat(sUnitPrice).toFixed(2)); // Ensure 2 decimal points
            oContext.setProperty("unitsInStock", parseInt(sUnitsInStock, 10));
            oContext.setProperty("reorderLevel", parseInt(sReorderLevel, 10));
            oContext.setProperty("unitsOnOrder", parseInt(sUnitsOnOrder, 10));
        
            // Disable edit mode
            oView.getModel('oProductEnableModel').setProperty('/isProductsDataEditable', false);
        
            // Submit batch
            oView.getModel().submitBatch("updateGroup").then(function () {
                MessageToast.show(oResourceBundle.getText("successMessage"));
                this.getView().getModel().refresh(true);
            }).catch(function (oError) {
                oContext.getModel().resetChanges("updateGroup"); // Reset pending changes
                var sErrorMessage = oError.message || oResourceBundle.getText("defaultErrorMessage");
                if (oError.responseJSON && oError.responseJSON.error) {
                    sErrorMessage = oError.responseJSON.error.message;
                }
                console.error("Error while saving data:", oError);
                MessageToast.show(sErrorMessage);
            });
        }
    });
});