$.context.HR_Id = $.context.TicketDetails.Response.value[0].HR;
// $.context.Support_Users_Id = $.context.TicketDetails.Response.value[0].Support_Users;
$.context.Support_Users_Id = $.context.TicketDetails.Response.value.map(ticket => ticket.Support_Users).join(',');

$.context.HR_Details = {};
$.context.Support_Users = {};