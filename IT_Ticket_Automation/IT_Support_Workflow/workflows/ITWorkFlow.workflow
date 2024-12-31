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
				"418d8fdf-41c7-49df-a5b7-1f6375797a4f": {
					"name": "Notify Support"
				},
				"345f2096-2c90-4c61-ab99-8d212872dd9e": {
					"name": "Support_User"
				},
				"0595db07-7171-4a53-9527-4b379f342f10": {
					"name": "ExclusiveGateway3"
				},
				"e0841a62-9381-424e-9696-dba78e7eb7d4": {
					"name": "DB Update"
				},
				"474b7e8c-77c6-4735-921b-787213af248a": {
					"name": "Final Update Payload"
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
				"bab0eeb9-6a09-48b7-90d1-e1be37df1811": {
					"name": "SequenceFlow16"
				},
				"425ee4f4-48b2-4e1e-b322-10c16a7a2d80": {
					"name": "Approve"
				},
				"f2d0cf68-554b-4ad1-a695-c3de8db56b64": {
					"name": "SequenceFlow19"
				},
				"6b39cff3-073a-4c5e-a68e-a4a9f4f41c66": {
					"name": "SequenceFlow20"
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
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
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
			"recipientUsers": "${context.HR.email}",
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
			"path": "/odata/v4/ticket-/Employee?$filter=Employee_ID eq '${context.HR_Id}'",
			"httpMethod": "GET",
			"responseVariable": "${context.HR_Details.Response}",
			"id": "servicetask2",
			"name": "Get HR Details"
		},
		"d6c87b16-e3ce-4aaf-93aa-96d038d49cba": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "IT_Ticket_Automation_Srv_Destination",
			"destinationSource": "consumer",
			"path": "/odata/v4/ticket-/Employee?$filter=Employee_ID eq '${context.Support_Users}'",
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
			"default": "425ee4f4-48b2-4e1e-b322-10c16a7a2d80"
		},
		"418d8fdf-41c7-49df-a5b7-1f6375797a4f": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask1",
			"name": "Notify Support",
			"mailDefinitionRef": "c366f5ca-ad30-4a62-9951-dc47139595f6"
		},
		"345f2096-2c90-4c61-ab99-8d212872dd9e": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Support Ticket Detail Form",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.Support_User.email}",
			"formReference": "/forms/ITWorkFlow/SupportUserForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "supportuserform"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask3",
			"name": "Support_User"
		},
		"0595db07-7171-4a53-9527-4b379f342f10": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "ExclusiveGateway3",
			"default": "f9564ab8-f1a9-4ad4-a2cf-b1ddba44fb3b"
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
		"bab0eeb9-6a09-48b7-90d1-e1be37df1811": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow16",
			"name": "SequenceFlow16",
			"sourceRef": "bf7a91f4-a130-42f7-9f0d-41c5869095c2",
			"targetRef": "03541890-2eef-4b60-8fc6-88c5b88f96e4"
		},
		"425ee4f4-48b2-4e1e-b322-10c16a7a2d80": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "Approve",
			"sourceRef": "03541890-2eef-4b60-8fc6-88c5b88f96e4",
			"targetRef": "418d8fdf-41c7-49df-a5b7-1f6375797a4f"
		},
		"f2d0cf68-554b-4ad1-a695-c3de8db56b64": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow19",
			"name": "SequenceFlow19",
			"sourceRef": "418d8fdf-41c7-49df-a5b7-1f6375797a4f",
			"targetRef": "345f2096-2c90-4c61-ab99-8d212872dd9e"
		},
		"6b39cff3-073a-4c5e-a68e-a4a9f4f41c66": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow20",
			"name": "SequenceFlow20",
			"sourceRef": "345f2096-2c90-4c61-ab99-8d212872dd9e",
			"targetRef": "0595db07-7171-4a53-9527-4b379f342f10"
		},
		"9ec5fdee-eaae-401d-aee6-45586d3447cb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask3.last.decision == \"reject\"}",
			"id": "sequenceflow22",
			"name": "Reject Flow",
			"sourceRef": "0595db07-7171-4a53-9527-4b379f342f10",
			"targetRef": "bf7a91f4-a130-42f7-9f0d-41c5869095c2"
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
				"b5e15f97-c871-429a-8b5b-e7247269cd37": {},
				"b6352309-71b1-4769-b527-b5ef957d366d": {},
				"27767eb0-9368-48d3-a75f-fb4c03a78de1": {},
				"6bc6e505-126d-4eb9-9f11-736d0cb45a07": {},
				"851da416-fdf2-443c-8cf6-2e36d0320c43": {},
				"364a4a8e-58b1-4b35-b187-29fdb7f2b3ff": {},
				"9e4dd18f-4358-405d-8289-c7035130cc87": {},
				"dfa464f1-cf6c-498c-a7ee-84279bbc252e": {},
				"de14e916-f8dd-43f2-86e5-59e6f4201278": {},
				"4d2086ce-609b-4df6-a469-6f0a301fa380": {},
				"d1d7b8eb-cabc-4079-a11b-9260e73296e1": {},
				"f2e85f73-8880-46d8-a0fd-b9558f0d2c6f": {},
				"b8aa07c7-bb4f-4846-8d56-7dca4c22fbb1": {}
			}
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
			"x": 2032,
			"y": 100,
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
			"x": 1056,
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
			"points": "962.75,121 1106,121",
			"sourceSymbol": "ec1fd11a-1b25-46f0-bea3-1462815aefaa",
			"targetSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"object": "b69d0c3f-9d94-46c6-844b-da3ff0294ff6"
		},
		"96b9fb05-e2f0-4fd1-915f-004f846dd8e8": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1187,
			"y": 100,
			"object": "03541890-2eef-4b60-8fc6-88c5b88f96e4"
		},
		"552b991f-0878-4907-ba50-b419db96d734": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1208,121 1208,5 -25,5 -25,91.5",
			"sourceSymbol": "96b9fb05-e2f0-4fd1-915f-004f846dd8e8",
			"targetSymbol": "77a3412c-63ca-4f98-9720-1bb31646d99a",
			"object": "c64057c0-6ad7-4390-aaea-6f663841f30f"
		},
		"2e2ab59f-ed70-4fca-b400-d8322c48714c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1208,142 1208,294 102.5,294",
			"sourceSymbol": "96b9fb05-e2f0-4fd1-915f-004f846dd8e8",
			"targetSymbol": "8f9aceef-ba31-49c5-9189-6792e83c63f6",
			"object": "1958e2a7-8bb6-422d-859d-27b4a48e3f16"
		},
		"b5e15f97-c871-429a-8b5b-e7247269cd37": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1106,121 1202,121",
			"sourceSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"targetSymbol": "96b9fb05-e2f0-4fd1-915f-004f846dd8e8",
			"object": "bab0eeb9-6a09-48b7-90d1-e1be37df1811"
		},
		"b6352309-71b1-4769-b527-b5ef957d366d": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1208,119.5 1324,119.5",
			"sourceSymbol": "96b9fb05-e2f0-4fd1-915f-004f846dd8e8",
			"targetSymbol": "27767eb0-9368-48d3-a75f-fb4c03a78de1",
			"object": "425ee4f4-48b2-4e1e-b322-10c16a7a2d80"
		},
		"27767eb0-9368-48d3-a75f-fb4c03a78de1": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 1274,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "418d8fdf-41c7-49df-a5b7-1f6375797a4f"
		},
		"6bc6e505-126d-4eb9-9f11-736d0cb45a07": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 1431,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "345f2096-2c90-4c61-ab99-8d212872dd9e"
		},
		"851da416-fdf2-443c-8cf6-2e36d0320c43": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1324,119.5 1431.5,119.5",
			"sourceSymbol": "27767eb0-9368-48d3-a75f-fb4c03a78de1",
			"targetSymbol": "6bc6e505-126d-4eb9-9f11-736d0cb45a07",
			"object": "f2d0cf68-554b-4ad1-a695-c3de8db56b64"
		},
		"364a4a8e-58b1-4b35-b187-29fdb7f2b3ff": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1481,119 1581,119",
			"sourceSymbol": "6bc6e505-126d-4eb9-9f11-736d0cb45a07",
			"targetSymbol": "9e4dd18f-4358-405d-8289-c7035130cc87",
			"object": "6b39cff3-073a-4c5e-a68e-a4a9f4f41c66"
		},
		"9e4dd18f-4358-405d-8289-c7035130cc87": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 1560,
			"y": 96,
			"object": "0595db07-7171-4a53-9527-4b379f342f10"
		},
		"dfa464f1-cf6c-498c-a7ee-84279bbc252e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1581,117 1581,240 1106,240 1106,150.5",
			"sourceSymbol": "9e4dd18f-4358-405d-8289-c7035130cc87",
			"targetSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"object": "9ec5fdee-eaae-401d-aee6-45586d3447cb"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 1,
			"maildefinition": 1,
			"sequenceflow": 25,
			"startevent": 1,
			"endevent": 3,
			"usertask": 3,
			"servicetask": 4,
			"scripttask": 5,
			"mailtask": 1,
			"exclusivegateway": 3
		},
		"c366f5ca-ad30-4a62-9951-dc47139595f6": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "${context.Support_User.email}",
			"cc": "${context.HR.email}",
			"bcc": "${context.requester}",
			"subject": "Request has been raised",
			"text": "Kindly check your workflow History for the newly created IT Ticket",
			"id": "maildefinition1"
		},
		"e0841a62-9381-424e-9696-dba78e7eb7d4": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "IT_Ticket_Automation_Srv_Destination",
			"destinationSource": "consumer",
			"path": "/odata/v4/ticket-/Assigned_Support",
			"httpMethod": "POST",
			"requestVariable": "${context.finalUpdate.Request}",
			"responseVariable": "${context.finalUpdate.Response}",
			"id": "servicetask4",
			"name": "DB Update",
			"documentation": "Current transaction DB update"
		},
		"de14e916-f8dd-43f2-86e5-59e6f4201278": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 1857,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "e0841a62-9381-424e-9696-dba78e7eb7d4"
		},
		"f9564ab8-f1a9-4ad4-a2cf-b1ddba44fb3b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow23",
			"name": "Approve Flow",
			"sourceRef": "0595db07-7171-4a53-9527-4b379f342f10",
			"targetRef": "474b7e8c-77c6-4735-921b-787213af248a"
		},
		"4d2086ce-609b-4df6-a469-6f0a301fa380": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1581,117.5 1714,117.5",
			"sourceSymbol": "9e4dd18f-4358-405d-8289-c7035130cc87",
			"targetSymbol": "f2e85f73-8880-46d8-a0fd-b9558f0d2c6f",
			"object": "f9564ab8-f1a9-4ad4-a2cf-b1ddba44fb3b"
		},
		"e058fda7-82cd-46ec-8bc9-6499340fccd7": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow24",
			"name": "SequenceFlow24",
			"sourceRef": "e0841a62-9381-424e-9696-dba78e7eb7d4",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"d1d7b8eb-cabc-4079-a11b-9260e73296e1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1907,120 2058,120",
			"sourceSymbol": "de14e916-f8dd-43f2-86e5-59e6f4201278",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "e058fda7-82cd-46ec-8bc9-6499340fccd7"
		},
		"474b7e8c-77c6-4735-921b-787213af248a": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/finalUpdatePayload.js",
			"id": "scripttask5",
			"name": "Final Update Payload"
		},
		"f2e85f73-8880-46d8-a0fd-b9558f0d2c6f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 1664,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "474b7e8c-77c6-4735-921b-787213af248a"
		},
		"eb0112e6-c168-4ddc-9921-83bebdbaff29": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow25",
			"name": "SequenceFlow25",
			"sourceRef": "474b7e8c-77c6-4735-921b-787213af248a",
			"targetRef": "e0841a62-9381-424e-9696-dba78e7eb7d4"
		},
		"b8aa07c7-bb4f-4846-8d56-7dca4c22fbb1": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "1714,118 1907,118",
			"sourceSymbol": "f2e85f73-8880-46d8-a0fd-b9558f0d2c6f",
			"targetSymbol": "de14e916-f8dd-43f2-86e5-59e6f4201278",
			"object": "eb0112e6-c168-4ddc-9921-83bebdbaff29"
		}
	}
}