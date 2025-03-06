//@ui5-bundle com/sap/salesinventorymanagementapp/Component-preload.js
sap.ui.require.preload({
	"com/sap/salesinventorymanagementapp/Component.js":function(){
sap.ui.define(["sap/ui/core/UIComponent","com/sap/salesinventorymanagementapp/model/models"],(e,t)=>{"use strict";return e.extend("com.sap.salesinventorymanagementapp.Component",{metadata:{manifest:"json",interfaces:["sap.ui.core.IAsyncContentCreation"]},init(){e.prototype.init.apply(this,arguments);this.setModel(t.createDeviceModel(),"device");this.getRouter().initialize()}})});
},
	"com/sap/salesinventorymanagementapp/controller/App.controller.js":function(){
sap.ui.define(["sap/ui/core/mvc/Controller"],e=>{"use strict";return e.extend("com.sap.salesinventorymanagementapp.controller.App",{onInit(){}})});
},
	"com/sap/salesinventorymanagementapp/controller/details.controller.js":function(){
sap.ui.define(["sap/ui/core/mvc/Controller","sap/ui/core/UIComponent","sap/ui/core/routing/History","sap/ui/model/json/JSONModel","sap/m/MessageToast"],(e,t,r,o,s)=>{"use strict";return e.extend("com.sap.salesinventorymanagementapp.controller.details",{onInit(){var e=this.getOwnerComponent().getRouter();e.getRoute("detailRoute").attachPatternMatched(this._onObjectMatched,this);var t=new o({isProductsDataEditable:false});this.getView().setModel(t,"oProductEnableModel")},handleNavButton:function(){var e=r.getInstance();var o=e.getPreviousHash();if(o!=undefined){window.history.go(-1)}else{var s=t.getRouterFor(this);s.navTo("homeRoute",{},true)}},_onObjectMatched:function(e){this.getView().bindElement("/Products("+e.getParameter("arguments").productId+")")},onProductEdit:function(){var e=this.getView().getModel("oProductEnableModel");var t=e.getProperty("/isProductsDataEditable");e.setProperty("/isProductsDataEditable",!t)},onProductSave:function(){var e=this.getView();var t=e.getBindingContext();var r=e.getModel("i18n").getResourceBundle();var o=this.byId("productName").getValue().trim();var n=this.byId("quantityPerUnit").getValue().trim();var a=this.byId("unitPrice").getValue().trim();var i=this.byId("unitsInStock").getValue().trim();var u=this.byId("reorderLevel").getValue().trim();var d=this.byId("unitsOnOrder").getValue().trim();function c(e){return typeof e==="string"&&e.length>0}function g(e){return/^[0-9]+$/.test(e)&&parseInt(e)>=0}function l(e){return/^[0-9]+(\.[0-9]{1,2})?$/.test(e)&&parseFloat(e)>0}if(!c(o)){s.show(r.getText("errorProductName"));return}if(!g(u)){s.show(r.getText("errorReorderLevel"));return}if(!g(i)){s.show(r.getText("errorUnitsInStock"));return}if(!g(d)){s.show(r.getText("errorUnitsOnOrder"));return}if(!l(a)){s.show(r.getText("errorUnitPrice"));return}t.setProperty("productName",o);t.setProperty("quantityPerUnit",n);t.setProperty("unitPrice",parseFloat(a).toFixed(2));t.setProperty("unitsInStock",parseInt(i,10));t.setProperty("reorderLevel",parseInt(u,10));t.setProperty("unitsOnOrder",parseInt(d,10));e.getModel("oProductEnableModel").setProperty("/isProductsDataEditable",false);e.getModel().submitBatch("updateGroup").then(function(){s.show(r.getText("successMessage"));this.getView().getModel().refresh(true)}).catch(function(e){t.getModel().resetChanges("updateGroup");var o=e.message||r.getText("defaultErrorMessage");if(e.responseJSON&&e.responseJSON.error){o=e.responseJSON.error.message}console.error("Error while saving data:",e);s.show(o)})}})});
},
	"com/sap/salesinventorymanagementapp/controller/home.controller.js":function(){
sap.ui.define(["sap/ui/core/mvc/Controller","sap/ui/model/Filter","sap/ui/model/FilterOperator","sap/ui/model/FilterType","sap/ui/core/UIComponent","sap/ui/model/json/JSONModel","sap/m/MessageToast"],(e,t,o,r,n,i,s)=>{"use strict";return e.extend("com.sap.salesinventorymanagementapp.controller.home",{onInit(){var e=this.getOwnerComponent().getModel("loggedInUserModel");var t=e.bindContext("/currentUser");t.requestObject().then(function(e){console.log("Logged-in user details:",e)}).catch(function(e){console.error("Error fetching user details:",e)})},onCloseProductDataTableDialog:function(){this.byId("productDataTableDialog").close()},onProductCardPress:async function(){console.log("Product Card Pressed")},onSearch:function(){var e=this.getView();var n=e.byId("searchField").getValue();var i=new t({path:"productName",operator:o.Contains,value1:n,caseSensitive:false});e.byId("idProductsTable").getBinding("items").filter(i,r.Application)},onPress:function(e){var t=n.getRouterFor(this);var o=e.getSource().getBindingContext().getValue().productId;t.navTo("detailRoute",{productId:o})},onProductCreate:function(){var e=new i({productId:globalThis.crypto.randomUUID(),supplierId:"",productName:"",quantityPerUnit:"",unitPrice:"",unitsInStock:"",unitsOnOrder:"",reorderLevel:"",discontinued:""});this.getView().setModel(e,"productCreateModel");if(!this.pDialog){this.pDialog=this.loadFragment({name:"com.sap.salesinventorymanagementapp.view.createNewProduct"})}this.pDialog.then(function(e){e.open()})},onCloseProductDialog:function(){this.byId("productCreateFragmentDialog").close()},onCreateProductDialog:function(){var e=this.byId("supplierCreateFragment").getSelectedKey();this.getView().getModel("productCreateModel").setProperty("/supplierId",e);this.getView().getModel("productCreateModel").setProperty("/discontinued",false);var t=this.getView();var o=t.getModel("i18n").getResourceBundle();var r=this.getView().getModel("productCreateModel").getData();r.unitPrice=parseFloat(r.unitPrice);r.unitsInStock=parseInt(r.unitsInStock,10);r.unitsOnOrder=parseInt(r.unitsOnOrder,10);r.reorderLevel=parseInt(r.reorderLevel,10);this.byId("idProductsTable").getBinding("items").create(this.getView().getModel("productCreateModel").getData()).created().then(function(){s.show(o.getText("productCreatedMessage"))});t.setBusy(true);function n(){t.setBusy(false)}t.getModel().submitBatch("updateGroup").then(n,n);this.byId("productCreateFragmentDialog").close()},onProductDelete:function(){var e=this.getView();var t=e.getModel("i18n").getResourceBundle();var o,r=this.byId("idProductsTable").getSelectedItem(),n;if(r){var o=r.getBindingContext();var e=this.getView();o.delete().then(function(){s.show(t.getText("deletSuccessMessage"))}.bind(this),function(e){MessageBox.error(t.getText("deleteErrorMessage")+", "+e.message)}.bind(this));e.setBusy(true);function i(){e.setBusy(false)}e.getModel().submitBatch("updateGroup").then(i,i)}}})});
},
	"com/sap/salesinventorymanagementapp/controller/notFound.controller.js":function(){
sap.ui.define(["sap/ui/core/mvc/Controller","sap/ui/core/UIComponent"],(e,n)=>{"use strict";return e.extend("com.sap.salesinventorymanagementapp.controller.notFound",{onInit(){},handleLinkPress:function(){var e=n.getRouterFor(this);e.navTo("homeRoute",{})}})});
},
	"com/sap/salesinventorymanagementapp/i18n/i18n.properties":'# This is the resource bundle for com.sap.salesinventorymanagementapp\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Sales Inventory Management App\n\n#YDES: Application description\nappDescription=An SAP Fiori application.\n#XTIT: Main view title\ntitle=Sales Inventory Management App\n\n#XFLD,46.5\nflpTitle=Sales Inventory Management flip\n\nnotFoundPage = Not Found\nnotFoundPageText = Sorry, but the request resource is not available.\nnavToOverviewLinkText = Navigate back to Home Page\n\n#Home screen Data\ngetProductData= Get Product Details\nproductData= Products Data\ngetCustomersData= Get Customer Details\ncustomerData= Customers Data\ngetOrdersData= Get Orders Data\nordersData= Orders Data\ngetOrderDetailsData= Get Order Details\nordersDetailsData= Orders Details\ngetSuppliersData= Get Supplier Details\nsupplierData= Suppliers Data\n\n# Product Fields - Details Page\ndiscontinued= Discontinued\nproductId= Product Id\nproductName= Product Name\nquantityPerUnit= Quantity Per Unit\nreorderLevel= Reorder Level\nsupplierId= Supplier Id\nunitPrice= Unit Price\nunitsInStock= Units in Stock\nunitsOnOrder= Units on Order\n\nunitsOnOrderErrorMessage= Units On Order cannot be less than 25.\n\nerrorProductName=Product Name cannot be empty.\nerrorReorderLevel=Reorder Level must be a non-negative integer.\nerrorUnitsInStock=Units in Stock must be a non-negative integer.\nerrorUnitsOnOrder=Units on Order must be a non-negative integer.\nerrorUnitPrice=Unit Price must be a positive number with up to 2 decimal places.\nsuccessMessage=Data successfully updated.\ndefaultErrorMessage=An error occurred while saving data.\n\n# Product Fragment Details\ncreateProductFragmentTitle = Enter Product Details\nclose= Close\ncreate= Create\nproductCreatedMessage = Product Created Sucessfully\nsupplier= Supplier\n\n# Products Table\ndeleteProductText = Delete Product\naddProductText= Add Product\ndeletSuccessMessage= Deleted Successfully\ndeleteErrorMessage= Deletion UnSuccessfull!\n',
	"com/sap/salesinventorymanagementapp/manifest.json":'{"_version":"1.65.0","sap.app":{"id":"com.sap.salesinventorymanagementapp","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","resources":"resources.json","sourceTemplate":{"id":"@sap/generator-fiori:basic","version":"1.15.7","toolsId":"82fdc862-8856-4df1-baff-d6b6bd77de1b"},"dataSources":{"mainService":{"uri":"odata/v4/catalog/","type":"OData","settings":{"annotations":[],"odataVersion":"4.0"}},"testSource":{"uri":"model/object.json","type":"JSON"},"loggedInUser":{"uri":"user-api/","type":"OData","settings":{"annotations":[],"odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"sim_flpconfig-show":{"semanticObject":"sim_flpconfig","action":"show","title":"{{flpTitle}}","signature":{"parameters":{},"additionalParameters":"allowed"}}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":false,"dependencies":{"minUI5Version":"1.131.1","libs":{"sap.m":{},"sap.ui.core":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"com.sap.salesinventorymanagementapp.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"updateGroupId":"updateGroup","operationMode":"Server","synchronizationMode":"None","autoExpandSelect":true}},"loggedInUserModel":{"dataSource":"loggedInUser","preload":true,"settings":{"updateGroupId":"updateGroup","operationMode":"Server","synchronizationMode":"None","autoExpandSelect":true}},"testModel":{"dataSource":"testSource","preload":true,"type":"sap.ui.model.json.JSONModel"}},"resources":{"css":[{"uri":"css/style.css"}]},"routing":{"config":{"routerClass":"sap.m.routing.Router","controlAggregation":"pages","async":true,"controlId":"app","transition":"slide","type":"View","viewType":"XML","path":"com.sap.salesinventorymanagementapp.view","bypassed":{"target":["notFound"]}},"routes":[{"name":"homeRoute","pattern":"","target":["homeTarget"]},{"name":"detailRoute","pattern":"details/{productId}","target":["detailTarget"]}],"targets":{"homeTarget":{"viewType":"XML","id":"home","name":"home"},"detailTarget":{"viewType":"XML","id":"details","name":"details"},"notFound":{"viewType":"XML","id":"notFound","name":"notFound","transition":"show"}}},"rootView":{"viewName":"com.sap.salesinventorymanagementapp.view.App","type":"XML","id":"app"}}}',
	"com/sap/salesinventorymanagementapp/model/models.js":function(){
sap.ui.define(["sap/ui/model/json/JSONModel","sap/ui/Device"],function(e,n){"use strict";return{createDeviceModel:function(){var i=new e(n);i.setDefaultBindingMode("OneWay");return i}}});
},
	"com/sap/salesinventorymanagementapp/view/App.view.xml":'<mvc:View controllerName="com.sap.salesinventorymanagementapp.controller.App"\n    xmlns:mvc="sap.ui.core.mvc"\n    xmlns="sap.m"><App id="app"></App></mvc:View>',
	"com/sap/salesinventorymanagementapp/view/createNewProduct.fragment.xml":'<core:FragmentDefinition\n  xmlns="sap.m"\n  xmlns:core="sap.ui.core"\n  xmlns:f="sap.ui.layout.form"><Dialog\n    id="productCreateFragmentDialog"\n    title="{i18n>createProductFragmentTitle}"><VBox class="sapUiSmallMargin"><f:SimpleForm id="producCreateFragmentDialogForm"\n\t\t\teditable="true"\n\t\t\tlayout="ResponsiveGridLayout"\n\t\t\tlabelSpanXL="4"\n\t\t\tlabelSpanL="3"\n\t\t\tlabelSpanM="4"\n\t\t\tlabelSpanS="12"\n\t\t\tadjustLabelSpan="false"\n\t\t\temptySpanXL="0"\n\t\t\temptySpanL="4"\n\t\t\temptySpanM="0"\n\t\t\temptySpanS="0"\n\t\t\tcolumnsXL="2"\n\t\t\tcolumnsL="1"\n\t\t\tcolumnsM="1"\n\t\t\tsingleContainerFullSize="false"\n\t\t\tariaLabelledBy="Title1" ><f:toolbar><Toolbar id="TB2"><Title id="Title2" text="{i18n>createProductFragmentTitle}"/></Toolbar></f:toolbar><f:content><Label text="{i18n>productName}" /><Input id="productNameCreateFragment" value="{productCreateModel>/productName}" required="true"/><Label text="{i18n>quantityPerUnit}" /><Input id="quantityPerUnitCreateFragment" value="{productCreateModel>/quantityPerUnit}" required="true"/><Label text="{i18n>reorderLevel}" /><Input id="reorderLevelCreateFragment" value="{productCreateModel>/reorderLevel}" required="true"/><Label text="{i18n>unitPrice}" /><Input id="unitPriceCreateFragment" value="{productCreateModel>/unitPrice}" required="true"/><Label text="{i18n>supplier}" /><ComboBox id="supplierCreateFragment"\n\t\t\titems="{\n\t\t\t\tpath: \'/Suppliers\'\n\t\t\t}"><core:Item key="{supplierId}" text="{companyName}" /></ComboBox><Label text="{i18n>unitsInStock}" /><Input id="unitsInStockCreateFragment" value="{productCreateModel>/unitsInStock}" required="true"/><Label text="{i18n>unitsOnOrder}" /><Input id="unitsOnOrderCreateFragment" value="{productCreateModel>/unitsOnOrder}" required="true"/></f:content></f:SimpleForm><HBox justifyContent="SpaceAround"><Button\n            text="{i18n>create}"\n            type="Emphasized"\n            press=".onCreateProductDialog"\n            width="120px"/><ToolbarSpacer/><Button\n            text="{i18n>close}"\n            press=".onCloseProductDialog"\n            width="120px"/></HBox></VBox></Dialog></core:FragmentDefinition>',
	"com/sap/salesinventorymanagementapp/view/details.view.xml":'<mvc:View controllerName="com.sap.salesinventorymanagementapp.controller.details"\n    xmlns:mvc="sap.ui.core.mvc"\n    xmlns="sap.m"\n\txmlns:l="sap.ui.layout"\n\txmlns:f="sap.ui.layout.form"\n\txmlns:core="sap.ui.core"><Page showNavButton= "true" navButtonPress="handleNavButton"><VBox class="sapUiSmallMargin"><f:SimpleForm id="SimpleFormToolbar"\n\t\t\teditable="true"\n\t\t\tlayout="ResponsiveGridLayout"\n\t\t\tlabelSpanXL="4"\n\t\t\tlabelSpanL="3"\n\t\t\tlabelSpanM="4"\n\t\t\tlabelSpanS="12"\n\t\t\tadjustLabelSpan="false"\n\t\t\temptySpanXL="0"\n\t\t\temptySpanL="4"\n\t\t\temptySpanM="0"\n\t\t\temptySpanS="0"\n\t\t\tcolumnsXL="2"\n\t\t\tcolumnsL="1"\n\t\t\tcolumnsM="1"\n\t\t\tsingleContainerFullSize="false"\n\t\t\tariaLabelledBy="Title1" ><f:toolbar><Toolbar id="TB1"><Title id="Title1" text="{i18n>productData}"/></Toolbar></f:toolbar><f:content><Toolbar ariaLabelledBy="Title2"><ToolbarSpacer /><Button icon="sap-icon://edit" press="onProductEdit"/><Button icon="sap-icon://save" press="onProductSave"/></Toolbar><Label text="{i18n>productId}" /><Input id="productId" value="{productId}" enabled="false"/><Label text="{i18n>productName}" /><Input id="productName" value="{productName}" enabled="{oProductEnableModel>/isProductsDataEditable}"/><Label text="{i18n>quantityPerUnit}" /><Input id="quantityPerUnit" value="{quantityPerUnit}" enabled="{oProductEnableModel>/isProductsDataEditable}"/><Label text="{i18n>reorderLevel}" /><Input id="reorderLevel" value="{reorderLevel}" enabled="{oProductEnableModel>/isProductsDataEditable}"/><Label text="{i18n>unitPrice}" /><Input id="unitPrice" value="{unitPrice}" enabled="{oProductEnableModel>/isProductsDataEditable}"/><Label text="{i18n>unitsInStock}" /><Input id="unitsInStock" value="{unitsInStock}" enabled="{oProductEnableModel>/isProductsDataEditable}"/><Label text="{i18n>unitsOnOrder}" /><Input id="unitsOnOrder" value="{unitsOnOrder}" enabled="{oProductEnableModel>/isProductsDataEditable}"/></f:content></f:SimpleForm></VBox></Page></mvc:View>',
	"com/sap/salesinventorymanagementapp/view/home.view.xml":'<mvc:View controllerName="com.sap.salesinventorymanagementapp.controller.home"\n    xmlns:mvc="sap.ui.core.mvc"\n    xmlns="sap.m"\n\txmlns:f="sap.f"\n\txmlns:card="sap.f.cards"\n\txmlns:tnt="sap.tnt"\n\tdisplayBlock="true"\n\theight="100%"><ScrollContainer vertical="true" height="100%"><tnt:ToolHeader id="shellLikeToolHeader" class="sapUiTinyMargin"><Button icon="sap-icon://menu2" type="Transparent" tooltip="Menu"><layoutData><OverflowToolbarLayoutData priority="NeverOverflow"/></layoutData></Button><Image src="../test-resources/sap/tnt/images/AppIcon_1.png" decorative="false" press="onLogoPressed" tooltip="SAP Logo"><layoutData><OverflowToolbarLayoutData priority="NeverOverflow"/></layoutData></Image><Title text="{i18n>appTitle}" wrapping="false" id="salesInventoryManagementTitle"><layoutData><OverflowToolbarLayoutData priority="Disappear"/></layoutData></Title><ToolbarSpacer/><ToolbarSpacer id="spacer"><layoutData><OverflowToolbarLayoutData priority="Low" group="1"/></layoutData></ToolbarSpacer><Button visible="false" icon="sap-icon://search" type="Transparent" id="searchButton" tooltip="Search"/><OverflowToolbarButton icon="sap-icon://source-code" type="Transparent" tooltip="Action 1" text="Action 1"><layoutData><OverflowToolbarLayoutData group="2"/></layoutData></OverflowToolbarButton><OverflowToolbarButton icon="sap-icon://card" type="Transparent" tooltip="Action 2" text="Action 2"><layoutData><OverflowToolbarLayoutData group="2"/></layoutData></OverflowToolbarButton><ToolbarSeparator><layoutData><OverflowToolbarLayoutData group="2"/></layoutData></ToolbarSeparator><OverflowToolbarButton icon="sap-icon://action-settings" type="Transparent" text="Settings"/><Button icon="sap-icon://bell" type="Transparent" tooltip="Notification"><layoutData><OverflowToolbarLayoutData priority="NeverOverflow"/></layoutData></Button><tnt:ToolHeaderUtilitySeparator/><ToolbarSpacer width="1.125rem"/><Avatar src="test-resources/sap/tnt/images/Woman_avatar_01.png" displaySize="XS" press=".onAvatarPressed" tooltip="Profile"><layoutData><OverflowToolbarLayoutData priority="NeverOverflow"/></layoutData></Avatar></tnt:ToolHeader><f:Card class="sapUiMediumMargin" width="250px" height="150px"><f:header><card:Header title="{i18n>productData}"/></f:header><f:content><VBox\n\t\t\t\t\theight="110px"\n\t\t\t\t\tclass="sapUiSmallMargin"\n\t\t\t\t\tjustifyContent="SpaceBetween"><Button text="{i18n>getProductData}" press="onProductCardPress"></Button></VBox></f:content></f:Card><f:Card class="sapUiMediumMargin" width="250px" height="150px"><f:header><card:Header title="{i18n>customerData}"/></f:header><f:content><VBox\n\t\t\t\t\theight="110px"\n\t\t\t\t\tclass="sapUiSmallMargin"\n\t\t\t\t\tjustifyContent="SpaceBetween"><Button text="{i18n>getCustomersData}"></Button></VBox></f:content></f:Card><f:Card class="sapUiMediumMargin" width="250px" height="150px"><f:header><card:Header title="{i18n>ordersData}"/></f:header><f:content><VBox\n\t\t\t\t\theight="110px"\n\t\t\t\t\tclass="sapUiSmallMargin"\n\t\t\t\t\tjustifyContent="SpaceBetween"><Button text="{i18n>getOrdersData}"></Button></VBox></f:content></f:Card><f:Card class="sapUiMediumMargin" width="250px" height="150px"><f:header><card:Header title="{i18n>ordersDetailsData}"/></f:header><f:content><VBox\n\t\t\t\t\theight="110px"\n\t\t\t\t\tclass="sapUiSmallMargin"\n\t\t\t\t\tjustifyContent="SpaceBetween"><Button text="{i18n>getOrderDetailsData}"></Button></VBox></f:content></f:Card><f:Card class="sapUiMediumMargin" width="250px" height="150px"><f:header><card:Header title="{i18n>supplierData}"/></f:header><f:content><VBox\n\t\t\t\t\theight="110px"\n\t\t\t\t\tclass="sapUiSmallMargin"\n\t\t\t\t\tjustifyContent="SpaceBetween"><Button text="{i18n>getSuppliersData}"></Button></VBox></f:content></f:Card></ScrollContainer></mvc:View>',
	"com/sap/salesinventorymanagementapp/view/notFound.view.xml":'<mvc:View controllerName="com.sap.salesinventorymanagementapp.controller.notFound"\n    xmlns:mvc="sap.ui.core.mvc"\n    xmlns="sap.m"><Page title="{i18n>notFoundPage}"><content><VBox><Text text="{i18n>notFoundPageText}" /><Link\n\t\t\t\ttext="{i18n>navToOverviewLinkText}"\n\t\t\t\tendIcon="sap-icon://inspect"\n\t\t\t\tpress="handleLinkPress" /></VBox></content></Page></mvc:View>',
	"com/sap/salesinventorymanagementapp/view/productsData.fragment.xml":'<core:FragmentDefinition\n  xmlns="sap.m"\n  xmlns:core="sap.ui.core"\n  xmlns:f="sap.ui.layout.form"><Dialog\n    id="productDataFragmentDialog"\n    title="{i18n>createProductFragmentTitle}"><Table id="idProductsTable"\n\t\t\t\tgrowing="true"\n\t\t\t\tmode="SingleSelectLeft"\n\t\t\t\tsticky="ColumnHeaders"\n\t\t\t\tgrowingThreshold="20"\n\t\t\t\talternateRowColors="true"\n\t\t\t\tbusyIndicatorDelay="10000"\n\t\t\t\t\titems="{\n\t\t\t\t\t\tpath: \'/Products\',\n\t\t\t\t\t\tparameters:{\n\t\t\t\t\t\t\t$count: true\n\t\t\t\t\t\t}\n\t\t\t\t\t}"><headerToolbar><OverflowToolbar><content><Title text="Products" level="H2"/><ToolbarSpacer /><SearchField id="searchField" width="20%" placeholder="Search with Product Name" search=".onSearch"/><Button icon="sap-icon://add" press="onProductCreate" tooltip="{i18n>addProductText}"/><Button id="deleteUserButton" icon="sap-icon://delete" tooltip="{i18n>deleteProductText}" press=".onProductDelete"/></content></OverflowToolbar></headerToolbar><infoToolbar></infoToolbar><columns><Column><Text text="Product Name" /></Column><Column><Text text="Reorder Level" /></Column><Column><Text text="Unit Price" /></Column><Column><Text text="Units In Stock" /></Column></columns><items><ColumnListItem type="Navigation" press=".onPress"><cells><Text\n\t\t\t\t\t\t\t\t\ttext="{productName}" /><Text\n\t\t\t\t\t\t\t\t\ttext="{reorderLevel}" /><Text\n\t\t\t\t\t\t\t\t\ttext="{unitPrice}" /><Text\n\t\t\t\t\t\t\t\t\ttext="{unitsInStock}" /></cells></ColumnListItem></items></Table></Dialog></core:FragmentDefinition>'
});
//# sourceMappingURL=Component-preload.js.map
