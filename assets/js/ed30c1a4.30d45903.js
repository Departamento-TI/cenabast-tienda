"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[1421],{7802:(e,a,n)=>{n.r(a),n.d(a,{assets:()=>c,contentTitle:()=>i,default:()=>u,frontMatter:()=>r,metadata:()=>o,toc:()=>d});var t=n(5893),s=n(1151);const r={title:"Login Sequence",published:!0,date:new Date("2023-11-20T15:57:38.836Z"),editor:"markdown",dateCreated:new Date("2023-10-25T14:37:43.360Z")},i="Buyer Login Flow",o={id:"api-rest-services/login",title:"Login Sequence",description:"Autorizaci\xf3n via Clave \xdanica Usuario",source:"@site/docs/api-rest-services/login.md",sourceDirName:"api-rest-services",slug:"/api-rest-services/login",permalink:"/cenabast-tienda/docs/api-rest-services/login",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/api-rest-services/login.md",tags:[],version:"current",frontMatter:{title:"Login Sequence",published:!0,date:"2023-11-20T15:57:38.836Z",editor:"markdown",dateCreated:"2023-10-25T14:37:43.360Z"},sidebar:"tutorialSidebar",previous:{title:"Forecast Service",permalink:"/cenabast-tienda/docs/api-rest-services/forecast"},next:{title:"Orders",permalink:"/cenabast-tienda/docs/api-rest-services/orders"}},c={},d=[];function l(e){const a={admonition:"admonition",code:"code",h1:"h1",p:"p",pre:"pre",strong:"strong",...(0,s.a)(),...e.components};return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(a.h1,{id:"buyer-login-flow",children:"Buyer Login Flow"}),"\n",(0,t.jsx)(a.admonition,{type:"tip",children:(0,t.jsxs)(a.p,{children:["Autorizaci\xf3n via ",(0,t.jsx)(a.strong,{children:"Clave \xdanica"})," Usuario"]})}),"\n",(0,t.jsx)(a.h1,{id:"deseable",children:"Deseable"}),"\n",(0,t.jsx)(a.pre,{children:(0,t.jsx)(a.code,{className:"language-mermaid",children:"sequenceDiagram\n     Note left of Tienda Cenabast: Usuario ingresa<br>directamente a<br> la nueva tienda de<br>Cenabast\n     Note left of Clave Unica: Usuario es<br>derivado al portal de<br>Clave Unica.\n     Tienda Cenabast ->> Clave Unica: Autenticaci\xf3n RUT Personal\n     Clave Unica --\x3e> Tienda Cenabast: Autenticaci\xf3n Correcta\n     Tienda Cenabast ->> SAP Cenabast: Organismos relacionados\n     Note left of Tienda Cenabast: Se preguntan los<br>permisos y relaciones<br>del RUT usuario.\n     SAP Cenabast --\x3e> Tienda Cenabast: Organismos A,B,C.\n     Note left of SAP Cenabast: Respuesta con<br>Organismos, l\xedneas<br>de Negocio, y restric-<br>cciones del usuario.\n     Tienda Cenabast ->> Mercado Publico: Perfil de Usuario\n     Note left of Tienda Cenabast: Se pregunta a MP<br>por las Unidades<br>de Compra y otros<br> datos asociados<br>al usuario.\n     Mercado Publico --\x3e> Tienda Cenabast: Roles, Permisos, etc.\n     Note left of Mercado Publico: MP responde con las<br>Unidades de Compra<br>y otros datos.\n"})}),"\n",(0,t.jsx)(a.h1,{id:"piloto",children:"Piloto"}),"\n",(0,t.jsx)(a.pre,{children:(0,t.jsx)(a.code,{className:"language-mermaid",children:"sequenceDiagram\n     Note left of Tienda Cenabast: Usuario ingresa<br>directamente a<br> la nueva tienda de<br>Cenabast\n     Note left of Clave Unica: Usuario es<br>derivado al portal de<br>Clave Unica.\n     Tienda Cenabast ->> Clave Unica: Autenticaci\xf3n RUT Personal\n     Clave Unica --\x3e> Tienda Cenabast: Autenticaci\xf3n Correcta\n     Tienda Cenabast ->> SAP Cenabast: Organismos relacionados\n     Note left of Tienda Cenabast: Se preguntan los<br>permisos y relaciones<br>del RUT usuario.\n     SAP Cenabast --\x3e> Tienda Cenabast: Organismos A,B,C.\n     Note left of SAP Cenabast: Respuesta con<br>Organismos, l\xedneas<br>de Negocio, y restric-<br>cciones del usuario.\n"})})]})}function u(e={}){const{wrapper:a}={...(0,s.a)(),...e.components};return a?(0,t.jsx)(a,{...e,children:(0,t.jsx)(l,{...e})}):l(e)}},1151:(e,a,n)=>{n.d(a,{Z:()=>o,a:()=>i});var t=n(7294);const s={},r=t.createContext(s);function i(e){const a=t.useContext(r);return t.useMemo((function(){return"function"==typeof e?e(a):{...a,...e}}),[a,e])}function o(e){let a;return a=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:i(e.components),t.createElement(r.Provider,{value:a},e.children)}}}]);