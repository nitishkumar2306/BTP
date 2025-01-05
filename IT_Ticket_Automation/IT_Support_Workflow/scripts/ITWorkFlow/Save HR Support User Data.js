// var statusCodeHR = $.context.HR_Details.Response.status;
$.context.HR = {};

$.context.HR.email = $.context.HR_Details.Response.Email;
$.context.HR.fullname = $.context.HR_Details.Response.Full_Name;


$.context.Support_User = [];

var aEmployee = $.context.Support_Details.Response;
var aLen = aEmployee.length;

for(var i = 0 ; i < i.length ; i++){
	$.context.Support_User.push({
		suppportUserID: i.toString(),
		email: aEmployee[i].Email,
		fullname: aEmployee[i].Full_Name,
		designation: aEmployee[i].Designation,
		employeeID: aEmployee[i].Employee_ID
	})
}
