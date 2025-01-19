sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent",
    "sap/ui/core/routing/History"
], (Controller,UIComponent,History) => {
    "use strict";

    return Controller.extend("com.sap.salesinventorymanagementapp.controller.details", {
        onInit() {
            var oRouter = this.getOwnerComponent().getRouter();
            oRouter.getRoute("detailRoute").attachPatternMatched(this._onObjectMatched, this);
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
        }
    });
});