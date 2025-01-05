{
	"contents": {
		"ab0b7937-1852-40ba-a10b-c68b14c1878a": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "itsupport_subflow",
			"subject": "ITSupport_Subflow",
			"name": "ITSupport_Subflow",
			"documentation": "Sub flow for IT Support workflow",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"cec143ef-47e9-41b5-b814-07f41d17c763": {
					"name": "Support User"
				},
				"92ea1efe-86df-4693-8f36-4072d308eec0": {
					"name": "Process Decision"
				},
				"2f31f038-3841-4fae-a363-46a4bc4527d5": {
					"name": "Notify Support"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"20945e4d-8d51-495b-8431-ed68182679fd": {
					"name": "SequenceFlow2"
				},
				"51c15049-c8fb-4107-9b2a-6715f340b8cb": {
					"name": "SequenceFlow3"
				},
				"bdf9f447-9dbd-46f2-9332-9e374cb846ae": {
					"name": "SequenceFlow4"
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
			"targetRef": "2f31f038-3841-4fae-a363-46a4bc4527d5"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"8934f3a9-07ac-40ab-969a-edb27ae34179": {},
				"edf0af7e-e096-44ce-b9a3-95be441394f7": {},
				"f4dcad0f-5759-42df-a8ce-60d74ebe71a7": {},
				"63e94a04-7836-490a-a046-505a3d07e39f": {},
				"e2d1484b-da73-4ba3-983b-5808279928a3": {},
				"c7a2c7ec-dd6f-4ada-bd3d-66a064d41b7f": {}
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
			"x": 676,
			"y": 99,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116.6875 239.11860547594029,116.6875",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "e2d1484b-da73-4ba3-983b-5808279928a3",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"maildefinition": 1,
			"sequenceflow": 4,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"scripttask": 1,
			"mailtask": 1
		},
		"cec143ef-47e9-41b5-b814-07f41d17c763": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "IT Support User Action Required",
			"priority": "HIGH",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.Support_User.email}",
			"formReference": "/forms/SupportUserForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "supportuserform"
			}, {
				"key": "formRevision",
				"value": "1"
			}],
			"id": "usertask1",
			"name": "Support User"
		},
		"8934f3a9-07ac-40ab-969a-edb27ae34179": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 334.2414728659385,
			"y": 86.75,
			"width": 100,
			"height": 60,
			"object": "cec143ef-47e9-41b5-b814-07f41d17c763"
		},
		"20945e4d-8d51-495b-8431-ed68182679fd": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "cec143ef-47e9-41b5-b814-07f41d17c763",
			"targetRef": "92ea1efe-86df-4693-8f36-4072d308eec0"
		},
		"edf0af7e-e096-44ce-b9a3-95be441394f7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "384.2414728659385,116.6875 537.3707364329692,116.6875",
			"sourceSymbol": "8934f3a9-07ac-40ab-969a-edb27ae34179",
			"targetSymbol": "f4dcad0f-5759-42df-a8ce-60d74ebe71a7",
			"object": "20945e4d-8d51-495b-8431-ed68182679fd"
		},
		"92ea1efe-86df-4693-8f36-4072d308eec0": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/ITSupport_Subflow/ProcessDecision.js",
			"id": "scripttask1",
			"name": "Process Decision"
		},
		"f4dcad0f-5759-42df-a8ce-60d74ebe71a7": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 487.37073643296924,
			"y": 86.625,
			"width": 100,
			"height": 60,
			"object": "92ea1efe-86df-4693-8f36-4072d308eec0"
		},
		"51c15049-c8fb-4107-9b2a-6715f340b8cb": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "92ea1efe-86df-4693-8f36-4072d308eec0",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"63e94a04-7836-490a-a046-505a3d07e39f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "537.3707364329692,116.5625 693.5,116.5625",
			"sourceSymbol": "f4dcad0f-5759-42df-a8ce-60d74ebe71a7",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "51c15049-c8fb-4107-9b2a-6715f340b8cb"
		},
		"2f31f038-3841-4fae-a363-46a4bc4527d5": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask1",
			"name": "Notify Support",
			"mailDefinitionRef": "d57d5e9a-5dcb-49e3-9e64-02036144d1f3"
		},
		"e2d1484b-da73-4ba3-983b-5808279928a3": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 189.11860547594029,
			"y": 87.375,
			"width": 100,
			"height": 60,
			"object": "2f31f038-3841-4fae-a363-46a4bc4527d5"
		},
		"bdf9f447-9dbd-46f2-9332-9e374cb846ae": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "2f31f038-3841-4fae-a363-46a4bc4527d5",
			"targetRef": "cec143ef-47e9-41b5-b814-07f41d17c763"
		},
		"c7a2c7ec-dd6f-4ada-bd3d-66a064d41b7f": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "239.11860547594029,117.0625 384.2414728659385,117.0625",
			"sourceSymbol": "e2d1484b-da73-4ba3-983b-5808279928a3",
			"targetSymbol": "8934f3a9-07ac-40ab-969a-edb27ae34179",
			"object": "bdf9f447-9dbd-46f2-9332-9e374cb846ae"
		},
		"d57d5e9a-5dcb-49e3-9e64-02036144d1f3": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "${context.Support_User.email}",
			"cc": "${context.HR.email}",
			"bcc": "${context.requester}",
			"subject": "Request has been raised",
			"text": "Kindly check your workflow History for the newly created IT Ticket\n\nRegards\nIT Ticket Workflow",
			"ignoreInvalidRecipients": true,
			"id": "maildefinition1"
		}
	}
}