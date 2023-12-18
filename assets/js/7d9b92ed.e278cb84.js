"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[9802],{5863:(n,e,i)=>{i.r(e),i.d(e,{assets:()=>c,contentTitle:()=>s,default:()=>u,frontMatter:()=>o,metadata:()=>r,toc:()=>l});var a=i(5893),t=i(1151);const o={title:"User API Service",published:!0,date:new Date("2023-11-08T13:36:05.941Z"),editor:"markdown",dateCreated:new Date("2023-11-06T15:43:14.854Z")},s="Resume",r={id:"api-rest-services/users",title:"User API Service",description:"User will login using Clave Unica IdP.\\",source:"@site/docs/api-rest-services/users.md",sourceDirName:"api-rest-services",slug:"/api-rest-services/users",permalink:"/cenabast-tienda/docs/api-rest-services/users",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/api-rest-services/users.md",tags:[],version:"current",frontMatter:{title:"User API Service",published:!0,date:"2023-11-08T13:36:05.941Z",editor:"markdown",dateCreated:"2023-11-06T15:43:14.854Z"},sidebar:"tutorialSidebar",previous:{title:"User API authentication",permalink:"/cenabast-tienda/docs/api-rest-services/user-api-authentication"},next:{title:"Business",permalink:"/cenabast-tienda/docs/business/"}},c={},l=[{value:"RUT user Request",id:"rut-user-request",level:2},{value:"Response (Respuesta deseable)",id:"response-respuesta-deseable",level:2},{value:"Response table view",id:"response-table-view",level:3},{value:"Full JSON response",id:"full-json-response",level:3}];function d(n){const e={a:"a",admonition:"admonition",blockquote:"blockquote",br:"br",code:"code",h1:"h1",h2:"h2",h3:"h3",img:"img",p:"p",pre:"pre",strong:"strong",...(0,t.a)(),...n.components};return(0,a.jsxs)(a.Fragment,{children:[(0,a.jsx)(e.h1,{id:"resume",children:"Resume"}),"\n",(0,a.jsx)(e.admonition,{type:"note",children:(0,a.jsxs)(e.p,{children:["User will login using ",(0,a.jsx)("kbd",{children:"Clave Unica"})," IdP.",(0,a.jsx)(e.br,{}),"\n",(0,a.jsx)(e.a,{href:"/cenabast-tienda/docs/api-rest-services/login",children:"Login"})," will be implemented using a Single Sign On (SSO) solution, like keycloak.\\"]})}),"\n",(0,a.jsx)(e.admonition,{type:"note",children:(0,a.jsx)(e.p,{children:"User will need to complete the following information:"})}),"\n",(0,a.jsx)(e.p,{children:(0,a.jsx)(e.img,{alt:"2023-11-06_17-49.png",src:i(4e3).Z+"",width:"1153",height:"58"})}),"\n",(0,a.jsx)(e.h2,{id:"rut-user-request",children:"RUT user Request"}),"\n",(0,a.jsx)(e.admonition,{type:"warning",children:(0,a.jsxs)(e.p,{children:["After user is authenticated, using the user RUT we should request organizations related to the user.",(0,a.jsx)(e.br,{}),"\n","Request: ",(0,a.jsx)(e.strong,{children:"RUT usuario"}),"\\"]})}),"\n",(0,a.jsx)(e.pre,{children:(0,a.jsx)(e.code,{className:"language-jsx",children:"GET https://<<HOST>>/proyectosti/apiusuarios/v1/recurso/tienda/destinatarios/<<RUT>>\n"})}),"\n",(0,a.jsx)(e.h2,{id:"response-respuesta-deseable",children:"Response (Respuesta deseable)"}),"\n",(0,a.jsx)(e.admonition,{type:"tip",children:(0,a.jsxs)(e.blockquote,{children:["\n",(0,a.jsxs)(e.p,{children:[(0,a.jsx)(e.strong,{children:"Basicamente se requiere"}),":",(0,a.jsx)(e.br,{}),"\n",(0,a.jsx)(e.br,{}),"\n","\ud83d\udc49 Organismos ",(0,a.jsx)(e.strong,{children:"solicitantes"})," asociados al RUT",(0,a.jsx)(e.br,{}),"\n","\ud83d\udc49 Organismos ",(0,a.jsx)(e.strong,{children:"destinatarios"})," por cada Organismo Solicitante",(0,a.jsx)(e.br,{}),"\n","\ud83d\udc49 ",(0,a.jsx)(e.strong,{children:"Puerto de descarga"})," por cada organismo destinatario.",(0,a.jsx)(e.br,{}),"\n","\ud83d\udc49 ",(0,a.jsx)(e.strong,{children:"L\xedneas autorizadas"})," de Compra asociadas al RUT\\"]}),"\n"]})}),"\n",(0,a.jsx)(e.admonition,{type:"warning",children:(0,a.jsxs)(e.p,{children:['El siguiente servicio "deseable" ',(0,a.jsx)(e.strong,{children:"s\xf3lo responde con los organismos solicitantes asociados al RUT del usuario"}),"."]})}),"\n",(0,a.jsx)(e.h3,{id:"response-table-view",children:"Response table view"}),"\n",(0,a.jsx)(e.p,{children:(0,a.jsx)(e.img,{alt:"2023-11-08_10-34.png",src:i(8810).Z+"",width:"1203",height:"700"})}),"\n",(0,a.jsx)(e.h3,{id:"full-json-response",children:"Full JSON response"}),"\n",(0,a.jsx)(e.pre,{children:(0,a.jsx)(e.code,{className:"language-jsx",children:"GET https://<<HOST>>/proyectosti/apiusuarios/v1/recurso/tienda/destinatarios/16338556\n"})}),"\n",(0,a.jsx)(e.pre,{children:(0,a.jsx)(e.code,{className:"language-jsx",children:'[\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 221,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201707,\n    "destinatario": "CESFAM RAHUE",\n    "canal": 1,\n    "nombreCanal": "INTERMEDIACION",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 4451,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 3,\n    "nombreCanal": "ARTROSIS",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 4452,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 6,\n    "nombreCanal": "CARDIOVASCULAR",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 4453,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 14,\n    "nombreCanal": "IRA ERA",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 4454,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 16,\n    "nombreCanal": "PARKINSON",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 7341,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 58,\n    "nombreCanal": "GES DE 6 A\xd1OS",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 7370,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 59,\n    "nombreCanal": "GES DE EMBARAZADAS",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 5316,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 27,\n    "nombreCanal": "TBC",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 7312,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 57,\n    "nombreCanal": "SEMBRANDO SONRISAS",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 8342,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 50,\n    "nombreCanal": "PROGRAMACI\xd3N GES 60 A\xd1OS",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 10741,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 68,\n    "nombreCanal": "ADULTO 60 A\xd1OS",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 4455,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 18,\n    "nombreCanal": "PRESBICIA",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 4456,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 20,\n    "nombreCanal": "PROG. MUJER",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 4457,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 26,\n    "nombreCanal": "EPILEPSIA",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 4458,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201708,\n    "destinatario": "SS Osorno Bodega",\n    "canal": 49,\n    "nombreCanal": "HIPOTIROIDISMO",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 2666,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201992,\n    "destinatario": "COSAM ORIENTE",\n    "canal": 1,\n    "nombreCanal": "INTERMEDIACION",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 9200,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 201992,\n    "destinatario": "COSAM ORIENTE",\n    "canal": 64,\n    "nombreCanal": "IVE",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 15611,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 205226,\n    "destinatario": "DROGUERIA SS OSORNO",\n    "canal": 74,\n    "nombreCanal": "",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 14041,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 205226,\n    "destinatario": "DROGUERIA SS OSORNO",\n    "canal": 62,\n    "nombreCanal": "DISRAFIAS",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 14042,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 205226,\n    "destinatario": "DROGUERIA SS OSORNO",\n    "canal": 69,\n    "nombreCanal": "GES MAYORES 65 A\xd1OS",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 14043,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 205226,\n    "destinatario": "DROGUERIA SS OSORNO",\n    "canal": 61,\n    "nombreCanal": "HERMORRAGIA SUBARACNOIDEA",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 14044,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 205226,\n    "destinatario": "DROGUERIA SS OSORNO",\n    "canal": 63,\n    "nombreCanal": "PARKINSON",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 14887,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 205226,\n    "destinatario": "DROGUERIA SS OSORNO",\n    "canal": 72,\n    "nombreCanal": "",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 15249,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 205226,\n    "destinatario": "DROGUERIA SS OSORNO",\n    "canal": 73,\n    "nombreCanal": "",\n    "direccionDespacho": ""\n  },\n  {\n    "rut_usuario": 16338556,\n    "idRelacion": 14040,\n    "rutSolicitante": 61607600,\n    "solicitante": "S.S. OSORNO",\n    "rutDestinatario": 205226,\n    "destinatario": "DROGUERIA SS OSORNO",\n    "canal": 60,\n    "nombreCanal": "ACCIDENTE CEREBRO VASCULAR",\n    "direccionDespacho": ""\n  }\n]\n'})})]})}function u(n={}){const{wrapper:e}={...(0,t.a)(),...n.components};return e?(0,a.jsx)(e,{...n,children:(0,a.jsx)(d,{...n})}):d(n)}},4e3:(n,e,i)=>{i.d(e,{Z:()=>a});const a=i.p+"assets/images/2023-11-06_17-49-7c609de42e53614af480c68df4d1fedf.png"},8810:(n,e,i)=>{i.d(e,{Z:()=>a});const a=i.p+"assets/images/2023-11-08_10-34-f74de5a2e33282c7e6327a3c7b41627c.png"},1151:(n,e,i)=>{i.d(e,{Z:()=>r,a:()=>s});var a=i(7294);const t={},o=a.createContext(t);function s(n){const e=a.useContext(o);return a.useMemo((function(){return"function"==typeof n?n(e):{...e,...n}}),[e,n])}function r(n){let e;return e=n.disableParentContext?"function"==typeof n.components?n.components(t):n.components||t:s(n.components),a.createElement(o.Provider,{value:e},n.children)}}}]);