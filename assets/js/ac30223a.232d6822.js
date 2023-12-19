"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[8405],{6620:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>i,contentTitle:()=>s,default:()=>O,frontMatter:()=>r,metadata:()=>c,toc:()=>d});var a=n(5893),o=n(1151);const r={title:"Product Master Data",published:!0,date:new Date("2023-10-26T21:31:46.730Z"),editor:"markdown",dateCreated:new Date("2023-10-26T16:22:01.572Z")},s="Resume",c={id:"Store Project/functionalities/product-master-data",title:"Product Master Data",description:"Product data resides on SAP ERP system.",source:"@site/docs/2_Store Project/functionalities/product-master-data.md",sourceDirName:"2_Store Project/functionalities",slug:"/Store Project/functionalities/product-master-data",permalink:"/cenabast-tienda/docs/Store Project/functionalities/product-master-data",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/2_Store Project/functionalities/product-master-data.md",tags:[],version:"current",frontMatter:{title:"Product Master Data",published:!0,date:"2023-10-26T21:31:46.730Z",editor:"markdown",dateCreated:"2023-10-26T16:22:01.572Z"},sidebar:"tutorialSidebar",previous:{title:"Login Secuence",permalink:"/cenabast-tienda/docs/Store Project/functionalities/login-con-plataforma-keycloak"},next:{title:"Platform Suggestion",permalink:"/cenabast-tienda/docs/Store Project/spree-base-suggestion"}},i={},d=[];function C(e){const t={admonition:"admonition",code:"code",h1:"h1",p:"p",pre:"pre",...(0,o.a)(),...e.components};return(0,a.jsxs)(a.Fragment,{children:[(0,a.jsx)(t.h1,{id:"resume",children:"Resume"}),"\n",(0,a.jsx)(t.admonition,{type:"note",children:(0,a.jsx)(t.p,{children:"Product data resides on SAP ERP system."})}),"\n",(0,a.jsx)(t.h1,{id:"get-product-catalog",children:"Get Product Catalog"}),"\n",(0,a.jsx)(t.p,{children:"Request:"}),"\n",(0,a.jsx)(t.pre,{children:(0,a.jsx)(t.code,{className:"language-jsx",children:"GET https://<<aplicacionweb>>/WebApi2/api/v2/material/listacatalogo\n"})}),"\n",(0,a.jsx)(t.p,{children:"Response:"}),"\n",(0,a.jsx)(t.pre,{children:(0,a.jsx)(t.code,{className:"language-jsx",children:'[\n  {\n    "CODIGO_PRODUCTO": "100000000",\n    "TIPO_PRODUCTO": "ZGEN",\n    "GRUPO_ARTICULO": "3TB",\n    "CODIGO_SECTOR": "S1",\n    "DESCRIPCION_SECTOR": "F\xe1rmacos",\n    "DENOMINACION": "RIFAMPICINA/ISONIAZIDA 150/150 MG CM/CP",\n    "CODIGO_ATC": "IQVIATECH--K",\n    "DENOMINACION_ESTANDAR": "2-CDF-RH",\n    "CODIGO_ONU": "51102002",\n    "TABLA_BASE": "2.2",\n    "JERARQUIA": "0010000200007",\n    "UMP": "",\n    "FABRICANTE": "",\n    "CODIGO_EAN": "",\n    "DESCRIPCIONGRUPOARTICULO": "TBC"\n  },\n  {\n    "CODIGO_PRODUCTO": "100000003",\n    "TIPO_PRODUCTO": "ZGEN",\n    "GRUPO_ARTICULO": "1IN",\n    "CODIGO_SECTOR": "S1",\n    "DESCRIPCION_SECTOR": "F\xe1rmacos",\n    "DENOMINACION": "A.A SALICILIC 100MG CM/CM REC/CP",\n    "CODIGO_ATC": "01AC06",\n    "DENOMINACION_ESTANDAR": "ACIDO ACETIL SALI.",\n    "CODIGO_ONU": "51142002",\n    "TABLA_BASE": "2.1",\n    "JERARQUIA": "0010000500006",\n    "UMP": "",\n    "FABRICANTE": "",\n    "CODIGO_EAN": "",\n    "DESCRIPCIONGRUPOARTICULO": "INTERMEDIACION"\n  }\n]\n'})})]})}function O(e={}){const{wrapper:t}={...(0,o.a)(),...e.components};return t?(0,a.jsx)(t,{...e,children:(0,a.jsx)(C,{...e})}):C(e)}},1151:(e,t,n)=>{n.d(t,{Z:()=>c,a:()=>s});var a=n(7294);const o={},r=a.createContext(o);function s(e){const t=a.useContext(r);return a.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function c(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(o):e.components||o:s(e.components),a.createElement(r.Provider,{value:t},e.children)}}}]);