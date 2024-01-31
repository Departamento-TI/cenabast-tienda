"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[9064],{367:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>d,contentTitle:()=>c,default:()=>u,frontMatter:()=>o,metadata:()=>s,toc:()=>a});var i=t(5893),r=t(1151);const o={},c="Domains",s={id:"infrastructure/domains",title:"Domains",description:"Development",source:"@site/docs/infrastructure/domains.md",sourceDirName:"infrastructure",slug:"/infrastructure/domains",permalink:"/cenabast-tienda/docs/infrastructure/domains",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/infrastructure/domains.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Dev Server",permalink:"/cenabast-tienda/docs/infrastructure/dev-server"}},d={},a=[{value:"Development",id:"development",level:2},{value:"Production",id:"production",level:2},{value:"Letsencrypt",id:"letsencrypt",level:2},{value:"Redirection",id:"redirection",level:2}];function l(e){const n={a:"a",admonition:"admonition",br:"br",code:"code",h1:"h1",h2:"h2",li:"li",p:"p",ul:"ul",...(0,r.a)(),...e.components};return(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)(n.h1,{id:"domains",children:"Domains"}),"\n",(0,i.jsx)(n.h2,{id:"development",children:"Development"}),"\n",(0,i.jsxs)(n.ul,{children:["\n",(0,i.jsx)(n.li,{children:(0,i.jsx)(n.code,{children:"login-dev.cenabast.gob.cl"})}),"\n",(0,i.jsx)(n.li,{children:(0,i.jsx)(n.code,{children:"tienda-dev.cenabast.gob.cl"})}),"\n"]}),"\n",(0,i.jsx)(n.h2,{id:"production",children:"Production"}),"\n",(0,i.jsx)(n.admonition,{title:"Pending",type:"warning",children:(0,i.jsx)(n.p,{children:"Production website is not currently active."})}),"\n",(0,i.jsxs)(n.ul,{children:["\n",(0,i.jsx)(n.li,{children:(0,i.jsx)(n.code,{children:"login.cenabast.gob.cl"})}),"\n",(0,i.jsx)(n.li,{children:(0,i.jsx)(n.code,{children:"tienda.cenabast.gob.cl"})}),"\n"]}),"\n",(0,i.jsx)(n.h2,{id:"letsencrypt",children:"Letsencrypt"}),"\n",(0,i.jsx)(n.admonition,{type:"tip",children:(0,i.jsxs)(n.p,{children:["As we are using port ",(0,i.jsx)(n.code,{children:"443"})," we need to implement an SSL certificate for each domain."]})}),"\n",(0,i.jsx)(n.h2,{id:"redirection",children:"Redirection"}),"\n",(0,i.jsx)(n.admonition,{type:"info",children:(0,i.jsxs)(n.p,{children:["Traffic to domain ",(0,i.jsx)(n.code,{children:"login-dev.cenabast.gob.cl"})," must be forwarded to the ",(0,i.jsx)(n.a,{href:"./applications/keycloak",children:"Keycloak docker"})," application.",(0,i.jsx)(n.br,{}),"\n","Traffic to domain ",(0,i.jsx)(n.code,{children:"tienda-dev.cenabast.gob.cl"})," must be forwarded to the ",(0,i.jsx)(n.a,{href:"./applications/spree",children:"Spree Commerce"})," docker application."]})})]})}function u(e={}){const{wrapper:n}={...(0,r.a)(),...e.components};return n?(0,i.jsx)(n,{...e,children:(0,i.jsx)(l,{...e})}):l(e)}},1151:(e,n,t)=>{t.d(n,{Z:()=>s,a:()=>c});var i=t(7294);const r={},o=i.createContext(r);function c(e){const n=i.useContext(o);return i.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function s(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(r):e.components||r:c(e.components),i.createElement(o.Provider,{value:n},e.children)}}}]);