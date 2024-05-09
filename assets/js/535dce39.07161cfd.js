"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[8778],{4930:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>c,contentTitle:()=>o,default:()=>u,frontMatter:()=>r,metadata:()=>i,toc:()=>d});var a=t(5893),s=t(1151);const r={},o="Contract",i={id:"api-rest-services/Cenabast/tienda/contract",title:"Contract",description:"Request",source:"@site/docs/api-rest-services/Cenabast/tienda/contract.md",sourceDirName:"api-rest-services/Cenabast/tienda",slug:"/api-rest-services/Cenabast/tienda/contract",permalink:"/cenabast-tienda/docs/api-rest-services/Cenabast/tienda/contract",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/main/docs/docs/api-rest-services/Cenabast/tienda/contract.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Buyer User info",permalink:"/cenabast-tienda/docs/api-rest-services/Cenabast/tienda/buyer-user-info"},next:{title:"Forecast",permalink:"/cenabast-tienda/docs/api-rest-services/Cenabast/tienda/forecast"}},c={},d=[{value:"Request",id:"request",level:2},{value:"Response",id:"response",level:2}];function l(e){const n={a:"a",admonition:"admonition",code:"code",h1:"h1",h2:"h2",p:"p",pre:"pre",...(0,s.a)(),...e.components};return(0,a.jsxs)(a.Fragment,{children:[(0,a.jsx)(n.h1,{id:"contract",children:"Contract"}),"\n",(0,a.jsx)(n.h2,{id:"request",children:"Request"}),"\n",(0,a.jsx)(n.admonition,{type:"tip",children:(0,a.jsxs)(n.p,{children:["Get contracts for ",(0,a.jsx)(n.a,{href:"/cenabast-tienda/docs/business/products",children:"ZGEN"})," product 100000022."]})}),"\n",(0,a.jsx)(n.pre,{children:(0,a.jsx)(n.code,{className:"language-jsx",children:"GET '{{host}}/interoperabilidad/tienda/api/v1/materiales/contratos/500016333' \\\n--header 'Authorization: Bearer {{token}}'\n\n"})}),"\n",(0,a.jsx)(n.h2,{id:"response",children:"Response"}),"\n",(0,a.jsx)(n.pre,{children:(0,a.jsx)(n.code,{className:"language-jsx",children:'{\n    "code": 200,\n    "isSuccessStatusCode": true,\n    "content": [\n        {\n            "pedidoCompra": "4500029367",\n            "idMercadoPublico": "621-836-LR22",\n            "ocMercadoPublico": "621-1260-SE22",\n            "zgen": "100001143",\n            "nombreZGEN": "PARACETAMOL 500 MG CM/CM REC",\n            "zcen": "500016333",\n            "nombreZCEN": "PARACETAMOL 500 MG CAJ 1000 CM",\n            "cantidad": 1000.00,\n            "unidadVenta": "CAJ",\n            "unidad": "UN",\n            "nombreProveedor": "PHARMA NETWORK SPA",\n            "rutProveedor": "76857605-K",\n            "valorNeto": 8990.00,\n            "valorIVA": 1708.10,\n            "valorTotal": 10698.10,\n            "valorComision": 89.90,\n            "fechaInicialContrato": "202303",\n            "fechaFinalContrato": "202408",\n            "centro": 5000\n        }\n    ]\n}\n'})})]})}function u(e={}){const{wrapper:n}={...(0,s.a)(),...e.components};return n?(0,a.jsx)(n,{...e,children:(0,a.jsx)(l,{...e})}):l(e)}},1151:(e,n,t)=>{t.d(n,{Z:()=>i,a:()=>o});var a=t(7294);const s={},r=a.createContext(s);function o(e){const n=a.useContext(r);return a.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function i(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:o(e.components),a.createElement(r.Provider,{value:n},e.children)}}}]);