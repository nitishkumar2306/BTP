sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/Filter",
	"sap/ui/model/FilterOperator",
	"sap/ui/model/FilterType",
    "sap/ui/core/UIComponent"
], (Controller, Filter, FilterOperator, FilterType,UIComponent) => {
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
        }

    });
});