var statusCodeHR = $.context.HR_Details.Response.status;
$.context.HR = {};

if(statusCodeHR >= 200 && statusCodeHR <= 300){
	$.context.HR.email = $.context.HR_Details.Response.value[0].Email;
	$.context.HR.fullname = $.context.HR_Details.Response.value[0].Full_Name;
}

var statusCodeSupportUser = $.context.Support_Details.Response.status;
$.context.Support_User = {};

if(statusCodeSupportUser >= 200 && statustatusCodeSupportUserCodeHR <= 300){
	$.context.Support_User.email = $.context.Support_Details.Response.value[0].Email;
	$.context.Support_User.fullname = $.context.Support_Details.Response.value[0].Full_Name;
	$.context.Support_User.designation = $.context.Support_Details.Response.value[0].Designation;
}