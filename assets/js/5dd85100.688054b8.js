"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[7413],{5495:(e,n,r)=>{r.r(n),r.d(n,{assets:()=>c,contentTitle:()=>i,default:()=>l,frontMatter:()=>o,metadata:()=>a,toc:()=>u});var t=r(5893),s=r(1151);const o={},i="Troubleshooting",a={id:"infrastructure/troubleshooting",title:"Troubleshooting",description:"Create Admin user",source:"@site/docs/infrastructure/troubleshooting.md",sourceDirName:"infrastructure",slug:"/infrastructure/troubleshooting",permalink:"/cenabast-tienda/docs/infrastructure/troubleshooting",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/main/docs/docs/infrastructure/troubleshooting.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Domains",permalink:"/cenabast-tienda/docs/infrastructure/domains"}},c={},u=[{value:"Create Admin user",id:"create-admin-user",level:2}];function d(e){const n={admonition:"admonition",code:"code",h1:"h1",h2:"h2",p:"p",pre:"pre",strong:"strong",...(0,s.a)(),...e.components};return(0,t.jsxs)(t.Fragment,{children:[(0,t.jsx)(n.h1,{id:"troubleshooting",children:"Troubleshooting"}),"\n",(0,t.jsx)(n.h2,{id:"create-admin-user",children:"Create Admin user"}),"\n",(0,t.jsx)(n.admonition,{type:"info",children:(0,t.jsxs)(n.p,{children:["Assign the ",(0,t.jsx)(n.strong,{children:"admin"})," role to a user using the user RUT value"]})}),"\n",(0,t.jsx)(n.p,{children:"Log into the rails console:"}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-jsx",children:"docker compose run web rails c\n"})}),"\n",(0,t.jsxs)(n.p,{children:["Search for the user. If RUT is 44.444.444-4, use ",(0,t.jsx)(n.code,{children:"444444444"}),":"]}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-jsx",children:"u = Spree::User.find_by(run: '444444444')\n"})}),"\n",(0,t.jsxs)(n.p,{children:["The search for the ",(0,t.jsx)(n.strong,{children:"admin"})," role and assign the role to the user:"]}),"\n",(0,t.jsx)(n.pre,{children:(0,t.jsx)(n.code,{className:"language-jsx",children:"role = Spree::Role.find_by(name: 'admin')\nu.spree_roles << role\nu.save\n"})})]})}function l(e={}){const{wrapper:n}={...(0,s.a)(),...e.components};return n?(0,t.jsx)(n,{...e,children:(0,t.jsx)(d,{...e})}):d(e)}},1151:(e,n,r)=>{r.d(n,{Z:()=>a,a:()=>i});var t=r(7294);const s={},o=t.createContext(s);function i(e){const n=t.useContext(o);return t.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function a(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:i(e.components),t.createElement(o.Provider,{value:n},e.children)}}}]);