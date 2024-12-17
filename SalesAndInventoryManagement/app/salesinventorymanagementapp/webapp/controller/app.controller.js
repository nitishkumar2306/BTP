sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("com.sap.salesinventorymanagementapp.controller.app", {
        onInit() {
            var oModel = this.getView().getModel();
            console.log("Model: ", oModel);
        }
    });
});