sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/core/UIComponent"
], (Controller,UIComponent) => {
    "use strict";

    return Controller.extend("com.sap.salesinventorymanagementapp.controller.notFound", {
        onInit() {
            
        },
        handleLinkPress: function(){
            //alert("Button pressed");
            var oRouter = UIComponent.getRouterFor(this);
            oRouter.navTo("homeRoute",{} );
        }
    });
});