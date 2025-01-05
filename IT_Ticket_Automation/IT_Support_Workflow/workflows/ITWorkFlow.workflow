{
	"contents": {
		"e7550257-dbf8-43b8-b9da-e4627de6584b": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "itworkflow",
			"subject": "ITWorkFlow",
			"name": "ITWorkFlow",
			"documentation": "Workflow for handling IT Tickets",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				},
				"4cbf48bc-9289-4d52-b409-493c156c98d7": {
					"name": "End Workflow"
				}
			},
			"activities": {
				"1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0": {
					"name": "Requester"
				},
				"0b2cc36b-f4a3-45f8-9142-c7106864b8b3": {
					"name": "Requester Decision"
				},
				"bf7a91f4-a130-42f7-9f0d-41c5869095c2": {
					"name": "HR"
				},
				"6efdb04b-72cf-474a-b963-64502a1df7a8": {
					"name": "Get Ticket Details"
				},
				"5073a666-7499-4a81-9df5-ec9fff9e8631": {
					"name": "Initialize"
				},
				"110acee8-e64b-45f2-a245-5662f3ab0009": {
					"name": "Manage Employees"
				},
				"4c1a6838-7ca0-4a4f-9732-6008a515fcbd": {
					"name": "Get HR Details"
				},
				"d6c87b16-e3ce-4aaf-93aa-96d038d49cba": {
					"name": "Get Support Details"
				},
				"135387f1-2af1-4720-9ed3-11d72e92a76c": {
					"name": "Manager HR Support User Data"
				},
				"03541890-2eef-4b60-8fc6-88c5b88f96e4": {
					"name": "HR Decision"
				},
				"0595db07-7171-4a53-9527-4b379f342f10": {
					"name": "ExclusiveGateway3"
				},
				"e0841a62-9381-424e-9696-dba78e7eb7d4": {
					"name": "DB Update"
				},
				"474b7e8c-77c6-4735-921b-787213af248a": {
					"name": "Final Update Payload"
				},
				"2fb864b0-f18d-4126-b7fa-5cd2e95dd289": {
					"name": "IT Support Subflow"
				},
				"6c98d12e-e62e-4104-a38c-067e6788cbd7": {
					"name": "is reject all?"
				},
				"2d90fde6-de67-4217-810e-abebcb82e5f2": {
					"name": "Process For Reject All"
				},
				"a660519b-5844-42e9-97fc-326d2b8008f1": {
					"name": "Process For Support User Action"
				},
				"33cf2715-ca86-421f-942e-10ff34359612": {
					"name": "is Reject?"
				},
				"cc53e0f5-8ff7-4d9b-840c-f9e890371425": {
					"name": "Empty Support User"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"4a62da83-6202-4509-9c89-8a7406bd9777": {
					"name": "SequenceFlow2"
				},
				"72eab23f-e4fa-468a-9607-edfc6f2124b5": {
					"name": "Requester Submit"
				},
				"bdb13301-a1dd-4b2d-8f5f-3a0d18b21198": {
					"name": "Requester Cancel"
				},
				"4a8b4f81-7d75-41a1-b315-e45a72c28d90": {
					"name": "SequenceFlow6"
				},
				"4ad0fa7e-8de1-4ddc-b75d-af2ca6a4b933": {
					"name": "SequenceFlow8"
				},
				"7fb9f147-2f5f-4492-b351-1aff1e016859": {
					"name": "SequenceFlow9"
				},
				"2c5bc6f5-d689-420d-8d3c-31300364e252": {
					"name": "SequenceFlow10"
				},
				"c00beadd-2c6a-4e5a-85b0-d69b187ab995": {
					"name": "SequenceFlow11"
				},
				"b69d0c3f-9d94-46c6-844b-da3ff0294ff6": {
					"name": "SequenceFlow12"
				},
				"c64057c0-6ad7-4390-aaea-6f663841f30f": {
					"name": "Rework"
				},
				"1958e2a7-8bb6-422d-859d-27b4a48e3f16": {
					"name": "Reject"
				},
				"9ec5fdee-eaae-401d-aee6-45586d3447cb": {
					"name": "Reject Flow"
				},
				"f9564ab8-f1a9-4ad4-a2cf-b1ddba44fb3b": {
					"name": "Approve Flow"
				},
				"e058fda7-82cd-46ec-8bc9-6499340fccd7": {
					"name": "SequenceFlow24"
				},
				"eb0112e6-c168-4ddc-9921-83bebdbaff29": {
					"name": "SequenceFlow25"
				},
				"fc292364-3e0a-4b50-b556-6fc99755e921": {
					"name": "SequenceFlow27"
				},
				"96ad1712-e1b0-42b8-a832-0f3a94e8fb3c": {
					"name": "reject_all_yes"
				},
				"54dc3f05-230e-4786-a980-7a884c2f0c1e": {
					"name": "SequenceFlow30"
				},
				"ee9a3686-0901-403e-a0ea-53b40e8a9adb": {
					"name": "reject_all_no"
				},
				"bcbb3c1f-53f9-4e45-94bb-fd0340601179": {
					"name": "SequenceFlow32"
				},
				"5dc387ff-9c94-4ce1-b599-b24bc9d5a20a": {
					"name": "No"
				},
				"8e9ee77c-5101-47a2-a4a5-d630a8e5f6cd": {
					"name": "Yes"
				},
				"f4b6d1bc-4f9b-42c2-b775-c5ac708a74bb": {
					"name": "SequenceFlow36"
				},
				"16c86382-8253-410e-bd5a-8c576eac94b9": {
					"name": "approve"
				},
				"caa4df8f-6bf1-4251-949d-5ab5f300e964": {
					"name": "SequenceFlow38"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"ed9c704c-02ad-4949-8a3e-51a042a768eb": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"4cbf48bc-9289-4d52-b409-493c156c98d7": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "End Workflow"
		},
		"1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Request Form",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.requester}",
			"formReference": "/forms/ITWorkFlow/RequesterForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "requesterform"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask1",
			"name": "Requester",
			"documentation": "User Task for Requester"
		},
		"0b2cc36b-f4a3-45f8-9142-c7106864b8b3": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Requester Decision",
			"default": "72eab23f-e4fa-468a-9607-edfc6f2124b5"
		},
		"bf7a91f4-a130-42f7-9f0d-41c5869095c2": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "HR Ticket Detail Form",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.HR_Details.Response.Email}",
			"formReference": "/forms/ITWorkFlow/HRUserTask2Form.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "hrusertask2form"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask2",
			"name": "HR"
		},
		"6efdb04b-72cf-474a-b963-64502a1df7a8": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "IT_Ticket_Automation_Srv_Destination",
			"destinationSource": "consumer",
			"path": "/odata/v4/ticket-/IT_Tickets?$filter=Ticket_Type eq '${context.TicketType}'",
			"httpMethod": "GET",
			"responseVariable": "${context.TicketDetails.Response}",
			"id": "servicetask1",
			"name": "Get Ticket Details"
		},
		"5073a666-7499-4a81-9df5-ec9fff9e8631": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/initialize.js",
			"id": "scripttask2",
			"name": "Initialize"
		},
		"110acee8-e64b-45f2-a245-5662f3ab0009": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/ManageEmployees.js",
			"id": "scripttask3",
			"name": "Manage Employees"
		},
		"4c1a6838-7ca0-4a4f-9732-6008a515fcbd": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "IT_Ticket_Automation_Srv_Destination",
			"destinationSource": "consumer",
			"path": "/odata/v4/ticket-/Employee(${context.HR_Id})",
			"httpMethod": "GET",
			"responseVariable": "${context.HR_Details.Response}",
			"id": "servicetask2",
			"name": "Get HR Details"
		},
		"d6c87b16-e3ce-4aaf-93aa-96d038d49cba": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "IT_Ticket_Automation_Srv_Destination",
			"destinationSource": "consumer",
			"path": "/odata/v4/ticket-/Employee?$filter=Employee_ID in (${context.Support_Users_Id})",
			"httpMethod": "GET",
			"responseVariable": "${context.Support_Details.Response}",
			"id": "servicetask3",
			"name": "Get Support Details"
		},
		"135387f1-2af1-4720-9ed3-11d72e92a76c": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/Save HR Support User Data.js",
			"id": "scripttask4",
			"name": "Manager HR Support User Data"
		},
		"03541890-2eef-4b60-8fc6-88c5b88f96e4": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway2",
			"name": "HR Decision",
			"default": "16c86382-8253-410e-bd5a-8c576eac94b9"
		},
		"0595db07-7171-4a53-9527-4b379f342f10": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "ExclusiveGateway3",
			"default": "f9564ab8-f1a9-4ad4-a2cf-b1ddba44fb3b"
		},
		"e0841a62-9381-424e-9696-dba78e7eb7d4": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "IT_Ticket_Automation_Srv_Destination",
			"destinationSource": "consumer",
			"path": "/odata/v4/ticket-/$batch",
			"httpMethod": "POST",
			"requestVariable": "${context.finalUpdate.Request}",
			"responseVariable": "${context.finalUpdate.Response}",
			"id": "servicetask4",
			"name": "DB Update",
			"documentation": "Current transaction DB update"
		},
		"474b7e8c-77c6-4735-921b-787213af248a": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/finalUpdatePayload.js",
			"id": "scripttask5",
			"name": "Final Update Payload"
		},
		"2fb864b0-f18d-4126-b7fa-5cd2e95dd289": {
			"classDefinition": "com.sap.bpm.wfs.ReferencedSubflow",
			"definitionId": "itsupport_subflow",
			"multiInstanceLoopCharacteristics": {
				"type": "parallel",
				"collection": "${context.Support_User}",
				"completionCondition": "${context.Support_User[loop.counter].SupportDecision == 'reject_all'}"
			},
			"inParameters": [{
				"sourceExpression": "${context.Support_User[loop.counter].employeeID}",
				"targetVariable": "${context.Support_User.employeeID}"
			}, {
				"sourceExpression": "${context.Support_User[loop.counter].email}",
				"targetVariable": "${context.Support_User.email}"
			}, {
				"sourceExpression": "${context.Support_User[loop.counter].fullname}",
				"targetVariable": "${context.Support_User.fullname}"
			}, {
				"sourceExpression": "${context.Support_User[loop.counter].designation}",
				"targetVariable": "${context.Support_User.designation}"
			}, {
				"sourceExpression": "${context.Support_User[loop.counter].suppportUserID}",
				"targetVariable": "${context.Support_User.suppportUserID}"
			}, {
				"sourceExpression": "${context.requester}",
				"targetVariable": "${context.requester}"
			}, {
				"sourceExpression": "${context.TicketType}",
				"targetVariable": "${context.TicketType}"
			}, {
				"sourceExpression": "${context.Description}",
				"targetVariable": "${context.Description}"
			}, {
				"sourceExpression": "${context.HR}",
				"targetVariable": "${context.HR}"
			}],
			"outParameters": [{
				"sourceExpression": "${context.Decision}",
				"targetVariable": "${context.Support_User[loop.counter].SupportDecision}"
			}],
			"id": "referencedsubflow2",
			"name": "IT Support Subflow"
		},
		"6c98d12e-e62e-4104-a38c-067e6788cbd7": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway4",
			"name": "is reject all?",
			"default": "ee9a3686-0901-403e-a0ea-53b40e8a9adb"
		},
		"2d90fde6-de67-4217-810e-abebcb82e5f2": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/Process_Reject_All.js",
			"id": "scripttask6",
			"name": "Process For Reject All"
		},
		"a660519b-5844-42e9-97fc-326d2b8008f1": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/ProcessForSupportUserAction.js",
			"id": "scripttask7",
			"name": "Process For Support User Action"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0"
		},
		"4a62da83-6202-4509-9c89-8a7406bd9777": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0",
			"targetRef": "0b2cc36b-f4a3-45f8-9142-c7106864b8b3"
		},
		"72eab23f-e4fa-468a-9607-edfc6f2124b5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "Requester Submit",
			"sourceRef": "0b2cc36b-f4a3-45f8-9142-c7106864b8b3",
			"targetRef": "5073a666-7499-4a81-9df5-ec9fff9e8631"
		},
		"bdb13301-a1dd-4b2d-8f5f-3a0d18b21198": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"cancel\"}",
			"id": "sequenceflow4",
			"name": "Requester Cancel",
			"sourceRef": "0b2cc36b-f4a3-45f8-9142-c7106864b8b3",
			"targetRef": "4cbf48bc-9289-4d52-b409-493c156c98d7"
		},
		"4a8b4f81-7d75-41a1-b315-e45a72c28d90": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "6efdb04b-72cf-474a-b963-64502a1df7a8",
			"targetRef": "110acee8-e64b-45f2-a245-5662f3ab0009"
		},
		"4ad0fa7e-8de1-4ddc-b75d-af2ca6a4b933": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "5073a666-7499-4a81-9df5-ec9fff9e8631",
			"targetRef": "6efdb04b-72cf-474a-b963-64502a1df7a8"
		},
		"7fb9f147-2f5f-4492-b351-1aff1e016859": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow9",
			"name": "SequenceFlow9",
			"sourceRef": "110acee8-e64b-45f2-a245-5662f3ab0009",
			"targetRef": "4c1a6838-7ca0-4a4f-9732-6008a515fcbd"
		},
		"2c5bc6f5-d689-420d-8d3c-31300364e252": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow10",
			"name": "SequenceFlow10",
			"sourceRef": "4c1a6838-7ca0-4a4f-9732-6008a515fcbd",
			"targetRef": "d6c87b16-e3ce-4aaf-93aa-96d038d49cba"
		},
		"c00beadd-2c6a-4e5a-85b0-d69b187ab995": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow11",
			"name": "SequenceFlow11",
			"sourceRef": "d6c87b16-e3ce-4aaf-93aa-96d038d49cba",
			"targetRef": "135387f1-2af1-4720-9ed3-11d72e92a76c"
		},
		"b69d0c3f-9d94-46c6-844b-da3ff0294ff6": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "135387f1-2af1-4720-9ed3-11d72e92a76c",
			"targetRef": "bf7a91f4-a130-42f7-9f0d-41c5869095c2"
		},
		"c64057c0-6ad7-4390-aaea-6f663841f30f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask2.last.decision == \"rework\"}",
			"id": "sequenceflow14",
			"name": "Rework",
			"sourceRef": "03541890-2eef-4b60-8fc6-88c5b88f96e4",
			"targetRef": "1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0"
		},
		"1958e2a7-8bb6-422d-859d-27b4a48e3f16": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask2.last.decision == \"reject\"}",
			"id": "sequenceflow15",
			"name": "Reject",
			"sourceRef": "03541890-2eef-4b60-8fc6-88c5b88f96e4",
			"targetRef": "4cbf48bc-9289-4d52-b409-493c156c98d7"
		},
		"9ec5fdee-eaae-401d-aee6-45586d3447cb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask3.last.decision == \"reject\"}",
			"id": "sequenceflow22",
			"name": "Reject Flow",
			"sourceRef": "0595db07-7171-4a53-9527-4b379f342f10",
			"targetRef": "bf7a91f4-a130-42f7-9f0d-41c5869095c2"
		},
		"f9564ab8-f1a9-4ad4-a2cf-b1ddba44fb3b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow23",
			"name": "Approve Flow",
			"sourceRef": "0595db07-7171-4a53-9527-4b379f342f10",
			"targetRef": "474b7e8c-77c6-4735-921b-787213af248a"
		},
		"e058fda7-82cd-46ec-8bc9-6499340fccd7": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow24",
			"name": "SequenceFlow24",
			"sourceRef": "e0841a62-9381-424e-9696-dba78e7eb7d4",
			"targetRef": "33cf2715-ca86-421f-942e-10ff34359612"
		},
		"eb0112e6-c168-4ddc-9921-83bebdbaff29": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow25",
			"name": "SequenceFlow25",
			"sourceRef": "474b7e8c-77c6-4735-921b-787213af248a",
			"targetRef": "e0841a62-9381-424e-9696-dba78e7eb7d4"
		},
		"fc292364-3e0a-4b50-b556-6fc99755e921": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow27",
			"name": "SequenceFlow27",
			"sourceRef": "2fb864b0-f18d-4126-b7fa-5cd2e95dd289",
			"targetRef": "2d90fde6-de67-4217-810e-abebcb82e5f2"
		},
		"96ad1712-e1b0-42b8-a832-0f3a94e8fb3c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.reject_all_flag == true}",
			"id": "sequenceflow29",
			"name": "reject_all_yes",
			"sourceRef": "6c98d12e-e62e-4104-a38c-067e6788cbd7",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"54dc3f05-230e-4786-a980-7a884c2f0c1e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow30",
			"name": "SequenceFlow30",
			"sourceRef": "2d90fde6-de67-4217-810e-abebcb82e5f2",
			"targetRef": "6c98d12e-e62e-4104-a38c-067e6788cbd7"
		},
		"ee9a3686-0901-403e-a0ea-53b40e8a9adb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow31",
			"name": "reject_all_no",
			"sourceRef": "6c98d12e-e62e-4104-a38c-067e6788cbd7",
			"targetRef": "a660519b-5844-42e9-97fc-326d2b8008f1"
		},
		"bcbb3c1f-53f9-4e45-94bb-fd0340601179": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow32",
			"name": "SequenceFlow32",
			"sourceRef": "a660519b-5844-42e9-97fc-326d2b8008f1",
			"targetRef": "0595db07-7171-4a53-9527-4b379f342f10"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"77a3412c-63ca-4f98-9720-1bb31646d99a": {},
				"04e804c9-b3f4-4856-8625-a194787ec1c9": {},
				"d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d": {},
				"90108c3a-fa76-4459-811b-de67a190e320": {},
				"8f9aceef-ba31-49c5-9189-6792e83c63f6": {},
				"b2822d15-1d8d-412d-bf68-7e2cd88e5b6a": {},
				"a343a8fe-8933-4406-ae37-128ccc6d8404": {},
				"c544670e-4401-494e-ae84-f092a678efda": {},
				"44dcc4ff-56dc-4dc6-9616-04b5c17d3fed": {},
				"72a5bc14-6b61-4b42-81b9-1c5c1d81327f": {},
				"9d8123a7-6dea-4091-8977-b771a1854a55": {},
				"f83bf8b6-a869-4ae4-b3df-e78d2478c898": {},
				"a3cb984d-8cb8-42f1-94d0-afbe7fb3ea6e": {},
				"90949a2c-2b32-476a-a57b-e662185f488f": {},
				"f1d18b65-ed56-43c7-8022-b08aee84330b": {},
				"e5b9a25b-df8a-4c9f-ab5a-b2fae01bbabb": {},
				"ff7df2df-453a-4279-9746-d01a7eea2eec": {},
				"ec1fd11a-1b25-46f0-bea3-1462815aefaa": {},
				"abc14bbf-4d36-4fd5-ab92-687dcf1ea7aa": {},
				"96b9fb05-e2f0-4fd1-915f-004f846dd8e8": {},
				"552b991f-0878-4907-ba50-b419db96d734": {},
				"2e2ab59f-ed70-4fca-b400-d8322c48714c": {},
				"9e4dd18f-4358-405d-8289-c7035130cc87": {},
				"dfa464f1-cf6c-498c-a7ee-84279bbc252e": {},
				"de14e916-f8dd-43f2-86e5-59e6f4201278": {},
				"4d2086ce-609b-4df6-a469-6f0a301fa380": {},
				"d1d7b8eb-cabc-4079-a11b-9260e73296e1": {},
				"f2e85f73-8880-46d8-a0fd-b9558f0d2c6f": {},
				"b8aa07c7-bb4f-4846-8d56-7dca4c22fbb1": {},
				"633a193c-787b-4082-8731-4ed32decbaad": {},
				"2a2071c3-b1b5-49ca-8c69-9e45e5727e48": {},
				"aad30928-a2e2-40c1-bb7a-a3d399a88cb2": {},
				"6001d8fd-e7d5-4d4a-88a3-47fa8859cd1c": {},
				"5c6369f8-7a20-4c33-a58e-1efae3d7f1b2": {},
				"40626815-dd55-4fc9-ad10-be3813c8c512": {},
				"3d5fc0e2-8ead-4f8e-a54c-74b1818b831e": {},
				"ffcd684f-fa37-47b9-967f-7f157e6a8d26": {},
				"fc41bf3b-f22f-4d06-a00b-c86138d820c4": {},
				"55814c34-352d-436c-9577-e98fd582b89a": {},
				"a039cc2b-8abf-45e3-a4d6-f9f66b9ecc85": {},
				"dbf32bbb-f0e0-4186-ab6d-e4cd1f1e2dcd": {},
				"0e857b6e-ce14-4dee-ac95-9a16037dccb2": {},
				"9d9a4d72-8905-4843-affa-427f852b56a4": {},
				"082be11e-763a-4763-b5f4-6f3f2a96e2cd": {},
				"9c650585-c29c-4f8f-b9fe-890752917d41": {}
			}
		},
		"ed9c704c-02ad-4949-8a3e-51a042a768eb": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/ITWorkFlow/InitialContext.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": -188,
			"y": 105,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 2551,
			"y": 107,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-172,121 -25,121",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "77a3412c-63ca-4f98-9720-1bb31646d99a",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"77a3412c-63ca-4f98-9720-1bb31646d99a": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": -75,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0"
		},
		"04e804c9-b3f4-4856-8625-a194787ec1c9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "-25,121 85,121",
			"sourceSymbol": "77a3412c-63ca-4f98-9720-1bb31646d99a",
			"targetSymbol": "d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d",
			"object": "4a62da83-6202-4509-9c89-8a7406bd9777"
		},
		"d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 64,
			"y": 100,
			"object": "0b2cc36b-f4a3-45f8-9142-c7106864b8b3"
		},
		"90108c3a-fa76-4459-811b-de67a190e320": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "85,121 242,121",
			"sourceSymbol": "d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d",
			"targetSymbol": "72a5bc14-6b61-4b42-81b9-1c5c1d81327f",
			"object": "72eab23f-e4fa-468a-9607-edfc6f2124b5"
		},
		"8f9aceef-ba31-49c5-9189-6792e83c63f6": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 67.5,
			"y": 276.5,
			"width": 35,
			"height": 35,
			"object": "4cbf48bc-9289-4d52-b409-493c156c98d7"
		},
		"b2822d15-1d8d-412d-bf68-7e2cd88e5b6a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "85,121 85,277",
			"sourceSymbol": "d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d",
			"targetSymbol": "8f9aceef-ba31-49c5-9189-6792e83c63f6",
			"object": "bdb13301-a1dd-4b2d-8f5f-3a0d18b21198"
		},
		"a343a8fe-8933-4406-ae37-128ccc6d8404": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1038,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "bf7a91f4-a130-42f7-9f0d-41c5869095c2"
		},
		"c544670e-4401-494e-ae84-f092a678efda": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 342,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "6efdb04b-72cf-474a-b963-64502a1df7a8"
		},
		"44dcc4ff-56dc-4dc6-9616-04b5c17d3fed": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "392,121 530,121",
			"sourceSymbol": "c544670e-4401-494e-ae84-f092a678efda",
			"targetSymbol": "f83bf8b6-a869-4ae4-b3df-e78d2478c898",
			"object": "4a8b4f81-7d75-41a1-b315-e45a72c28d90"
		},
		"72a5bc14-6b61-4b42-81b9-1c5c1d81327f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 192,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "5073a666-7499-4a81-9df5-ec9fff9e8631"
		},
		"9d8123a7-6dea-4091-8977-b771a1854a55": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "242,121 392,121",
			"sourceSymbol": "72a5bc14-6b61-4b42-81b9-1c5c1d81327f",
			"targetSymbol": "c544670e-4401-494e-ae84-f092a678efda",
			"object": "4ad0fa7e-8de1-4ddc-b75d-af2ca6a4b933"
		},
		"f83bf8b6-a869-4ae4-b3df-e78d2478c898": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 480,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "110acee8-e64b-45f2-a245-5662f3ab0009"
		},
		"a3cb984d-8cb8-42f1-94d0-afbe7fb3ea6e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "530,121 673,121",
			"sourceSymbol": "f83bf8b6-a869-4ae4-b3df-e78d2478c898",
			"targetSymbol": "90949a2c-2b32-476a-a57b-e662185f488f",
			"object": "7fb9f147-2f5f-4492-b351-1aff1e016859"
		},
		"90949a2c-2b32-476a-a57b-e662185f488f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 623,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "4c1a6838-7ca0-4a4f-9732-6008a515fcbd"
		},
		"f1d18b65-ed56-43c7-8022-b08aee84330b": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "673,121 809.5,121",
			"sourceSymbol": "90949a2c-2b32-476a-a57b-e662185f488f",
			"targetSymbol": "e5b9a25b-df8a-4c9f-ab5a-b2fae01bbabb",
			"object": "2c5bc6f5-d689-420d-8d3c-31300364e252"
		},
		"e5b9a25b-df8a-4c9f-ab5a-b2fae01bbabb": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 759.5,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "d6c87b16-e3ce-4aaf-93aa-96d038d49cba"
		},
		"ff7df2df-453a-4279-9746-d01a7eea2eec": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "809.5,121 962.75,121",
			"sourceSymbol": "e5b9a25b-df8a-4c9f-ab5a-b2fae01bbabb",
			"targetSymbol": "ec1fd11a-1b25-46f0-bea3-1462815aefaa",
			"object": "c00beadd-2c6a-4e5a-85b0-d69b187ab995"
		},
		"ec1fd11a-1b25-46f0-bea3-1462815aefaa": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 912.75,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "135387f1-2af1-4720-9ed3-11d72e92a76c"
		},
		"abc14bbf-4d36-4fd5-ab92-687dcf1ea7aa": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "962.75,121 1088,121",
			"sourceSymbol": "ec1fd11a-1b25-46f0-bea3-1462815aefaa",
			"targetSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"object": "b69d0c3f-9d94-46c6-844b-da3ff0294ff6"
		},
		"96b9fb05-e2f0-4fd1-915f-004f846dd8e8": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1170,
			"y": 100,
			"object": "03541890-2eef-4b60-8fc6-88c5b88f96e4"
		},
		"552b991f-0878-4907-ba50-b419db96d734": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1191,121 1191,-24 597.5,-24 597.5,40.5 -25,40.5 -25,91.5",
			"sourceSymbol": "96b9fb05-e2f0-4fd1-915f-004f846dd8e8",
			"targetSymbol": "77a3412c-63ca-4f98-9720-1bb31646d99a",
			"object": "c64057c0-6ad7-4390-aaea-6f663841f30f"
		},
		"2e2ab59f-ed70-4fca-b400-d8322c48714c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1191,142 1191,294 102.5,294",
			"sourceSymbol": "96b9fb05-e2f0-4fd1-915f-004f846dd8e8",
			"targetSymbol": "8f9aceef-ba31-49c5-9189-6792e83c63f6",
			"object": "1958e2a7-8bb6-422d-859d-27b4a48e3f16"
		},
		"9e4dd18f-4358-405d-8289-c7035130cc87": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1881,
			"y": 100,
			"object": "0595db07-7171-4a53-9527-4b379f342f10"
		},
		"dfa464f1-cf6c-498c-a7ee-84279bbc252e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1902,121 1902,201.5 1088,201.5 1088,150.5",
			"sourceSymbol": "9e4dd18f-4358-405d-8289-c7035130cc87",
			"targetSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"object": "9ec5fdee-eaae-401d-aee6-45586d3447cb"
		},
		"de14e916-f8dd-43f2-86e5-59e6f4201278": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 2132,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "e0841a62-9381-424e-9696-dba78e7eb7d4"
		},
		"4d2086ce-609b-4df6-a469-6f0a301fa380": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1902,121 2053,121",
			"sourceSymbol": "9e4dd18f-4358-405d-8289-c7035130cc87",
			"targetSymbol": "f2e85f73-8880-46d8-a0fd-b9558f0d2c6f",
			"object": "f9564ab8-f1a9-4ad4-a2cf-b1ddba44fb3b"
		},
		"d1d7b8eb-cabc-4079-a11b-9260e73296e1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "2182,121 2314.75,121",
			"sourceSymbol": "de14e916-f8dd-43f2-86e5-59e6f4201278",
			"targetSymbol": "55814c34-352d-436c-9577-e98fd582b89a",
			"object": "e058fda7-82cd-46ec-8bc9-6499340fccd7"
		},
		"f2e85f73-8880-46d8-a0fd-b9558f0d2c6f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 2003,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "474b7e8c-77c6-4735-921b-787213af248a"
		},
		"b8aa07c7-bb4f-4846-8d56-7dca4c22fbb1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "2053,121 2182,121",
			"sourceSymbol": "f2e85f73-8880-46d8-a0fd-b9558f0d2c6f",
			"targetSymbol": "de14e916-f8dd-43f2-86e5-59e6f4201278",
			"object": "eb0112e6-c168-4ddc-9921-83bebdbaff29"
		},
		"633a193c-787b-4082-8731-4ed32decbaad": {
			"classDefinition": "com.sap.bpm.wfs.ui.ReferencedSubflowSymbol",
			"x": 1379.5,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "2fb864b0-f18d-4126-b7fa-5cd2e95dd289"
		},
		"2a2071c3-b1b5-49ca-8c69-9e45e5727e48": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1429.5,121 1549.25,121",
			"sourceSymbol": "633a193c-787b-4082-8731-4ed32decbaad",
			"targetSymbol": "5c6369f8-7a20-4c33-a58e-1efae3d7f1b2",
			"object": "fc292364-3e0a-4b50-b556-6fc99755e921"
		},
		"aad30928-a2e2-40c1-bb7a-a3d399a88cb2": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1621.5,
			"y": 100,
			"object": "6c98d12e-e62e-4104-a38c-067e6788cbd7"
		},
		"6001d8fd-e7d5-4d4a-88a3-47fa8859cd1c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1642.5,122.75 1642.5,-46 2568.5,-46 2568.5,122.75",
			"sourceSymbol": "aad30928-a2e2-40c1-bb7a-a3d399a88cb2",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "96ad1712-e1b0-42b8-a832-0f3a94e8fb3c"
		},
		"5c6369f8-7a20-4c33-a58e-1efae3d7f1b2": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1499.25,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "2d90fde6-de67-4217-810e-abebcb82e5f2"
		},
		"40626815-dd55-4fc9-ad10-be3813c8c512": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1549.25,121 1642.5,121",
			"sourceSymbol": "5c6369f8-7a20-4c33-a58e-1efae3d7f1b2",
			"targetSymbol": "aad30928-a2e2-40c1-bb7a-a3d399a88cb2",
			"object": "54dc3f05-230e-4786-a980-7a884c2f0c1e"
		},
		"3d5fc0e2-8ead-4f8e-a54c-74b1818b831e": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1739.5,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "a660519b-5844-42e9-97fc-326d2b8008f1"
		},
		"ffcd684f-fa37-47b9-967f-7f157e6a8d26": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1642.5,121 1789.5,121",
			"sourceSymbol": "aad30928-a2e2-40c1-bb7a-a3d399a88cb2",
			"targetSymbol": "3d5fc0e2-8ead-4f8e-a54c-74b1818b831e",
			"object": "ee9a3686-0901-403e-a0ea-53b40e8a9adb"
		},
		"fc41bf3b-f22f-4d06-a00b-c86138d820c4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1789.5,121 1902,121",
			"sourceSymbol": "3d5fc0e2-8ead-4f8e-a54c-74b1818b831e",
			"targetSymbol": "9e4dd18f-4358-405d-8289-c7035130cc87",
			"object": "bcbb3c1f-53f9-4e45-94bb-fd0340601179"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 1,
			"maildefinition": 1,
			"sequenceflow": 38,
			"startevent": 1,
			"endevent": 3,
			"usertask": 3,
			"servicetask": 4,
			"scripttask": 8,
			"mailtask": 1,
			"exclusivegateway": 5,
			"referencedsubflow": 2
		},
		"33cf2715-ca86-421f-942e-10ff34359612": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway5",
			"name": "is Reject?",
			"default": "5dc387ff-9c94-4ce1-b599-b24bc9d5a20a"
		},
		"55814c34-352d-436c-9577-e98fd582b89a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 2293.75,
			"y": 100,
			"object": "33cf2715-ca86-421f-942e-10ff34359612"
		},
		"5dc387ff-9c94-4ce1-b599-b24bc9d5a20a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow33",
			"name": "No",
			"sourceRef": "33cf2715-ca86-421f-942e-10ff34359612",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"a039cc2b-8abf-45e3-a4d6-f9f66b9ecc85": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "2314.75,122.75 2568.5,122.75",
			"sourceSymbol": "55814c34-352d-436c-9577-e98fd582b89a",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "5dc387ff-9c94-4ce1-b599-b24bc9d5a20a"
		},
		"8e9ee77c-5101-47a2-a4a5-d630a8e5f6cd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.reject_flag}",
			"id": "sequenceflow34",
			"name": "Yes",
			"sourceRef": "33cf2715-ca86-421f-942e-10ff34359612",
			"targetRef": "bf7a91f4-a130-42f7-9f0d-41c5869095c2"
		},
		"dbf32bbb-f0e0-4186-ab6d-e4cd1f1e2dcd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "2314.75,100 2314.75,40.5 1070,40.5 1070,90.5",
			"sourceSymbol": "55814c34-352d-436c-9577-e98fd582b89a",
			"targetSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"object": "8e9ee77c-5101-47a2-a4a5-d630a8e5f6cd"
		},
		"cc53e0f5-8ff7-4d9b-840c-f9e890371425": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/EmptySupportUser.js",
			"id": "scripttask8",
			"name": "Empty Support User"
		},
		"0e857b6e-ce14-4dee-ac95-9a16037dccb2": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1262,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "cc53e0f5-8ff7-4d9b-840c-f9e890371425"
		},
		"f4b6d1bc-4f9b-42c2-b775-c5ac708a74bb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow36",
			"name": "SequenceFlow36",
			"sourceRef": "cc53e0f5-8ff7-4d9b-840c-f9e890371425",
			"targetRef": "2fb864b0-f18d-4126-b7fa-5cd2e95dd289"
		},
		"9d9a4d72-8905-4843-affa-427f852b56a4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1312,121 1440,121",
			"sourceSymbol": "0e857b6e-ce14-4dee-ac95-9a16037dccb2",
			"targetSymbol": "633a193c-787b-4082-8731-4ed32decbaad",
			"object": "f4b6d1bc-4f9b-42c2-b775-c5ac708a74bb"
		},
		"16c86382-8253-410e-bd5a-8c576eac94b9": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow37",
			"name": "approve",
			"sourceRef": "03541890-2eef-4b60-8fc6-88c5b88f96e4",
			"targetRef": "cc53e0f5-8ff7-4d9b-840c-f9e890371425"
		},
		"082be11e-763a-4763-b5f4-6f3f2a96e2cd": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1191,124 1302,124",
			"sourceSymbol": "96b9fb05-e2f0-4fd1-915f-004f846dd8e8",
			"targetSymbol": "0e857b6e-ce14-4dee-ac95-9a16037dccb2",
			"object": "16c86382-8253-410e-bd5a-8c576eac94b9"
		},
		"caa4df8f-6bf1-4251-949d-5ab5f300e964": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow38",
			"name": "SequenceFlow38",
			"sourceRef": "bf7a91f4-a130-42f7-9f0d-41c5869095c2",
			"targetRef": "03541890-2eef-4b60-8fc6-88c5b88f96e4"
		},
		"9c650585-c29c-4f8f-b9fe-890752917d41": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1088,121 1191,121",
			"sourceSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"targetSymbol": "96b9fb05-e2f0-4fd1-915f-004f846dd8e8",
			"object": "caa4df8f-6bf1-4251-949d-5ab5f300e964"
		}
	}
}