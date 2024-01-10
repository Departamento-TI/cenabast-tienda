"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[6339],{9239:(e,s,r)=>{r.r(s),r.d(s,{assets:()=>d,contentTitle:()=>c,default:()=>h,frontMatter:()=>t,metadata:()=>a,toc:()=>l});var i=r(5893),n=r(1151);const t={title:"API REST Services",published:!0,date:new Date("2023-11-08T14:53:34.284Z"),editor:"markdown",dateCreated:new Date("2023-10-25T14:36:36.278Z")},c="Resume",a={id:"api-rest-services/api-rest-services",title:"API REST Services",description:"The Store will need to handle multiple connections or integrations with third party services:\\",source:"@site/docs/api-rest-services/api-rest-services.md",sourceDirName:"api-rest-services",slug:"/api-rest-services/",permalink:"/docs/api-rest-services/",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/api-rest-services/api-rest-services.md",tags:[],version:"current",frontMatter:{title:"API REST Services",published:!0,date:"2023-11-08T14:53:34.284Z",editor:"markdown",dateCreated:"2023-10-25T14:36:36.278Z"},sidebar:"tutorialSidebar",previous:{title:"Platform Suggestion",permalink:"/docs/Store Project/spree-base-suggestion"},next:{title:"API Authentication",permalink:"/docs/api-rest-services/api-authentication"}},d={},l=[];function o(e){const s={a:"a",br:"br",em:"em",h1:"h1",li:"li",p:"p",strong:"strong",ul:"ul",...(0,n.a)(),...e.components};return(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)(s.h1,{id:"resume",children:"Resume"}),"\n",(0,i.jsxs)(s.p,{children:["The Store will need to handle multiple connections or integrations with third party services:",(0,i.jsx)(s.br,{}),"\n","\ud83d\udc49 GET ERP (SAP) for fetching product data.",(0,i.jsx)(s.br,{}),"\n","\ud83d\udc49 POST to ERP (SAP) new Sales Orders.",(0,i.jsx)(s.br,{}),"\n","\ud83d\udc49 POST to Mercado Publico Purchase Order.",(0,i.jsx)(s.br,{}),"\n","\ud83d\udc49 POST to SIGFE Purchase Order ",(0,i.jsx)(s.strong,{children:"budget validation"}),".",(0,i.jsx)(s.br,{}),"\n","\ud83d\udc49 GET Invoice.\\"]}),"\n",(0,i.jsxs)(s.p,{children:["Each service has its own Authentication, Cache policies, etc. Which is why it make sense to ",(0,i.jsx)("mark",{children:(0,i.jsx)(s.strong,{children:"implement an API gateway"})})," for proper management."]}),"\n",(0,i.jsxs)(s.p,{children:["[!NOTE]\nAll API endpoints will be available for testing ",(0,i.jsx)(s.a,{href:"https://postman.patagon.dev/",children:"here"}),".",(0,i.jsx)(s.br,{}),"\n","Authentication is required."]}),"\n",(0,i.jsx)(s.h1,{id:"api-services",children:"API Services"}),"\n",(0,i.jsxs)(s.ul,{children:["\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"/docs/api-rest-services/login",children:["User Authentication ",(0,i.jsx)(s.em,{children:"Clave Unica"})]})}),"\n"]}),"\n",(0,i.jsx)(s.h1,{id:"api-user-service",children:"API User Service"}),"\n",(0,i.jsxs)(s.ul,{children:["\n",(0,i.jsx)(s.li,{children:(0,i.jsx)(s.a,{href:"/docs/api-rest-services/user-api-authentication",children:"API authentication"})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsx)(s.a,{href:"/docs/api-rest-services/users",children:"Get User Company Relations"})}),"\n"]}),"\n",(0,i.jsx)(s.h1,{id:"api-products",children:"API Products"}),"\n",(0,i.jsxs)(s.ul,{children:["\n",(0,i.jsx)(s.li,{children:(0,i.jsx)(s.a,{href:"/docs/api-rest-services/api-authentication",children:"API authentication"})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsx)(s.a,{href:"organismos.md",children:"Organismos"})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsx)(s.a,{href:"/docs/api-rest-services/products",children:"Products"})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsx)(s.a,{href:"/docs/api-rest-services/contracts",children:"Contracts"})}),"\n"]}),"\n",(0,i.jsx)(s.h1,{id:"api-forecast",children:"API Forecast"}),"\n",(0,i.jsxs)(s.ul,{children:["\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"/docs/api-rest-services/forecast",children:["Forecast ",(0,i.jsx)(s.em,{children:(0,i.jsx)("mark",{children:"pending"})})]})}),"\n"]}),"\n",(0,i.jsx)(s.h1,{id:"api-checkout--push-orders",children:"API Checkout & Push Orders"}),"\n",(0,i.jsxs)(s.ul,{children:["\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"checkout.md",children:["Checkout ",(0,i.jsx)(s.em,{children:(0,i.jsx)("mark",{children:"pending"})})]})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"/docs/api-rest-services/purchase-order",children:["Purchase Order ",(0,i.jsxs)(s.em,{children:["Mercado Publico ",(0,i.jsx)("mark",{children:"pending"})]})]})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"validate-order-from-sap.md",children:["Validate Stock from SAP ",(0,i.jsx)(s.em,{children:(0,i.jsx)("mark",{children:"pending"})})]})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"push-order-to-sap.md",children:["PUSH Order to SAP ",(0,i.jsx)(s.em,{children:(0,i.jsx)("mark",{children:"pending"})})]})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"sigfe.md",children:["SIGFE ",(0,i.jsx)(s.em,{children:(0,i.jsx)("mark",{children:"pending"})})]})}),"\n"]}),"\n",(0,i.jsx)(s.h1,{id:"api-list",children:"API list"}),"\n",(0,i.jsxs)(s.ul,{children:["\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"https://testaplicacionesweb.cenabast.cl:7001/WebApi2/documentacion/index.html#/",children:["API Cenabast Directory WebAPI2 ",(0,i.jsx)(s.em,{children:"external link"})]})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsxs)(s.a,{href:"https://aplicacionesweb.cenabast.cl/webapi/swagger/ui/index#",children:["API Cenabast Sellers ",(0,i.jsx)(s.em,{children:"API por Sellers for managing orders"})]})}),"\n",(0,i.jsx)(s.li,{children:(0,i.jsx)(s.a,{href:"https://testaplicacionesweb.cenabast.cl:7001/interoperabilidad/servicios/docs/index.html",children:"API Tienda Cenabast \ud83e\udd77"})}),"\n"]}),"\n",(0,i.jsx)(s.h1,{id:"api-for-vendors",children:"API for Vendors"}),"\n",(0,i.jsx)(s.p,{children:"[!WARNING]\n\u26a0\ufe0f Pending. This API services are mainly for Vendors that needs to manage orders."}),"\n",(0,i.jsxs)(s.ul,{children:["\n",(0,i.jsx)(s.li,{children:(0,i.jsx)(s.a,{href:"/docs/api-rest-services/seller-public-distribution",children:"API Public Distribution"})}),"\n"]})]})}function h(e={}){const{wrapper:s}={...(0,n.a)(),...e.components};return s?(0,i.jsx)(s,{...e,children:(0,i.jsx)(o,{...e})}):o(e)}},1151:(e,s,r)=>{r.d(s,{Z:()=>a,a:()=>c});var i=r(7294);const n={},t=i.createContext(n);function c(e){const s=i.useContext(t);return i.useMemo((function(){return"function"==typeof e?e(s):{...s,...e}}),[s,e])}function a(e){let s;return s=e.disableParentContext?"function"==typeof e.components?e.components(n):e.components||n:c(e.components),i.createElement(t.Provider,{value:s},e.children)}}}]);