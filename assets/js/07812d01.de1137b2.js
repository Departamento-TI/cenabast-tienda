"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[5388],{3501:(e,n,s)=>{s.r(n),s.d(n,{assets:()=>d,contentTitle:()=>i,default:()=>p,frontMatter:()=>t,metadata:()=>c,toc:()=>a});var r=s(5893),o=s(1151);const t={},i="Dev Server",c={id:"infrastructure/dev-server",title:"Dev Server",description:"Resume",source:"@site/docs/infrastructure/dev-server.md",sourceDirName:"infrastructure",slug:"/infrastructure/dev-server",permalink:"/cenabast-tienda/docs/infrastructure/dev-server",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/infrastructure/dev-server.md",tags:[],version:"current",frontMatter:{},sidebar:"tutorialSidebar",previous:{title:"Design",permalink:"/cenabast-tienda/docs/infrastructure/design"},next:{title:"Domains",permalink:"/cenabast-tienda/docs/infrastructure/domains"}},d={},a=[{value:"Resume",id:"resume",level:2},{value:"SSH",id:"ssh",level:2},{value:"VPN",id:"vpn",level:2},{value:"Docker",id:"docker",level:2},{value:"Useful commands",id:"useful-commands",level:3},{value:"Docker Compose",id:"docker-compose",level:3}];function l(e){const n={a:"a",admonition:"admonition",br:"br",code:"code",h1:"h1",h2:"h2",h3:"h3",img:"img",p:"p",pre:"pre",strong:"strong",...(0,o.a)(),...e.components},{Details:t}=n;return t||function(e,n){throw new Error("Expected "+(n?"component":"object")+" `"+e+"` to be defined: you likely forgot to import, pass, or provide it.")}("Details",!0),(0,r.jsxs)(r.Fragment,{children:[(0,r.jsx)(n.h1,{id:"dev-server",children:"Dev Server"}),"\n",(0,r.jsx)(n.h2,{id:"resume",children:"Resume"}),"\n",(0,r.jsx)(n.admonition,{title:"IP",type:"tip",children:(0,r.jsxs)(n.p,{children:["The current Dev Server is a Ubuntu Server.",(0,r.jsx)(n.br,{}),"\n","External IP is ",(0,r.jsx)(n.code,{children:"190.215.197.206"})]})}),"\n",(0,r.jsx)(n.admonition,{type:"warning",children:(0,r.jsxs)(n.p,{children:["The opened port are ",(0,r.jsx)(n.code,{children:"80"})," and ",(0,r.jsx)(n.code,{children:"443"}),"."]})}),"\n",(0,r.jsx)(n.h2,{id:"ssh",children:"SSH"}),"\n",(0,r.jsx)(n.admonition,{title:"VPN dependency",type:"warning",children:(0,r.jsxs)(n.p,{children:["SSH access ",(0,r.jsx)(n.strong,{children:"requires"})," VPN access."]})}),"\n",(0,r.jsxs)(n.p,{children:["SSH Port: ",(0,r.jsx)(n.code,{children:"22"}),(0,r.jsx)(n.br,{}),"\n","Internal IP Address: ",(0,r.jsx)(n.code,{children:"10.8.0.44"})]}),"\n",(0,r.jsx)(n.h2,{id:"vpn",children:"VPN"}),"\n",(0,r.jsx)(n.admonition,{title:"VPN requirement",type:"info",children:(0,r.jsx)(n.p,{children:"Please request a VPN access to Cenabast project manager."})}),"\n",(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-jsx",children:'sudo openfortivpn 190.215.197.202:10443 -u "username" -p "XXXXXXX"\n'})}),"\n",(0,r.jsx)(n.h2,{id:"docker",children:"Docker"}),"\n",(0,r.jsx)(n.admonition,{type:"info",children:(0,r.jsxs)(n.p,{children:["Container path is at ",(0,r.jsx)(n.code,{children:"/root/containers/cenabast.gob.cl"})]})}),"\n",(0,r.jsx)(n.h3,{id:"useful-commands",children:"Useful commands"}),"\n",(0,r.jsx)(n.admonition,{type:"tip",children:(0,r.jsxs)(n.p,{children:["Stop containers: ",(0,r.jsx)(n.code,{children:"docker compose down"}),(0,r.jsx)(n.br,{}),"\n","Start containers: ",(0,r.jsx)(n.code,{children:"docker compose up -d"}),(0,r.jsx)(n.br,{}),"\n","Check Logs containers: ",(0,r.jsx)(n.code,{children:"docker compose logs -f"}),(0,r.jsx)(n.br,{}),"\n","Log into container: ",(0,r.jsx)(n.code,{children:"docker exec -it -u root e1cc /bin/bash"})," where 'e1cc' is the container ID."]})}),"\n",(0,r.jsx)(n.p,{children:"Running containers:"}),"\n",(0,r.jsx)(n.p,{children:(0,r.jsx)(n.img,{alt:"runningcontainers",src:s(6642).Z+"",width:"1283",height:"253"})}),"\n",(0,r.jsx)(n.h3,{id:"docker-compose",children:"Docker Compose"}),"\n",(0,r.jsx)(n.admonition,{type:"danger",children:(0,r.jsxs)(n.p,{children:["The following docker-compose.yml file might be outdated. The ",(0,r.jsx)(n.a,{href:"https://github.com/Departamento-TI/cenabast-tienda/blob/develop/docker-compose.yml",children:"actual file"})," is at the repo in the ",(0,r.jsx)(n.code,{children:"develop"})," branch."]})}),"\n",(0,r.jsxs)(t,{children:[(0,r.jsx)("summary",{children:"docker-compose.yml"}),(0,r.jsx)("div",{children:(0,r.jsx)("div",{children:(0,r.jsx)(n.pre,{children:(0,r.jsx)(n.code,{className:"language-jsx",children:'version: \'3.7\'\nservices:\n\npostgres:\nimage: postgres:13-alpine\nenvironment:\n  POSTGRES_HOST_AUTH_METHOD: trust\nports:\n  - "5432:5432"\nvolumes:\n  - \'postgres:/var/lib/postgresql/data\'\n\nredis:\nimage: redis:6.2-alpine\nports:\n  - "6379:6379"\nvolumes:\n  - \'redis:/data\'\n\nweb:\ndepends_on:\n  - \'postgres\'\n  - \'redis\'\nbuild:\n  context: .\n  dockerfile: Dockerfile.development\ncommand: bash -c "rm -rf tmp/pids/server.pid && yarn install && yarn build && bundle exec rails s -b 0.0.0.0 -p 4000"\nports:\n  - \'${DOCKER_HOST_WEB_PORT:-4000}:4000\'\nvolumes:\n  - \'bundle_cache:/bundle\'\n  - \'.:/app\'\n  - .env:/app/.env\nenvironment:\n  REDIS_URL: redis://redis:6379/0\n  DB_HOST: postgres\n  DB_PORT: 5432\n  DISABLE_SPRING: 1\n\nworker:\ndepends_on:\n  - \'postgres\'\n  - \'redis\'\nbuild:\n  context: .\n  dockerfile: Dockerfile.development\ncommand: bundle exec sidekiq -C config/sidekiq.yml\nvolumes:\n  - \'bundle_cache:/bundle\'\n  - \'.:/app\'\n  - .env:/app/.env\nenvironment:\n  REDIS_URL: redis://redis:6379/0\n  DB_HOST: postgres\n  DB_PORT: 5432\n  DISABLE_SPRING: 1\n\nkeycloak:\nbuild:\n  context: .\n  dockerfile: Dockerfile.keycloak\nimage: keycloak:custom\nenvironment:\n  KEYCLOAK_DECLARATIVE_USER_PROFILE: true\n  KEYCLOAK_DATABASE_HOST: postgres\n  KEYCLOAK_DATABASE_NAME: keycloak\n  KEYCLOAK_DATABASE_USER: keycloak\n  KEYCLOAK_DATABASE_PASSWORD: u_J91CEema4S\n  KEYCLOAK_ADMIN: admin\n  KEYCLOAK_ADMIN_PASSWORD: owwIZLI#6m65\n  KEYCLOAK_HOSTNAME_ADMIN_URL: https://login-dev.cenabast.gob.cl/\n  KEYCLOAK_HOSTNAME_URL: https://login-dev.cenabast.gob.cl/\n  KEYCLOAK_PROXY: edge\n  KEYCLOAK_HOSTNAME_STRICT: false\nports:\n  - "8080:8080"\n  - "8443:8443"\n  - "9990:9990"\ncommand: ["start", "--https-key-store-file=/opt/keycloak/conf/server.keystore", "--https-key-store-password=pa55w0rd", "--optimized", "--db-url=jdbc:postgresql://postgres/keycloak", "--db-username=keycloak", "--db-password=u_J91CEema4S", "--proxy=edge", "--hostname-strict=false", "--hostname=login-dev.cenabast.gob.cl"]\n\nvolumes:\nredis:\npostgres:\nbundle_cache:    \n'})})})})]})]})}function p(e={}){const{wrapper:n}={...(0,o.a)(),...e.components};return n?(0,r.jsx)(n,{...e,children:(0,r.jsx)(l,{...e})}):l(e)}},6642:(e,n,s)=>{s.d(n,{Z:()=>r});const r=s.p+"assets/images/2023-12-20_13-09-98366233fd3b9eb3a8e164e9ac4db84c.png"},1151:(e,n,s)=>{s.d(n,{Z:()=>c,a:()=>i});var r=s(7294);const o={},t=r.createContext(o);function i(e){const n=r.useContext(t);return r.useMemo((function(){return"function"==typeof e?e(n):{...n,...e}}),[n,e])}function c(e){let n;return n=e.disableParentContext?"function"==typeof e.components?e.components(o):e.components||o:i(e.components),r.createElement(t.Provider,{value:n},e.children)}}}]);