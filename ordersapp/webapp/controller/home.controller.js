sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/json/JSONModel",
    "sap/ui/model/Sorter",
    "com/orders/ordersapp/model/formatter",
    "sap/ui/model/FilterOperator",
    "sap/ui/core/Fragment",
    "sap/ui/core/UIComponent"
], (Controller,JSONModel,Sorter,Formatter,FilterOperator,Fragment,UIComponent) => {
    "use strict";
    return Controller.extend("com.orders.ordersapp.controller.home", {
        formatter: Formatter,
        onInit() {
            //set data model on view
            const oData = {
                title : "Orders"
            };
            const oModel = new JSONModel(oData);
            this.getView().setModel(oModel,"localModel");

            const ordersData = 
            [
              {
                "OrderID": 10248,
                "CustomerID": "ALFKI",
                "OrderDate": "2024-01-15",
                "ShipName": "Alfred's Futterkiste"
              },
              {
                "OrderID": 10249,
                "CustomerID": "ANATR",
                "OrderDate": "2024-01-16",
                "ShipName": "Ana Trujillo Emparedados y helados"
              },
              {
                "OrderID": 10250,
                "CustomerID": "ANTON",
                "OrderDate": "2024-01-17",
                "ShipName": "Antonio Moreno Taquería"
              },
              {
                "OrderID": 10251,
                "CustomerID": "AROUT",
                "OrderDate": "2024-01-18",
                "ShipName": "Around the Horn"
              }
            ]

            var orderDataModel = new JSONModel(ordersData);
            this.getView().setModel(orderDataModel,'orderData');
        },

        formatDateColor: function(oData){
            if(!oData){
                return "None";
            }

            const compareDate = new Date('1996-07-10');
            const orderDate = new Date(oData);

            if(orderDate < compareDate){
                return "Error";
            }else{
                return "Success";
            }
        },

        onSearch: function(oEvent) {
            const sQuery = oEvent.getParameter("query");
            const oTable = this.byId("idOrdersTable");
            const oBinding = oTable.getBinding("items");
        
            if (sQuery) {
                const aFilters = [];
        
                // If the input can be parsed as an integer, assume it's OrderID
                if (!isNaN(parseInt(sQuery))) {
                    aFilters.push(new sap.ui.model.Filter({
                        path: "OrderID",
                        operator: FilterOperator.EQ,
                        value1: parseInt(sQuery)
                    }));
                }
        
                // Add filter for CustomerID with "Contains" operator for partial matches
                aFilters.push(new sap.ui.model.Filter({
                    path: "CustomerID",
                    operator: FilterOperator.Contains,
                    value1: sQuery.toUpperCase() // Convert to uppercase if backend is case-sensitive
                }));
        
                // Add filter for ShipName with "Contains" operator for partial matches
                aFilters.push(new sap.ui.model.Filter({
                    path: "ShipName",
                    operator: FilterOperator.Contains,
                    value1: sQuery
                }));
        
                // Combine filters with OR logic
                const oFilter = new sap.ui.model.Filter({
                    filters: aFilters,
                    and: false
                });
        
                oBinding.filter(oFilter);
            } else {
                // Clear filters if query is empty
                oBinding.filter([]);
            }
        }
        ,

        onSort: function(){
            // 1. get current view
            var oView = this.getView();

            // 2. load the fragment
            if(!this.byId('sortDialog')){
                Fragment.load({
                    id: oView.getId(),
                    name: "com.orders.ordersapp.fragments.SortDialog",
                    controller: this
                }).then(function(oDialog){
                    // 3. open dialog
                    //connect the dialog to the root view of the component
                    //(dialog will inherit with the models, life cycles of the root view)
                    oView.addDependent(oDialog);
                    oDialog.open();
                })
            }else{
                this.byId('sortDialog').open();
            }
        },

        onSortDialogConfirm: function(oEvent){
            const oTable = this.byId('idOrdersTable');
            const mParams = oEvent.getParameters();
            const sPath = mParams.sortItem.getKey();
            const bDescending = mParams.sortDescending;
            const aSorters = [];

            aSorters.push(new Sorter(sPath, bDescending));
            oTable.getBinding('items').sort(aSorters);
        },

        onGroup: function(){
            // 1. get the current view
            var oView = this.getView();
            // 2. load the fragment
            if(!this.byId('groupDialog')){
                Fragment.load({
                    id: oView.getId(),
                    name: 'com.orders.ordersapp.fragments.GroupDialog',
                    controller: this
                }).then((gDialog)=>{
                // 3. open the dialog and connect the fragment with the root component to
                // link the lisfe cycle methods
                    oView.addDependent(gDialog);
                    gDialog.open();
                })
            }else {
                this.byId('groupDialog').open();
            }
        }, 
        
        onGroupDialogConfirm: function(oEvent) {
            const oTable = this.byId('idOrdersTable');
            const mParams = oEvent.getParameters();
            const sPath = mParams.groupItem.getKey();
            const bDescending = mParams.groupDescending;
            const vGroup = true;
            const aSorters = [];
        
            aSorters.push(new Sorter(sPath, bDescending, vGroup));
            oTable.getBinding('items').sort(aSorters);
        },

        onPress: function(oEvent){
            //alert('onPress event triggered');
            var oRouter = UIComponent.getRouterFor(this);
            var oItem = oEvent.getSource();
            oRouter.navTo("RouteDetails",{
                OrderID: oItem.getBindingContext().getObject().OrderID
            });
        }
        
    });
});