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
					"name": "Requester Cancel"
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
					"name": "SequenceFlow3"
				},
				"bdb13301-a1dd-4b2d-8f5f-3a0d18b21198": {
					"name": "SequenceFlow4"
				},
				"99767e1c-e1c2-46f6-8b41-a8c82630e613": {
					"name": "SequenceFlow5"
				},
				"4a8b4f81-7d75-41a1-b315-e45a72c28d90": {
					"name": "SequenceFlow6"
				},
				"4ad0fa7e-8de1-4ddc-b75d-af2ca6a4b933": {
					"name": "SequenceFlow8"
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
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0"
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
				"1e64a1cd-a491-452c-ba3a-d71ae3703d68": {},
				"c544670e-4401-494e-ae84-f092a678efda": {},
				"44dcc4ff-56dc-4dc6-9616-04b5c17d3fed": {},
				"72a5bc14-6b61-4b42-81b9-1c5c1d81327f": {},
				"9d8123a7-6dea-4091-8977-b771a1854a55": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 724,
			"y": 98,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116 200,116",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "77a3412c-63ca-4f98-9720-1bb31646d99a",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 8,
			"startevent": 1,
			"endevent": 2,
			"usertask": 2,
			"servicetask": 1,
			"scripttask": 2,
			"exclusivegateway": 1
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
		"77a3412c-63ca-4f98-9720-1bb31646d99a": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 150,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0"
		},
		"4a62da83-6202-4509-9c89-8a7406bd9777": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "1ef30ac4-aca8-48e4-a9c4-e3fc579b57e0",
			"targetRef": "0b2cc36b-f4a3-45f8-9142-c7106864b8b3"
		},
		"04e804c9-b3f4-4856-8625-a194787ec1c9": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "200,118.5 289,118.5",
			"sourceSymbol": "77a3412c-63ca-4f98-9720-1bb31646d99a",
			"targetSymbol": "d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d",
			"object": "4a62da83-6202-4509-9c89-8a7406bd9777"
		},
		"0b2cc36b-f4a3-45f8-9142-c7106864b8b3": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "Requester Decision",
			"default": "72eab23f-e4fa-468a-9607-edfc6f2124b5"
		},
		"d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 268,
			"y": 100,
			"object": "0b2cc36b-f4a3-45f8-9142-c7106864b8b3"
		},
		"72eab23f-e4fa-468a-9607-edfc6f2124b5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "0b2cc36b-f4a3-45f8-9142-c7106864b8b3",
			"targetRef": "5073a666-7499-4a81-9df5-ec9fff9e8631"
		},
		"90108c3a-fa76-4459-811b-de67a190e320": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "289,118.5 390,118.5",
			"sourceSymbol": "d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d",
			"targetSymbol": "72a5bc14-6b61-4b42-81b9-1c5c1d81327f",
			"object": "72eab23f-e4fa-468a-9607-edfc6f2124b5"
		},
		"4cbf48bc-9289-4d52-b409-493c156c98d7": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "Requester Cancel"
		},
		"8f9aceef-ba31-49c5-9189-6792e83c63f6": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 274.5,
			"y": 262.5,
			"width": 35,
			"height": 35,
			"object": "4cbf48bc-9289-4d52-b409-493c156c98d7"
		},
		"bdb13301-a1dd-4b2d-8f5f-3a0d18b21198": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision == \"cancel\"}",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "0b2cc36b-f4a3-45f8-9142-c7106864b8b3",
			"targetRef": "4cbf48bc-9289-4d52-b409-493c156c98d7"
		},
		"b2822d15-1d8d-412d-bf68-7e2cd88e5b6a": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "290.5,121 290.5,263",
			"sourceSymbol": "d490ad9f-95d1-4b22-80c8-f3f6e58b4e9d",
			"targetSymbol": "8f9aceef-ba31-49c5-9189-6792e83c63f6",
			"object": "bdb13301-a1dd-4b2d-8f5f-3a0d18b21198"
		},
		"bf7a91f4-a130-42f7-9f0d-41c5869095c2": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"id": "usertask2",
			"name": "HR"
		},
		"a343a8fe-8933-4406-ae37-128ccc6d8404": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 605,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "bf7a91f4-a130-42f7-9f0d-41c5869095c2"
		},
		"99767e1c-e1c2-46f6-8b41-a8c82630e613": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "bf7a91f4-a130-42f7-9f0d-41c5869095c2",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"1e64a1cd-a491-452c-ba3a-d71ae3703d68": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "655,115.75 741.5,115.75",
			"sourceSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "99767e1c-e1c2-46f6-8b41-a8c82630e613"
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
		"c544670e-4401-494e-ae84-f092a678efda": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 480,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "6efdb04b-72cf-474a-b963-64502a1df7a8"
		},
		"4a8b4f81-7d75-41a1-b315-e45a72c28d90": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "6efdb04b-72cf-474a-b963-64502a1df7a8",
			"targetRef": "bf7a91f4-a130-42f7-9f0d-41c5869095c2"
		},
		"44dcc4ff-56dc-4dc6-9616-04b5c17d3fed": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "530,118.5 655,118.5",
			"sourceSymbol": "c544670e-4401-494e-ae84-f092a678efda",
			"targetSymbol": "a343a8fe-8933-4406-ae37-128ccc6d8404",
			"object": "4a8b4f81-7d75-41a1-b315-e45a72c28d90"
		},
		"5073a666-7499-4a81-9df5-ec9fff9e8631": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITWorkFlow/initialize.js",
			"id": "scripttask2",
			"name": "Initialize"
		},
		"72a5bc14-6b61-4b42-81b9-1c5c1d81327f": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 340,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "5073a666-7499-4a81-9df5-ec9fff9e8631"
		},
		"4ad0fa7e-8de1-4ddc-b75d-af2ca6a4b933": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow8",
			"name": "SequenceFlow8",
			"sourceRef": "5073a666-7499-4a81-9df5-ec9fff9e8631",
			"targetRef": "6efdb04b-72cf-474a-b963-64502a1df7a8"
		},
		"9d8123a7-6dea-4091-8977-b771a1854a55": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "390,118.5 530,118.5",
			"sourceSymbol": "72a5bc14-6b61-4b42-81b9-1c5c1d81327f",
			"targetSymbol": "c544670e-4401-494e-ae84-f092a678efda",
			"object": "4ad0fa7e-8de1-4ddc-b75d-af2ca6a4b933"
		}
	}
}