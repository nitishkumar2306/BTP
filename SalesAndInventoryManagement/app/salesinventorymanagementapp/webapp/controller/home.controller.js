sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/Filter",
	"sap/ui/model/FilterOperator",
	"sap/ui/model/FilterType",
    "sap/ui/core/UIComponent",
    "sap/ui/model/json/JSONModel"
], (Controller, Filter, FilterOperator, FilterType,UIComponent,JSONModel) => {
    "use strict";

    return Controller.extend("com.sap.salesinventorymanagementapp.controller.home", {
        onInit() {
           
        },
        onSearch: function(){
            var oView = this.getView();
            var sValue = oView.byId("searchField").getValue();
            var oFilter = new Filter({
                path: "productName",
                operator: FilterOperator.Contains,
                value1: sValue,
                caseSensitive: false
            });

            oView.byId("idProductsTable").getBinding("items").filter(oFilter,FilterType.Application);
        },

        onPress: function(oEvent){
            //alert("Button pressed");
            var oRouter = UIComponent.getRouterFor(this);
            var prodId = oEvent.getSource().getBindingContext().getValue().productId;
            oRouter.navTo("detailRoute",{
                productId: prodId
            });
        },

        onProductCreate: function(){
            var createProductDataJSONModel = new JSONModel({
                productId: globalThis.crypto.randomUUID(),
                supplierId: "",
                productName:  "",
                quantityPerUnit:  "",
                unitPrice:  "",
                unitsInStock:  "",
                unitsOnOrder:  "",
                reorderLevel: "",
                discontinued: ""
            });

            this.getView().setModel(createProductDataJSONModel,'productCreateModel');
            
            if (!this.pDialog) {
                this.pDialog = this.loadFragment({
                  name: "com.sap.salesinventorymanagementapp.view.createNewProduct"
                })
              }
              
              this.pDialog.then(function (oDialog) {
                oDialog.open();
              });
        },
        onCloseProductDialog: function () {
            this.byId("productCreateFragmentDialog").close();
        },
        onCreateProductDialog: function(){
            var supplierId = this.byId('supplierCreateFragment').getSelectedKey();
            this.getView().getModel('productCreateModel').setProperty('/supplierId',supplierId);
            this.getView().getModel('productCreateModel').setProperty('/discontinued',false);
            var oView = this.getView();

            var oData = this.getView().getModel('productCreateModel').getData();
            oData.unitPrice = parseFloat(oData.unitPrice);
            oData.unitsInStock = parseInt(oData.unitsInStock, 10);
            oData.unitsOnOrder = parseInt(oData.unitsOnOrder, 10);
            oData.reorderLevel = parseInt(oData.reorderLevel, 10);
            
            this.byId('idProductsTable').getBinding('items').create(this.getView().getModel('productCreateModel').getData())
            .created().then(function () {
                MessageToast.show(oResourceBundle.getText("productCreatedMessage"));
              });
            
            // Submit batch
            oView.setBusy(true);

            function resetBusy() {
                oView.setBusy(false);
            }

            oView.getModel().submitBatch("updateGroup").then(resetBusy, resetBusy);

            this.byId("productCreateFragmentDialog").close();
        }

    });
});