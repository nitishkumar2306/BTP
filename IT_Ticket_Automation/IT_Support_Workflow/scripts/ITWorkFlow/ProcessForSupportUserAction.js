var Support_len = $.context.Support_User.length;

$.context.SupportUserApprove = [];
$.context.SupportUserReject = [];

$.context.reject_flag = false;
// ${context.Support_User[loop.counter].SupportDecision}
for (var i = 0; i < Support_len; i++) {
	if ($.context.Support_User[i].SupportDecision == 'reject') {
		$.context.reject_flag = true;
		$.context.SupportUserReject.push({
			"Decision": $.context.Support_User[i].SupportDecision,
			"fullname": $.context.Support_User[i].fullname,
			"employeeID": $.context.Support_User[i].employeeID
		});
	}
	else if ($.context.Support_User[i].SupportDecision == 'approve') {
		$.context.SupportUserApprove.push({
			"Decision": $.context.Support_User[i].SupportDecision,
			"fullname": $.context.Support_User[i].fullname,
			"employeeID": $.context.Support_User[i].employeeID
		});

		$.context.Support_User[i].fullname = "";
		$.context.Support_User[i].email= "";
		$.context.Support_User[i].designation = "";
		$.context.Support_User[i].suppportUserID = "";
		$.context.Support_User[i].SupportDecision = "";
		$.context.Support_User[i].employeeID = "";
	}
}

