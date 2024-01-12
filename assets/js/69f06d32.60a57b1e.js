"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[1658],{9836:(n,e,a)=>{a.r(e),a.d(e,{assets:()=>r,contentTitle:()=>c,default:()=>l,frontMatter:()=>t,metadata:()=>s,toc:()=>d});var o=a(5893),i=a(1151);const t={title:"Vendors",published:!0,date:new Date("2023-11-08T14:59:12.977Z"),editor:"markdown",dateCreated:new Date("2023-11-08T14:59:12.977Z")},c="Header",s={id:"api-rest-services/seller-public-distribution",title:"Vendors",description:"Your content here",source:"@site/docs/api-rest-services/seller-public-distribution.md",sourceDirName:"api-rest-services",slug:"/api-rest-services/seller-public-distribution",permalink:"/cenabast-tienda/docs/api-rest-services/seller-public-distribution",draft:!1,unlisted:!1,editUrl:"https://github.com/Departamento-TI/cenabast-tienda/edit/master/docs/docs/api-rest-services/seller-public-distribution.md",tags:[],version:"current",frontMatter:{title:"Vendors",published:!0,date:"2023-11-08T14:59:12.977Z",editor:"markdown",dateCreated:"2023-11-08T14:59:12.977Z"},sidebar:"tutorialSidebar",previous:{title:"Purchase Order",permalink:"/cenabast-tienda/docs/api-rest-services/purchase-order"},next:{title:"SIGFE",permalink:"/cenabast-tienda/docs/api-rest-services/sigfe/"}},r={},d=[{value:"Request",id:"request",level:2},{value:"Response",id:"response",level:2}];function u(n){const e={code:"code",h1:"h1",h2:"h2",p:"p",pre:"pre",...(0,i.a)(),...n.components};return(0,o.jsxs)(o.Fragment,{children:[(0,o.jsx)(e.h1,{id:"header",children:"Header"}),"\n",(0,o.jsx)(e.p,{children:"Your content here"}),"\n",(0,o.jsx)(e.h2,{id:"request",children:"Request"}),"\n",(0,o.jsxs)(e.p,{children:["GET  ",(0,o.jsx)(e.code,{children:"https://<<HOST>>/WebApi2/api/v2/Public/distribucion"})]}),"\n",(0,o.jsx)(e.h2,{id:"response",children:"Response"}),"\n",(0,o.jsx)(e.pre,{children:(0,o.jsx)(e.code,{className:"language-ruby",children:"| IdDistribucion | Rut_Proveedor | Doc_Cenabast | Factura | Fecha_Fac          | Guia  | Fecha_Gui         | O_Trans | Detalles__Doc_Cenabast | Detalles__Articulo | Detalles__Lote | Detalles__Cantidad | Detalles__FechaCreacion | Detalles__FechaActualizacion | Movimientos__Doc_Cenabast | Movimientos__Fecha | Movimientos__Hora | Movimientos__DescMovimiento | Movimientos__RecibidoPor |\n|----------------|---------------|--------------|---------|--------------------|-------|-------------------|---------|------------------------|--------------------|----------------|--------------------|-------------------------|------------------------------|---------------------------|--------------------|-------------------|-----------------------------|--------------------------|\n| 5226545        | 1             | 303000106    | 555     | 1/9/2020 0:00:00   | 1     | 1/1/1900 0:00:00  | 295765  | 303000106              | 113184             | 906838         | 110                | 25-10-2023 10:17:25     | 25-10-2023 10:17:25          | 303000106                 | 2/9/2020 0:00:00   | 10:43:16          | 2                           |                          |\n|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 303000106                 | 30-05-2021 0:00:00 | 10:15:00          | 1                           | RECEPCION CONFORME       |\n| 5163243        | 1             | 300613136    | 15342   | 1/11/2023 0:00:00  | 0     |                   |         | 300613136              | 50000001           | 906838         | 10                 | 16-10-2023 14:03:29     | 16-10-2023 14:03:29          | 300613136                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |\n| 5162912        | 1             | 300613106    | 15342   | 1/11/2023 0:00:00  | 12345 | 1/11/2023 0:00:00 | S/N     | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:41:47     | 16-10-2023 12:41:47          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |\n|                |               |              |         |                    |       |                   |         | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:43:22     | 16-10-2023 12:43:22          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |\n|                |               |              |         |                    |       |                   |         | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:43:55     | 16-10-2023 12:43:55          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |\n|                |               |              |         |                    |       |                   |         | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:44:35     | 16-10-2023 12:44:35          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |\n|                |               |              |         |                    |       |                   |         | 300613106              | 50000001           | 906838         | 10                 | 16-10-2023 12:45:57     | 16-10-2023 12:45:57          | 300613106                 | 2/11/2023 0:00:00  | 10:00:00          | 2                           |                          |\n| 114036         | 1             | 300000111    | 999999  | 13-05-2021 0:00:00 | 0     |                   |         | 300000111              | 12345678           | B1142B22U1     | 2                  | 17-08-2022 8:44:44      | 17-08-2022 8:44:44           | 300000111                 | 30-05-2021 0:00:00 | 15:17:00          | 2                           | DESPACHADO - 9999999999  |\n| 114035         | 1             | 300000106    | 279853  | 1/9/2020 0:00:00   | 0     | 1/1/1900 0:00:00  | 295765  | 300000106              | 113184             | 906838         | 110                | 4/8/2022 12:51:03       | 4/8/2022 12:51:03            | 300000106                 | 2/9/2020 0:00:00   | 10:43:16          | 2                           |                          |\n|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 2/9/2020 0:00:00   | 10:43:16          | 1                           |                          |\n|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 2/9/2020 0:00:00   | 10:43:16          | 1                           |                          |\n|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 2/9/2020 0:00:00   | 10:43:16          | 1                           |                          |\n|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 5/8/2022 0:00:00   | 9:00:00           | 1                           | JUAN PEREZ               |\n|                |               |              |         |                    |       |                   |         |                        |                    |                |                    |                         |                              | 300000106                 | 30-05-2021 0:00:00 | 10:15:00          | 2                           | DESPACHADO - 9999999999  |\n"})}),"\n",(0,o.jsx)(e.p,{children:"JSON"}),"\n",(0,o.jsx)(e.pre,{children:(0,o.jsx)(e.code,{className:"language-jsx",children:'[\n  {\n    "IdDistribucion": 5226545,\n    "Rut_Proveedor": "1",\n    "Doc_Cenabast": 303000106,\n    "Factura": 555,\n    "Fecha_Fac": "01-09-2020 0:00:00",\n    "Guia": 1,\n    "Fecha_Gui": "01-01-1900 0:00:00",\n    "O_Trans": "000295765",\n    "Detalles": [\n      {\n        "Doc_Cenabast": 303000106,\n        "Articulo": "113184",\n        "Lote": "906838",\n        "Cantidad": 110,\n        "FechaCreacion": "25-10-2023 10:17:25",\n        "FechaActualizacion": "25-10-2023 10:17:25"\n      }\n    ],\n    "Movimientos": [\n      {\n        "Doc_Cenabast": 303000106,\n        "Fecha": "02-09-2020 0:00:00",\n        "Hora": "10:43:16",\n        "DescMovimiento": 2,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 303000106,\n        "Fecha": "30-05-2021 0:00:00",\n        "Hora": "10:15:00",\n        "DescMovimiento": 1,\n        "RecibidoPor": "RECEPCION CONFORME"\n      }\n    ]\n  },\n  {\n    "IdDistribucion": 5163243,\n    "Rut_Proveedor": "1",\n    "Doc_Cenabast": 300613136,\n    "Factura": 15342,\n    "Fecha_Fac": "01-11-2023 0:00:00",\n    "Guia": 0,\n    "Fecha_Gui": "",\n    "O_Trans": "",\n    "Detalles": [\n      {\n        "Doc_Cenabast": 300613136,\n        "Articulo": "50000001",\n        "Lote": "906838",\n        "Cantidad": 10,\n        "FechaCreacion": "16-10-2023 14:03:29",\n        "FechaActualizacion": "16-10-2023 14:03:29"\n      }\n    ],\n    "Movimientos": [\n      {\n        "Doc_Cenabast": 300613136,\n        "Fecha": "02-11-2023 0:00:00",\n        "Hora": "10:00:00",\n        "DescMovimiento": 2,\n        "RecibidoPor": ""\n      }\n    ]\n  },\n  {\n    "IdDistribucion": 5162912,\n    "Rut_Proveedor": "1",\n    "Doc_Cenabast": 300613106,\n    "Factura": 15342,\n    "Fecha_Fac": "01-11-2023 0:00:00",\n    "Guia": 12345,\n    "Fecha_Gui": "01-11-2023 0:00:00",\n    "O_Trans": "S/N",\n    "Detalles": [\n      {\n        "Doc_Cenabast": 300613106,\n        "Articulo": "50000001",\n        "Lote": "906838",\n        "Cantidad": 10,\n        "FechaCreacion": "16-10-2023 12:41:47",\n        "FechaActualizacion": "16-10-2023 12:41:47"\n      },\n      {\n        "Doc_Cenabast": 300613106,\n        "Articulo": "50000001",\n        "Lote": "906838",\n        "Cantidad": 10,\n        "FechaCreacion": "16-10-2023 12:43:22",\n        "FechaActualizacion": "16-10-2023 12:43:22"\n      },\n      {\n        "Doc_Cenabast": 300613106,\n        "Articulo": "50000001",\n        "Lote": "906838",\n        "Cantidad": 10,\n        "FechaCreacion": "16-10-2023 12:43:55",\n        "FechaActualizacion": "16-10-2023 12:43:55"\n      },\n      {\n        "Doc_Cenabast": 300613106,\n        "Articulo": "50000001",\n        "Lote": "906838",\n        "Cantidad": 10,\n        "FechaCreacion": "16-10-2023 12:44:35",\n        "FechaActualizacion": "16-10-2023 12:44:35"\n      },\n      {\n        "Doc_Cenabast": 300613106,\n        "Articulo": "50000001",\n        "Lote": "906838",\n        "Cantidad": 10,\n        "FechaCreacion": "16-10-2023 12:45:57",\n        "FechaActualizacion": "16-10-2023 12:45:57"\n      }\n    ],\n    "Movimientos": [\n      {\n        "Doc_Cenabast": 300613106,\n        "Fecha": "02-11-2023 0:00:00",\n        "Hora": "10:00:00",\n        "DescMovimiento": 2,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 300613106,\n        "Fecha": "02-11-2023 0:00:00",\n        "Hora": "10:00:00",\n        "DescMovimiento": 2,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 300613106,\n        "Fecha": "02-11-2023 0:00:00",\n        "Hora": "10:00:00",\n        "DescMovimiento": 2,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 300613106,\n        "Fecha": "02-11-2023 0:00:00",\n        "Hora": "10:00:00",\n        "DescMovimiento": 2,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 300613106,\n        "Fecha": "02-11-2023 0:00:00",\n        "Hora": "10:00:00",\n        "DescMovimiento": 2,\n        "RecibidoPor": ""\n      }\n    ]\n  },\n  {\n    "IdDistribucion": 114036,\n    "Rut_Proveedor": "1",\n    "Doc_Cenabast": 300000111,\n    "Factura": 999999,\n    "Fecha_Fac": "13-05-2021 0:00:00",\n    "Guia": 0,\n    "Fecha_Gui": "",\n    "O_Trans": "",\n    "Detalles": [\n      {\n        "Doc_Cenabast": 300000111,\n        "Articulo": "12345678",\n        "Lote": "B1142B22U1",\n        "Cantidad": 2,\n        "FechaCreacion": "17-08-2022 8:44:44",\n        "FechaActualizacion": "17-08-2022 8:44:44"\n      }\n    ],\n    "Movimientos": [\n      {\n        "Doc_Cenabast": 300000111,\n        "Fecha": "30-05-2021 0:00:00",\n        "Hora": "15:17:00",\n        "DescMovimiento": 2,\n        "RecibidoPor": "DESPACHADO - 9999999999"\n      }\n    ]\n  },\n  {\n    "IdDistribucion": 114035,\n    "Rut_Proveedor": "1",\n    "Doc_Cenabast": 300000106,\n    "Factura": 279853,\n    "Fecha_Fac": "01-09-2020 0:00:00",\n    "Guia": 0,\n    "Fecha_Gui": "01-01-1900 0:00:00",\n    "O_Trans": "000295765",\n    "Detalles": [\n      {\n        "Doc_Cenabast": 300000106,\n        "Articulo": "113184",\n        "Lote": "906838",\n        "Cantidad": 110,\n        "FechaCreacion": "04-08-2022 12:51:03",\n        "FechaActualizacion": "04-08-2022 12:51:03"\n      }\n    ],\n    "Movimientos": [\n      {\n        "Doc_Cenabast": 300000106,\n        "Fecha": "02-09-2020 0:00:00",\n        "Hora": "10:43:16",\n        "DescMovimiento": 2,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 300000106,\n        "Fecha": "02-09-2020 0:00:00",\n        "Hora": "10:43:16",\n        "DescMovimiento": 1,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 300000106,\n        "Fecha": "02-09-2020 0:00:00",\n        "Hora": "10:43:16",\n        "DescMovimiento": 1,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 300000106,\n        "Fecha": "02-09-2020 0:00:00",\n        "Hora": "10:43:16",\n        "DescMovimiento": 1,\n        "RecibidoPor": ""\n      },\n      {\n        "Doc_Cenabast": 300000106,\n        "Fecha": "05-08-2022 0:00:00",\n        "Hora": "09:00:00",\n        "DescMovimiento": 1,\n        "RecibidoPor": "JUAN PEREZ"\n      },\n      {\n        "Doc_Cenabast": 300000106,\n        "Fecha": "30-05-2021 0:00:00",\n        "Hora": "10:15:00",\n        "DescMovimiento": 2,\n        "RecibidoPor": "DESPACHADO - 9999999999"\n      }\n    ]\n  }\n]\n'})})]})}function l(n={}){const{wrapper:e}={...(0,i.a)(),...n.components};return e?(0,o.jsx)(e,{...n,children:(0,o.jsx)(u,{...n})}):u(n)}},1151:(n,e,a)=>{a.d(e,{Z:()=>s,a:()=>c});var o=a(7294);const i={},t=o.createContext(i);function c(n){const e=o.useContext(t);return o.useMemo((function(){return"function"==typeof n?n(e):{...e,...n}}),[e,n])}function s(n){let e;return e=n.disableParentContext?"function"==typeof n.components?n.components(i):n.components||i:c(n.components),o.createElement(t.Provider,{value:e},n.children)}}}]);