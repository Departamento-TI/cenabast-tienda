"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[9373],{2767:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>c,contentTitle:()=>o,default:()=>p,frontMatter:()=>s,metadata:()=>i,toc:()=>d});var r=t(5893),a=t(1151);const s={title:"Contrats",published:!0,date:new Date("2023-11-06T21:29:25.260Z"),editor:"markdown",dateCreated:new Date("2023-11-06T15:10:54.660Z")},o="Resume",i={id:"api-rest-services/Cenabast/Proveedores-V2/contracts",title:"Contrats",description:"After an auction, the winner bidder signs a contract with Cenabast.",source:"@site/docs/api-rest-services/Cenabast/Proveedores-V2/contracts.md",sourceDirName:"api-rest-services/Cenabast/Proveedores-V2",slug:"/api-rest-services/Cenabast/Proveedores-V2/contracts",permalink:"/cenabast-tienda/docs/api-rest-services/Cenabast/Proveedores-V2/contracts",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/api-rest-services/Cenabast/Proveedores-V2/contracts.md",tags:[],version:"current",frontMatter:{title:"Contrats",published:!0,date:"2023-11-06T21:29:25.260Z",editor:"markdown",dateCreated:"2023-11-06T15:10:54.660Z"},sidebar:"tutorialSidebar",previous:{title:"API Authentication",permalink:"/cenabast-tienda/docs/api-rest-services/Cenabast/Proveedores-V2/api-authentication"},next:{title:"Products",permalink:"/cenabast-tienda/docs/api-rest-services/Cenabast/Proveedores-V2/products"}},c={},d=[];function l(e){const n={admonition:"admonition",code:"code",h1:"h1",img:"img",p:"p",pre:"pre",strong:"strong",...(0,a.a)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(n.h1,{id:"resume",children:"Resume"}),"\n",(0,r.jsx)(n.p,{children:"After an auction, the winner bidder signs a contract with Cenabast."}),"\n",(0,r.jsx)(n.h1,{id:"api-service",children:"API Service"}),"\n",(0,r.jsx)(n.h1,{id:"api-example",children:"API example"}),"\n",(0,r.jsx)(n.p,{children:(0,r.jsx)(n.strong,{children:"Request API for producto ZGEN: 100003753"})}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-jsx",children:"POST {{host}}/WebApi2/api/v2/Public/contrato \\\n  --header 'Authorization: {{token}}' \\\n  --data '{\n\"ZGEN\": \"100003753\"\n}'\n"})}),"\n",(0,r.jsx)(n.p,{children:(0,r.jsx)(n.strong,{children:"Response:"})}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-jsx",children:'[\n  {\n    "PedidoCompra": "4500026400",\n    "IdMercadoPublico": "621-1224-SE21     ",\n    "ordenDeCompra": "621-460-LR21      ",\n    "Posicion": "120",\n    "fechaEntrega": "01-12-2022 0:00:00",\n    "ZGEN": "100003753",\n    "NombreZgen": "FINGOLIMOD 0,5 MG CP                    ",\n    "GrupoArticulo": "3RI      ",\n    "ZCEN": "500007740",\n    "NombreZCEN": "EMINOD (FINGOLIMOD) 0,5 MG CAJ 30 CP    ",\n    "Cantidad": 30,\n    "UnidadVenta": "CAJ",\n    "NombreProveedor": "ASCEND LABORATORIES SPA",\n    "RutProveedorSinDv": 76175092,\n    "RutProveedorConDv": "76175092-5",\n    "ValorNeto": 21000.0,\n    "Valoriva": 3990.0,\n    "ValorTotal": 24990.0,\n    "FInicialContrato": "202201",\n    "FFinalContrato": "202306"\n  },\n  {\n\n  }\n ]\n'})}),"\n",(0,r.jsx)(n.admonition,{type:"tip",children:(0,r.jsx)(n.p,{children:"When listing all available contracts, the information given is related to the programmed purchase, which shows the QTY per month:"})}),"\n",(0,r.jsx)(n.p,{children:(0,r.jsx)(n.img,{alt:"2023-11-06_18-25_1.png",src:t(4330).Z+"",width:"1344",height:"420"})})]})}function p(e={}){const{wrapper:n}={...(0,a.a)(),...e.components};return n?(0,r.jsx)(n,{...e,children:(0,r.jsx)(l,{...e})}):l(e)}},4330:(e,n,t)=>{t.d(n,{Z:()=>r});const r=t.p+"assets/images/2023-11-06_18-25_1-5e07254d50f418ba5137d315beb0debd.png"},1151:(e,n,t)=>{t.d(n,{Z:()=>i,a:()=>o});var r=t(7294);const a={},s=r.createContext(a);function o(e){const n=r.useContext(s);return r.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function i(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(a):e.components||a:o(e.components),r.createElement(s.Provider,{value:n},e.children)}}}]);