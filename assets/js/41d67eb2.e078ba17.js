"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[5120],{2393:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>a,contentTitle:()=>c,default:()=>d,frontMatter:()=>i,metadata:()=>s,toc:()=>l});var r=n(5893),o=n(1151);const i={},c="Applications",s={id:"infrastructure/applications/applications",title:"Applications",description:"We need to deploy the following applications in the DEV server:",source:"@site/docs/infrastructure/applications/applications.md",sourceDirName:"infrastructure/applications",slug:"/infrastructure/applications/",permalink:"/docs/infrastructure/applications/",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/infrastructure/applications/applications.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Infrastructure",permalink:"/docs/infrastructure/"},next:{title:"Keycloak",permalink:"/docs/infrastructure/applications/keycloak"}},a={},l=[{value:"Docker PostgreSQL",id:"docker-postgresql",level:2},{value:"Docker Keycloak",id:"docker-keycloak",level:2},{value:"Docker Spree Commerce",id:"docker-spree-commerce",level:2}];function p(e){const t={a:"a",admonition:"admonition",br:"br",code:"code",h1:"h1",h2:"h2",li:"li",p:"p",ul:"ul",...(0,o.a)(),...e.components};return(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(t.h1,{id:"applications",children:"Applications"}),"\n",(0,r.jsx)(t.p,{children:"We need to deploy the following applications in the DEV server:"}),"\n",(0,r.jsxs)(t.ul,{children:["\n",(0,r.jsx)(t.li,{children:"PostgreSQL"}),"\n",(0,r.jsx)(t.li,{children:"Keycloak"}),"\n",(0,r.jsx)(t.li,{children:"Spree Commerce"}),"\n"]}),"\n",(0,r.jsx)(t.admonition,{type:"info",children:(0,r.jsx)(t.p,{children:"All applications must be deployed using Docker container.\nIdeally, we need to build the image locally."})}),"\n",(0,r.jsx)(t.h1,{id:"docker",children:"Docker"}),"\n",(0,r.jsx)(t.admonition,{type:"tip",children:(0,r.jsxs)(t.p,{children:["Al applications must be deploy as docker images using the followng ",(0,r.jsx)(t.a,{href:"https://github.com/Departamento-TI/cenabast-tienda/blob/spree-4-7-development-with-frontend/docker-compose.yml",children:"Docker-Compose file"})]})}),"\n",(0,r.jsx)(t.h2,{id:"docker-postgresql",children:"Docker PostgreSQL"}),"\n",(0,r.jsx)(t.admonition,{title:"Database",type:"tip",children:(0,r.jsx)(t.p,{children:"Both Keycloak and Spree Commerce should use the same postgres service."})}),"\n",(0,r.jsx)(t.p,{children:"Docker Repo:"}),"\n",(0,r.jsx)(t.p,{children:(0,r.jsx)(t.a,{href:"https://github.com/docker-library/postgres",children:"https://github.com/docker-library/postgres"})}),"\n",(0,r.jsx)(t.h2,{id:"docker-keycloak",children:"Docker Keycloak"}),"\n",(0,r.jsx)(t.p,{children:"Docker info:"}),"\n",(0,r.jsx)(t.p,{children:(0,r.jsx)(t.a,{href:"https://www.keycloak.org/server/containers",children:"https://www.keycloak.org/server/containers"})}),"\n",(0,r.jsx)(t.h2,{id:"docker-spree-commerce",children:"Docker Spree Commerce"}),"\n",(0,r.jsx)(t.admonition,{type:"info",children:(0,r.jsxs)(t.p,{children:["This is our custom Spree Project. ",(0,r.jsx)(t.br,{}),"\n","Please deploy branch ",(0,r.jsx)(t.code,{children:"spree-4-7-development-with-frontend"})]})}),"\n",(0,r.jsx)(t.p,{children:(0,r.jsx)(t.a,{href:"https://github.com/Departamento-TI/cenabast-tienda/",children:"https://github.com/Departamento-TI/cenabast-tienda/"})})]})}function d(e={}){const{wrapper:t}={...(0,o.a)(),...e.components};return t?(0,r.jsx)(t,{...e,children:(0,r.jsx)(p,{...e})}):p(e)}},1151:(e,t,n)=>{n.d(t,{Z:()=>s,a:()=>c});var r=n(7294);const o={},i=r.createContext(o);function c(e){const t=r.useContext(i);return r.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function s(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(o):e.components||o:c(e.components),r.createElement(i.Provider,{value:t},e.children)}}}]);