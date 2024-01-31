"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[2490],{2100:(e,i,t)=>{t.r(i),t.d(i,{assets:()=>o,contentTitle:()=>r,default:()=>h,frontMatter:()=>a,metadata:()=>c,toc:()=>l});var n=t(5893),s=t(1151);const a={},r="Keycloak",c={id:"infrastructure/applications/keycloak",title:"Keycloak",description:"Resume",source:"@site/docs/infrastructure/applications/keycloak.md",sourceDirName:"infrastructure/applications",slug:"/infrastructure/applications/keycloak",permalink:"/cenabast-tienda/docs/infrastructure/applications/keycloak",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/infrastructure/applications/keycloak.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Data Pipeline",permalink:"/cenabast-tienda/docs/infrastructure/applications/data_pipeline"},next:{title:"PostgreSQL",permalink:"/cenabast-tienda/docs/infrastructure/applications/postgresql"}},o={},l=[{value:"Resume",id:"resume",level:3},{value:"Create Cenabast Realm",id:"create-cenabast-realm",level:3},{value:"Create Clave Unica IdP",id:"create-clave-unica-idp",level:3},{value:"Redirect directly to IdP",id:"redirect-directly-to-idp",level:3},{value:"Disable Review Profile",id:"disable-review-profile",level:3},{value:"Disable Profile form",id:"disable-profile-form",level:3},{value:"Test Login",id:"test-login",level:3}];function d(e){const i={a:"a",admonition:"admonition",br:"br",code:"code",h1:"h1",h3:"h3",img:"img",p:"p",strong:"strong",...(0,s.a)(),...e.components};return(0,n.jsxs)(n.Fragment,{children:[(0,n.jsx)(i.h1,{id:"keycloak",children:"Keycloak"}),"\n",(0,n.jsx)(i.h3,{id:"resume",children:"Resume"}),"\n",(0,n.jsxs)(i.admonition,{type:"tip",children:[(0,n.jsx)(i.p,{children:"Single Sign On"}),(0,n.jsxs)(i.p,{children:["URL: ",(0,n.jsx)(i.a,{href:"https://login-dev.cenabast.gob.cl/admin/",children:"https://login-dev.cenabast.gob.cl/admin/"})," ",(0,n.jsx)(i.br,{}),"\n","KEYCLOAK_USER: ",(0,n.jsx)(i.code,{children:"admin"}),(0,n.jsx)(i.br,{}),"\n","KEYCLOAK_PASSWORD: ",(0,n.jsx)(i.code,{children:"owwIZLI#6m65"})]})]}),"\n",(0,n.jsx)(i.h1,{id:"keycloak-setup",children:"Keycloak Setup"}),"\n",(0,n.jsx)(i.admonition,{title:"Setup",type:"info",children:(0,n.jsxs)(i.p,{children:["After Keycloak docker is deployed, the following configurations needs to be done in order to integrate with ",(0,n.jsx)(i.a,{href:"/cenabast-tienda/docs/infrastructure/clave_unica",children:"Clave Unica"}),"."]})}),"\n",(0,n.jsx)(i.h3,{id:"create-cenabast-realm",children:"Create Cenabast Realm"}),"\n",(0,n.jsx)(i.p,{children:(0,n.jsx)(i.img,{alt:"createrealm",src:t(9134).Z+"",width:"1153",height:"876"})}),"\n",(0,n.jsx)(i.h3,{id:"create-clave-unica-idp",children:"Create Clave Unica IdP"}),"\n",(0,n.jsx)(i.admonition,{type:"tip",children:(0,n.jsxs)(i.p,{children:[(0,n.jsx)(i.strong,{children:"Clave Unica Discovery Endpoint"}),":",(0,n.jsx)(i.br,{}),"\n",(0,n.jsx)(i.a,{href:"https://accounts.claveunica.gob.cl/openid/.well-known/openid-configuration",children:"https://accounts.claveunica.gob.cl/openid/.well-known/openid-configuration"})]})}),"\n",(0,n.jsx)(i.p,{children:(0,n.jsx)(i.img,{alt:"Add-ClaveUnica_idp",src:t(656).Z+"",width:"1153",height:"876"})}),"\n",(0,n.jsx)(i.h3,{id:"redirect-directly-to-idp",children:"Redirect directly to IdP"}),"\n",(0,n.jsx)(i.admonition,{type:"warning",children:(0,n.jsxs)(i.p,{children:["In order to skip Keycloak Login form, we can ",(0,n.jsx)(i.strong,{children:"redirect"})," inmediatly to the ClaveUnica Identity Provider.",(0,n.jsx)(i.br,{}),"\n",'In the browser authentication flow, just configure the alias of your idp (in this case, "',(0,n.jsx)(i.strong,{children:"oidc"}),'" is the alias)']})}),"\n",(0,n.jsx)(i.p,{children:(0,n.jsx)(i.img,{alt:"Redirect-to-idp",src:t(843).Z+"",width:"1153",height:"876"})}),"\n",(0,n.jsx)(i.h3,{id:"disable-review-profile",children:"Disable Review Profile"}),"\n",(0,n.jsx)(i.admonition,{type:"info",children:(0,n.jsx)(i.p,{children:'Disable the "Review Profile" action from the "first broker login" flow.'})}),"\n",(0,n.jsx)(i.p,{children:(0,n.jsx)(i.img,{alt:"DisableReviewProfile",src:t(4101).Z+"",width:"1153",height:"877"})}),"\n",(0,n.jsx)(i.h3,{id:"disable-profile-form",children:"Disable Profile form"}),"\n",(0,n.jsx)(i.admonition,{type:"warning",children:(0,n.jsxs)(i.p,{children:['In order to prevent Keycloak from requesting filling the profile form, we need to disable the "',(0,n.jsx)(i.strong,{children:"Update Profile"}),'" required action.']})}),"\n",(0,n.jsx)(i.p,{children:(0,n.jsx)(i.img,{alt:"Disable-profile-form",src:t(5432).Z+"",width:"1153",height:"876"})}),"\n",(0,n.jsx)(i.h3,{id:"test-login",children:"Test Login"}),"\n",(0,n.jsxs)(i.admonition,{title:"Testing RUT values",type:"tip",children:[(0,n.jsx)(i.p,{children:"Clave Unica test users:"}),(0,n.jsxs)(i.p,{children:["RUN: 44.444.444-4 \tcontrase\xf1a: ",(0,n.jsx)(i.strong,{children:"testing"}),(0,n.jsx)(i.br,{}),"\n","RUN: 55.555.555-5\tcontrase\xf1a: ",(0,n.jsx)(i.strong,{children:"testing"}),(0,n.jsx)(i.br,{}),"\n","RUN: 88.888.888-8 \tcontrase\xf1a: ",(0,n.jsx)(i.strong,{children:"testing"}),(0,n.jsx)(i.br,{}),"\n","RUN: 99.999.999-9 \tcontrase\xf1a: ",(0,n.jsx)(i.strong,{children:"testing"})]}),(0,n.jsx)(i.admonition,{title:"Login URL test",type:"info",children:(0,n.jsx)(i.p,{children:(0,n.jsx)(i.a,{href:"https://login-dev.cenabast.gob.cl/realms/cenabast/account/#/",children:"https://login-dev.cenabast.gob.cl/realms/cenabast/account/#/"})})})]}),"\n",(0,n.jsx)(i.p,{children:(0,n.jsx)(i.img,{alt:"testing",src:t(3807).Z+"",width:"1153",height:"877"})})]})}function h(e={}){const{wrapper:i}={...(0,s.a)(),...e.components};return i?(0,n.jsx)(i,{...e,children:(0,n.jsx)(d,{...e})}):d(e)}},9134:(e,i,t)=>{t.d(i,{Z:()=>n});const n=t.p+"assets/images/Peek2023-12-19-17-10-5f77e80c5d8945c2ccb7577a2851003e.gif"},656:(e,i,t)=>{t.d(i,{Z:()=>n});const n=t.p+"assets/images/Peek2023-12-19-17-16-ec5f98c84e58d8a1599982437219d54a.gif"},843:(e,i,t)=>{t.d(i,{Z:()=>n});const n=t.p+"assets/images/Peek2023-12-19-17-18-27ee7ad0206ccdbab62a08b4d774c938.gif"},5432:(e,i,t)=>{t.d(i,{Z:()=>n});const n=t.p+"assets/images/Peek2023-12-19-17-19-2f40484406d76ff15ae61d098c674bc0.gif"},3807:(e,i,t)=>{t.d(i,{Z:()=>n});const n=t.p+"assets/images/Peek2023-12-19-18-00-613b4d54d2ac1c2753effdfcd8bc7ec4.gif"},4101:(e,i,t)=>{t.d(i,{Z:()=>n});const n=t.p+"assets/images/Peek2023-12-19-18-01-ba2ea86651216a74d9ee3709f3e0d33b.gif"},1151:(e,i,t)=>{t.d(i,{Z:()=>c,a:()=>r});var n=t(7294);const s={},a=n.createContext(s);function r(e){const i=n.useContext(a);return n.useMemo((function(){return"function"==typeof e?e(i):{...i,...e}}),[i,e])}function c(e){let i;return i=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:r(e.components),n.createElement(a.Provider,{value:i},e.children)}}}]);