for(i = 0 ; i < $.context.Support_User.length ; i++){

	if($.context.Support_User[i].employeeID == ""){
		$.context.Support_User.splice(i,1);
	}
}