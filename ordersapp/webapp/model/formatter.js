sap.ui.define([
    "sap/ui/core/ValueState"
], (ValueState) => {
	"use strict";

	return {
		formatterStatus: function(sValue){
            if(sValue <= 20){
                return ValueState.Information;
            }else if(sValue > 20 && sValue < 40){
                return ValueState.Success;
            }else{
                return ValueState.Warning;
            }
        },

        formatterIcon: function(sValue){
            var sIcon;
            if(sValue <= 20){
                 sIcon = "completed";
            }else if(sValue > 20 && sValue < 40){
                sIcon = "in-process";
            }else{
                sIcon = "inactive";
            }
            return "sap-icon://status-"+sIcon;
        },

        formatterFreight: function(fValue){
            return Number(fValue).toFixed(3);
        }
	};
});