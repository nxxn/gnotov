/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
(function(){function e(e){var t=this instanceof CKEDITOR.ui.dialog.checkbox;e.hasAttribute(this.id)&&(e=e.getAttribute(this.id),t?this.setValue(n[this.id]["true"]==e.toLowerCase()):this.setValue(e))}function t(e){var t=""===this.getValue(),r=this instanceof CKEDITOR.ui.dialog.checkbox,i=this.getValue();t?e.removeAttribute(this.att||this.id):r?e.setAttribute(this.id,n[this.id][i]):e.setAttribute(this.att||this.id,i)}var n={scrolling:{"true":"yes","false":"no"},frameborder:{"true":"1","false":"0"}};CKEDITOR.dialog.add("iframe",function(n){var r=n.lang.iframe,i=n.lang.common,s=n.plugins.dialogadvtab;return{title:r.title,minWidth:350,minHeight:260,onShow:function(){this.fakeImage=this.iframeNode=null;var e=this.getSelectedElement();e&&e.data("cke-real-element-type")&&"iframe"==e.data("cke-real-element-type")&&(this.fakeImage=e,this.iframeNode=e=n.restoreRealElement(e),this.setupContent(e))},onOk:function(){var e;e=this.fakeImage?this.iframeNode:new CKEDITOR.dom.element("iframe");var t={},r={};this.commitContent(e,t,r),e=n.createFakeElement(e,"cke_iframe","iframe",!0),e.setAttributes(r),e.setStyles(t),this.fakeImage?(e.replace(this.fakeImage),n.getSelection().selectElement(e)):n.insertElement(e)},contents:[{id:"info",label:i.generalTab,accessKey:"I",elements:[{type:"vbox",padding:0,children:[{id:"src",type:"text",label:i.url,required:!0,validate:CKEDITOR.dialog.validate.notEmpty(r.noUrl),setup:e,commit:t}]},{type:"hbox",children:[{id:"width",type:"text",requiredContent:"iframe[width]",style:"width:100%",labelLayout:"vertical",label:i.width,validate:CKEDITOR.dialog.validate.htmlLength(i.invalidHtmlLength.replace("%1",i.width)),setup:e,commit:t},{id:"height",type:"text",requiredContent:"iframe[height]",style:"width:100%",labelLayout:"vertical",label:i.height,validate:CKEDITOR.dialog.validate.htmlLength(i.invalidHtmlLength.replace("%1",i.height)),setup:e,commit:t},{id:"align",type:"select",requiredContent:"iframe[align]","default":"",items:[[i.notSet,""],[i.alignLeft,"left"],[i.alignRight,"right"],[i.alignTop,"top"],[i.alignMiddle,"middle"],[i.alignBottom,"bottom"]],style:"width:100%",labelLayout:"vertical",label:i.align,setup:function(t,n){e.apply(this,arguments);if(n){var r=n.getAttribute("align");this.setValue(r&&r.toLowerCase()||"")}},commit:function(e,n,r){t.apply(this,arguments),this.getValue()&&(r.align=this.getValue())}}]},{type:"hbox",widths:["50%","50%"],children:[{id:"scrolling",type:"checkbox",requiredContent:"iframe[scrolling]",label:r.scrolling,setup:e,commit:t},{id:"frameborder",type:"checkbox",requiredContent:"iframe[frameborder]",label:r.border,setup:e,commit:t}]},{type:"hbox",widths:["50%","50%"],children:[{id:"name",type:"text",requiredContent:"iframe[name]",label:i.name,setup:e,commit:t},{id:"title",type:"text",requiredContent:"iframe[title]",label:i.advisoryTitle,setup:e,commit:t}]},{id:"longdesc",type:"text",requiredContent:"iframe[longdesc]",label:i.longDescr,setup:e,commit:t}]},s&&s.createAdvancedTab(n,{id:1,classes:1,styles:1},"iframe")]}})})();