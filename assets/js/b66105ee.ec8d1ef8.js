"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[6047],{8582:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>l,contentTitle:()=>a,default:()=>h,frontMatter:()=>r,metadata:()=>o,toc:()=>d});var i=n(5893),s=n(1151);const r={title:"Interaction with ERP",published:!0,date:new Date("2024-04-16T14:02:49.917Z"),editor:"markdown",dateCreated:new Date("2024-04-16T14:02:49.917Z")},a="Overview",o={id:"Store Project/development-functionalities/interaction-with-erp",title:"Interaction with ERP",description:"This doc explains how Spree interacts with Cenabast ERP, in the lifecycle of an Spree::Order",source:"@site/docs/2_Store Project/development-functionalities/interaction-with-erp.md",sourceDirName:"2_Store Project/development-functionalities",slug:"/Store Project/development-functionalities/interaction-with-erp",permalink:"/cenabast-tienda/docs/Store Project/development-functionalities/interaction-with-erp",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/main/docs/docs/2_Store Project/development-functionalities/interaction-with-erp.md",tags:[],version:"current",frontMatter:{title:"Interaction with ERP",published:!0,date:"2024-04-16T14:02:49.917Z",editor:"markdown",dateCreated:"2024-04-16T14:02:49.917Z"},sidebar:"tutorialSidebar",previous:{title:"Clave Unica",permalink:"/cenabast-tienda/docs/Store Project/development-functionalities/clave-unica"},next:{title:"Login Process",permalink:"/cenabast-tienda/docs/Store Project/development-functionalities/login-process"}},l={},d=[{value:"Implementation",id:"implementation",level:2},{value:"SaleOrders statuses",id:"saleorders-statuses",level:3},{value:"See information about SaleOrders",id:"see-information-about-saleorders",level:3},{value:"Cancellation/Nullification of a SaleOrder",id:"cancellationnullification-of-a-saleorder",level:3}];function c(e){const t={admonition:"admonition",code:"code",h1:"h1",h2:"h2",h3:"h3",img:"img",li:"li",p:"p",ul:"ul",...(0,s.a)(),...e.components};return(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)(t.h1,{id:"overview",children:"Overview"}),"\n",(0,i.jsx)(t.admonition,{type:"info",children:(0,i.jsx)(t.p,{children:"This doc explains how Spree interacts with Cenabast ERP, in the lifecycle of an Spree::Order"})}),"\n",(0,i.jsx)(t.h2,{id:"implementation",children:"Implementation"}),"\n",(0,i.jsx)(t.p,{children:"When an Spree::Order finishes the checkout process, it will get into state complete.\nThis will trigger a series of callbacks, one of those being the submission to the ERP."}),"\n",(0,i.jsxs)(t.p,{children:["Using the ",(0,i.jsx)(t.code,{children:"#inject_to_erp!"})," method, the order will be grouped in respective SaleOrders\neach SaleOrder represents a division of LineItems which will be sent to the ERP.\nThis is currently being set to split the LineItems based on its vendor, grouping all the products associated of one vendor into a SaleOrder"]}),"\n",(0,i.jsx)(t.p,{children:"Then, for every created SaleOrder, a background job will be scheduled to run the sending of that order.\nThe job SendSaleOrderToErp its, used. Under its hood it calls the respective API endpoint for injecting the SaleOrder information (/interoperabilidad/tienda/api/v1/pedido), and a service dedicated to storing the success/failure information into the SaleOrder model."}),"\n",(0,i.jsx)(t.h3,{id:"saleorders-statuses",children:"SaleOrders statuses"}),"\n",(0,i.jsx)(t.p,{children:"Each SaleOrder model will have an associated status, that will indicate its status withing the ERP:"}),"\n",(0,i.jsxs)(t.ul,{children:["\n",(0,i.jsxs)(t.li,{children:["\n",(0,i.jsxs)(t.p,{children:[(0,i.jsx)(t.code,{children:"initial"}),"\nBase status that is set when the SaleOrder is recently created"]}),"\n"]}),"\n",(0,i.jsxs)(t.li,{children:["\n",(0,i.jsxs)(t.p,{children:[(0,i.jsx)(t.code,{children:"sent"}),"\nSaleOrder has been sent to the ERP successfully"]}),"\n"]}),"\n",(0,i.jsxs)(t.li,{children:["\n",(0,i.jsxs)(t.p,{children:[(0,i.jsx)(t.code,{children:"failed"}),"\nThere was an attempt to send the SaleOrder to the ERP, but the response wasnt successful."]}),"\n"]}),"\n",(0,i.jsxs)(t.li,{children:["\n",(0,i.jsxs)(t.p,{children:[(0,i.jsx)(t.code,{children:"nullified"}),"\nSaleOrder has been nullified in the ERP successfully"]}),"\n"]}),"\n",(0,i.jsxs)(t.li,{children:["\n",(0,i.jsxs)(t.p,{children:[(0,i.jsx)(t.code,{children:"cancellation_pending"}),"\nSaleOrder has been requested to be nullified, and has a nullified job in progress"]}),"\n"]}),"\n"]}),"\n",(0,i.jsx)(t.h3,{id:"see-information-about-saleorders",children:"See information about SaleOrders"}),"\n",(0,i.jsx)(t.p,{children:"In the admin panel, admin users can see information about the stablished SaleOrders, and its respective statuses."}),"\n",(0,i.jsx)(t.p,{children:'When viewing a respective Spree::Order, go to the "ERP Pedidos de Venta" tab.'}),"\n",(0,i.jsx)(t.p,{children:(0,i.jsx)(t.img,{alt:"pipeline",src:n(2810).Z+"",width:"1305",height:"772"})}),"\n",(0,i.jsx)(t.p,{children:"From there, admins can see the status of sale orders, its saved information from the erp, and which line items are contained by each SaleOrder."}),"\n",(0,i.jsx)(t.h3,{id:"cancellationnullification-of-a-saleorder",children:"Cancellation/Nullification of a SaleOrder"}),"\n",(0,i.jsx)(t.p,{children:'SaleOrders that are in status "sent", and be nullified by using the "Cancelar pedido de venta" option.'}),"\n",(0,i.jsx)(t.p,{children:"This will trigger a cancelation background job, similar to the one used in the creation/injection of the sale order in the ERP."})]})}function h(e={}){const{wrapper:t}={...(0,s.a)(),...e.components};return t?(0,i.jsx)(t,{...e,children:(0,i.jsx)(c,{...e})}):c(e)}},2810:(e,t,n)=>{n.d(t,{Z:()=>i});const i=n.p+"assets/images/view-sale-orders-9104201c85dc651b919a56c7b7758e91.gif"},1151:(e,t,n)=>{n.d(t,{Z:()=>o,a:()=>a});var i=n(7294);const s={},r=i.createContext(s);function a(e){const t=i.useContext(r);return i.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function o(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:a(e.components),i.createElement(r.Provider,{value:t},e.children)}}}]);