
$.context.finalUpdate = {};
$.context.finalUpdate.Request = {};
$.context.finalUpdate.Request.request = [];

var data = {};
var support_user_approve_len = $.context.SupportUserReject.length;

for (var i = 1; i < support_user_approve_len; i++) {

	data = {
		"wfinstance": $.info.workflowInstanceId,
		"ticketType": $.context.TicketType,
		"requester": $.context.requester_ID,
		"HR": $.context.TicketDetails.Response.value[0].HR,
		"supportUsers": $.context.SupportUserReject[i].employeeID
	}
	$.context.finalUpdate.Request.request.push({
		id: (i + 1).toString(),
		method: "POST",
		url: "/Assigned_Support",
		header: {
			"content-type": "application/json;odata.metadata=minimal"
		},
		body: data
	})
}