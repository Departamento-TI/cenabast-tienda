"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[7594],{4173:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>l,contentTitle:()=>a,default:()=>h,frontMatter:()=>o,metadata:()=>i,toc:()=>c});var r=n(5893),s=n(1151);const o={title:"Sale Channels",published:!0,date:new Date("2024-02-27T14:02:49.917Z"),editor:"markdown",dateCreated:new Date("2023-10-26T21:45:58.170Z")},a="Overview",i={id:"Store Project/development-functionalities/sale-channels",title:"Sale Channels",description:"This doc explains how the implementation of Sale Channels (ie. eCommerce, Intermediaci\xf3n) was done in the Spree Cenabast project.",source:"@site/docs/2_Store Project/development-functionalities/sale-channels.md",sourceDirName:"2_Store Project/development-functionalities",slug:"/Store Project/development-functionalities/sale-channels",permalink:"/cenabast-tienda/docs/Store Project/development-functionalities/sale-channels",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/main/docs/docs/2_Store Project/development-functionalities/sale-channels.md",tags:[],version:"current",frontMatter:{title:"Sale Channels",published:!0,date:"2024-02-27T14:02:49.917Z",editor:"markdown",dateCreated:"2023-10-26T21:45:58.170Z"},sidebar:"tutorialSidebar",previous:{title:"Recomendations",permalink:"/cenabast-tienda/docs/Store Project/development-functionalities/recomendations"},next:{title:"Guidelines",permalink:"/cenabast-tienda/docs/Store Project/development-guidelines/"}},l={},c=[{value:"Implementation",id:"implementation",level:2},{value:"Current Store find logic",id:"current-store-find-logic",level:3}];function d(e){const t={a:"a",admonition:"admonition",code:"code",h1:"h1",h2:"h2",h3:"h3",li:"li",mermaid:"mermaid",p:"p",ul:"ul",...(0,s.a)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(t.h1,{id:"overview",children:"Overview"}),"\n",(0,r.jsx)(t.admonition,{type:"info",children:(0,r.jsx)(t.p,{children:"This doc explains how the implementation of Sale Channels (ie. eCommerce, Intermediaci\xf3n) was done in the Spree Cenabast project."})}),"\n",(0,r.jsxs)(t.p,{children:["See also: ",(0,r.jsx)(t.a,{href:"/cenabast-tienda/docs/Store%20Project/functionalities/channels",children:"Sale Channel definition, explanation of business logic"})]}),"\n",(0,r.jsxs)(t.p,{children:["Each Sale Channel was represented by a ",(0,r.jsx)(t.a,{href:"https://dev-docs.spreecommerce.org/internals/stores",children:"Spree::Store"}),"."]}),"\n",(0,r.jsx)(t.p,{children:"A Spree::Store is associated with a set of products, enabled payment methods, layout configuration and other preferences.\nIn that way, it's well suited to represent the differences between each Sale Channel."}),"\n",(0,r.jsx)(t.h2,{id:"implementation",children:"Implementation"}),"\n",(0,r.jsxs)(t.p,{children:["The ",(0,r.jsx)(t.code,{children:"current_store_finder"})," dependancy was modified to use a custom finder class. The original finder detects the Store based on the URL. Our Store Finder will work based on the current user preferences."]}),"\n",(0,r.jsxs)(t.p,{children:["Each user will have a list of ",(0,r.jsx)(t.code,{children:"Recievers"})," that is authorized to request to buy from. Each ",(0,r.jsx)(t.code,{children:"Cenabast::Spree::Receiver"})," is associated with a requester ",(0,r.jsx)(t.code,{children:"Cenabast::Spree::Requester"})," (Organismo Solicitante) and a sale channel ",(0,r.jsx)(t.code,{children:"Spree::Store"})," (Canal de venta)."]}),"\n",(0,r.jsx)(t.p,{children:"The user amongst its store preferences will be able to switch between requesters receivers and stores amongst its enabled ones."}),"\n",(0,r.jsxs)(t.ul,{children:["\n",(0,r.jsx)(t.li,{children:"For Requesters, the enabled ones are all the requesters associated to the user"}),"\n",(0,r.jsx)(t.li,{children:"For Receivers, the enabled ones are all the receivers that belong to the requester, AND are also associated to the user"}),"\n",(0,r.jsx)(t.li,{children:"For Stores, the enabled ones are all the stores that match the any Receiver that has the current receiver RUN, and also belong to the current available receivers (ie. all the receivers with the same RUN of the current one. That belong to the same requester, and the user has also permission to use that receiver)"}),"\n"]}),"\n",(0,r.jsx)(t.p,{children:"Admin users by default have access to all the Requesters. and all the Receivers from that current Requester."}),"\n",(0,r.jsxs)(t.p,{children:["Details of the switch logic, relationships and other available related methods can be found in the ",(0,r.jsx)(t.code,{children:"Cenabast::Spree::User::StorePreference"})," concern."]}),"\n",(0,r.jsxs)(t.p,{children:["A controller ",(0,r.jsx)(t.code,{children:"Cenabast::Spree::UserPreferencesController"})," was defined in order to allow users to toggle their preferences (requester, receiver, store, etc), from the frontend."]}),"\n",(0,r.jsx)(t.p,{children:"The store toggle logic can be interated from the frontend via a dropdown menus present in the header."}),"\n",(0,r.jsxs)(t.p,{children:["Then, the ",(0,r.jsx)(t.code,{children:"current_store"})," for the user will be defined the store that the ",(0,r.jsx)(t.code,{children:"current_receiver"})," belongs to."]}),"\n",(0,r.jsx)(t.h3,{id:"current-store-find-logic",children:"Current Store find logic"}),"\n",(0,r.jsx)(t.mermaid,{value:'flowchart TD\n    A[Spree::Core::ControllerHelpers::Store#current_store] --\x3e|Use current_store_finder| B[Cenabast::Spree::Stores::FindCurrent]\n    B --\x3e |Consider user allowed stores| C[current_user.available_stores]\n    B --\x3e |Consider current store for current receiver| D["Spree::Store.where(id: current_receiver.current_store_id)"]'})]})}function h(e={}){const{wrapper:t}={...(0,s.a)(),...e.components};return t?(0,r.jsx)(t,{...e,children:(0,r.jsx)(d,{...e})}):d(e)}},1151:(e,t,n)=>{n.d(t,{Z:()=>i,a:()=>a});var r=n(7294);const s={},o=r.createContext(s);function a(e){const t=r.useContext(o);return r.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function i(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:a(e.components),r.createElement(o.Provider,{value:t},e.children)}}}]);