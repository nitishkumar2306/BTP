sap.ui.define([
    "sap/ui/core/mvc/Controller",
    'sap/ui/model/json/JSONModel',
     "sap/ui/core/Fragment"
], (Controller,JSONModel,Fragment) => {
    "use strict";

    return Controller.extend("com.sap.salesinventorymanagementapp.controller.login", {
        onInit() {
            var oModel = new JSONModel();
            oModel.loadData('model/roles.json');
			this.getView().setModel(oModel,"rolesModel");
        },

        async onsignUpClickLogin() {
			if(!this.oDialog){
                this.oDialog = await Fragment.load({
                    name: "com.sap.salesinventorymanagementapp.view.SignUpDialog",
                    controller: this
                });
                this.getView().addDependent(this.oDialog);
            }
            this.oDialog.open();
		},
        async onCloseDialog(){
            this.oDialog.close();
        }
    });
});