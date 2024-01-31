"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[3965],{1563:(e,n,i)=>{i.r(n),i.d(n,{assets:()=>d,contentTitle:()=>s,default:()=>h,frontMatter:()=>a,metadata:()=>o,toc:()=>c});var t=i(5893),r=i(1151);const a={title:"B2B module",published:!0,date:new Date("2023-10-26T20:07:21.501Z"),editor:"markdown",dateCreated:new Date("2023-10-26T16:12:31.748Z")},s=void 0,o={id:"Store Project/functionalities/b2b-module-logic-functionality",title:"B2B module",description:"Resume",source:"@site/docs/2_Store Project/functionalities/b2b-module-logic-functionality.md",sourceDirName:"2_Store Project/functionalities",slug:"/Store Project/functionalities/b2b-module-logic-functionality",permalink:"/cenabast-tienda/docs/Store Project/functionalities/b2b-module-logic-functionality",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/2_Store Project/functionalities/b2b-module-logic-functionality.md",tags:[],version:"current",frontMatter:{title:"B2B module",published:!0,date:"2023-10-26T20:07:21.501Z",editor:"markdown",dateCreated:"2023-10-26T16:12:31.748Z"},sidebar:"tutorialSidebar",previous:{title:"Forecast Cart",permalink:"/cenabast-tienda/docs/Store Project/functionalities/Forecast-cart"},next:{title:"Channels",permalink:"/cenabast-tienda/docs/Store Project/functionalities/channels"}},d={},c=[{value:"Resume",id:"resume",level:3}];function l(e){const n={a:"a",admonition:"admonition",br:"br",code:"code",h1:"h1",h3:"h3",img:"img",p:"p",pre:"pre",strong:"strong",...(0,r.a)(),...e.components};return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(n.h3,{id:"resume",children:"Resume"}),"\n",(0,t.jsx)(n.admonition,{type:"tip",children:(0,t.jsxs)(n.p,{children:["Users will log into the Store using their personal Credentials.",(0,t.jsx)(n.br,{}),"\n","Once users are logged in, the ",(0,t.jsx)(n.a,{href:"../../api-rest-services/users.md",children:"User API Service"})," will return all related information to the user."]})}),"\n",(0,t.jsx)(n.p,{children:"The following image shows a typical user/organization structure:"}),"\n",(0,t.jsx)(n.p,{children:(0,t.jsx)(n.img,{alt:"Image Structure",src:i(2135).Z+"",width:"1479",height:"824"})}),"\n",(0,t.jsx)(n.p,{children:"The above structure, we should be able to view it in the top header at all times:"}),"\n",(0,t.jsx)(n.p,{children:(0,t.jsx)(n.img,{alt:"header",src:i(1985).Z+"",width:"1546",height:"147"})}),"\n",(0,t.jsx)(n.h1,{id:"b2b-business-logic",children:"B2B Business Logic"}),"\n",(0,t.jsx)(n.admonition,{title:"Organizations",type:"danger",children:(0,t.jsxs)(n.p,{children:["\ud83d\udc49 Logged Users belongs to ",(0,t.jsx)(n.strong,{children:"organizations"})," ",(0,t.jsx)(n.br,{}),"\n","(User could belong to multiple organizations.) (Ex. Apple, Google, IBM, Microsoft)",(0,t.jsx)(n.br,{}),"\n","\ud83d\udc49 Each organizations has ",(0,t.jsx)(n.strong,{children:"sub-organizations"}),".",(0,t.jsx)(n.br,{}),"\n","(For Google, it could be like: Youtube, Google Cloud, Android, etc)",(0,t.jsx)(n.br,{}),"\n","\ud83d\udc49 Each sub-organizations ",(0,t.jsx)(n.strong,{children:(0,t.jsx)("mark",{children:"can have different Cost Centers"})}),(0,t.jsx)(n.br,{}),"\n","(For Youtube, it could be like: Finance, IT Department, HR Department, etc)."]})}),"\n",(0,t.jsx)(n.admonition,{title:"Shipping Address",type:"warning",children:(0,t.jsx)(n.p,{children:"\ud83d\udc49 Each Sub-Organization can have different Shipping Address.\\"})}),"\n",(0,t.jsx)(n.h1,{id:"user",children:"User"}),"\n",(0,t.jsxs)(n.p,{children:["For each user, we will need to the following data, which should be fetchend from the ",(0,t.jsx)(n.a,{href:"../../api-rest-services/users.md",children:"User API Service"})]}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-jsx",children:"User First Name\nUser Last Name\nUser RUT (primary key)\nUser email\n"})}),"\n",(0,t.jsx)(n.h1,{id:"organizations-aka-solicitante",children:'Organizations (aka: "Solicitante")'}),"\n",(0,t.jsx)(n.admonition,{type:"warning",children:(0,t.jsx)(n.p,{children:"\u26a0\ufe0f Pending: User/Organization relation key."})}),"\n",(0,t.jsx)(n.p,{children:"For Organizations, we will need the following data:"}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-ruby",children:"Organization Name\nOrganization RUT\nOrganization Address\nOrganization SAP ID\nOrganization DCCP ID\n"})}),"\n",(0,t.jsx)(n.h1,{id:"sub-organization-aka-destinatario",children:'Sub-Organization (aka: "Destinatario")'}),"\n",(0,t.jsx)(n.admonition,{type:"warning",children:(0,t.jsxs)(n.p,{children:["\u26a0\ufe0f ",(0,t.jsx)(n.strong,{children:"Pending"}),": Organization/Sub-Organization relation key."]})}),"\n",(0,t.jsx)(n.p,{children:"For Sub-Organizations, we will need the following data:"}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-ruby",children:"Sub-Organization Name\nSub-Organization RUT\nSub-Organization Address\nSub-Organization SAP ID\nSub-Organization DCCP ID\n"})}),"\n",(0,t.jsx)(n.h1,{id:"cost-centers-aka-unidad-de-compra",children:'Cost Centers (aka: "Unidad de Compra")'}),"\n",(0,t.jsx)(n.admonition,{type:"warning",children:(0,t.jsxs)(n.p,{children:["\u26a0\ufe0f ",(0,t.jsx)(n.strong,{children:"Pending"}),": Sub-Organization/Cost Center relation key."]})}),"\n",(0,t.jsx)(n.p,{children:"For Cost Centers, we will need the following data:"}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-ruby",children:"Cost Center Name\nCost Center DCCP ID\nCost Center DIPRES ID\n"})}),"\n",(0,t.jsx)(n.h1,{id:"shipping-address-aka-puerto-de-descarga",children:'Shipping Address (aka: "Puerto de descarga")'}),"\n",(0,t.jsx)(n.p,{children:"For each Shipping Address, we will need:"}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-ruby",children:"Street Name\nStreet Number\nRegion (or State)\nComuna (or County)\nPhone Number\nShipping Address Contact First Name\nShipping Address Contact Last Name\nShipping Address Contact Email\nShipping Adresss Contact Phone Number\n"})})]})}function h(e={}){const{wrapper:n}={...(0,r.a)(),...e.components};return n?(0,t.jsx)(n,{...e,children:(0,t.jsx)(l,{...e})}):l(e)}},2135:(e,n,i)=>{i.d(n,{Z:()=>t});const t=i.p+"assets/images/2023-10-26_17-05-1617c9b0426a5597ac9017314f79d593.png"},1985:(e,n,i)=>{i.d(n,{Z:()=>t});const t=i.p+"assets/images/2023-12-19_09-41-968cf189a63e27b9f32236c4c279c895.png"},1151:(e,n,i)=>{i.d(n,{Z:()=>o,a:()=>s});var t=i(7294);const r={},a=t.createContext(r);function s(e){const n=t.useContext(a);return t.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function o(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:s(e.components),t.createElement(a.Provider,{value:n},e.children)}}}]);