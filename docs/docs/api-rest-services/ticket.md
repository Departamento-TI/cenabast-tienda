# Ticketing

:::info
We use Zammad as the ticketing solution for customer incidents.\
Zammad platform: [soporte.connectcar.cl](https://soporte.connectcar.cl)
:::

## API create customer

:::warning[Create User]
Before creating a ticket in Zammad, we need to create the user email.
:::

```jsx
POST 'https://soporte.connectcar.cl/api/v1/users' \ 
--header 'Authorization: Token MfaSE3CHlbT58A3czVPM7E8mn3UhNlcxfTQ6OMcvixnLAdhnWO2rXooPOq0n7UqJ' \ 
--header 'Content-Type: application/json' \ 
--data-raw '{
  "firstname": "Good",
  "lastname": "Year",
  "email": "goodyear@marketshop.io",
  "login": "goodyear@marketshop.io",
  "roles": [
    "Customer"
  ]
}'
```

## API insert Car Crash Form

:::warning
The following ticket is created "**in behalf of**" the user.
:::

```jsx
POST 'https://soporte.connectcar.cl/api/v1/tickets/' \
--header 'X-On-Behalf-Of: nmella@cenabast.cl' \
--header 'Content-Type: application/json' \
--header 'Authorization: Basic YWRtaW4tY2NAbWFya2V0c2hvcC5pbzpQbGVqODc0NA==' \
--data-raw '{
		"title":"Messsage from nmella@cenabast.cl",
		"group":"Users",
		"article":
			{
			"subject":"My subject",
			"reply_to":"nmella@cenabast.cl",
			"from":"nmella@cenabast.cl",
			"body":"Help wanted 4!",
			"type":"web",
			"internal":false,
			"content_type":"text/html"
			},
		"customer_id":"guess:nmella@cenabast.cl",
		"tags":"som tag",
        "fecha_de_hoy": "2023-11-15",                                           // => Date (YYYY-MM-DD)
        "nombre_de_la_persona_que_iba_conduciendo": "Juan Gonzalez",
        "rut_o_pasaporte_de_la_persona_que_iba_conduciendo": "12.456.677-8",
        "nacionalidad": "Chileno",
        "direccion_de_la_persona_que_iba_conduciendo": "Calle 123",
        "comuna_de_la_persona_que_iba_conduciendo": "Quinta Normal",
        "ciudad_de_la_persona_que_iba_conduciendo": "Santigo",
        "marca_vehiculo": "Volkswagen",
        "modelo_vehiculo": "Voyage",
        "ano_vehiculo": "2022",                                                 // => Integer
        "patente_vehiculo": "BB-CL-34",
        "fecha_en_que_ocurrio_el_incidente": "2023-09-29",                      // => Date (YYYY-MM-DD)
        "hora_en_que_ocurrio_el_incidente": "13 hrs aprox.",
        "calle_en_donde_ocurrio_el_incidente": "CalleCalle",
        "comuna_en_donde_ocurrio_el_incidente": "Ñuñoa",
        "ciudad_en_donde_ocurrio_el_incidente": "Santiago",
        "velocidad_al_momento_del_siniestro_en_km": "98",                        // => Integer
        "event_type": "Robo",                                                    // => Dropdown (Robo,Colision)
        "el_siniestro_se_produjo_por_accion": "Tercero",
        "relato_de_los_hechos": "Un auto me golpeó por atrás a la salida",       // => Long Text (max 1000 characters)
        "danos": "Principalmente el parachoque delantero trasero lado izq",      // => Long Text (max 1000 characters)
        "terceros_involucrados": "Si",                                           // => Dropdown (Si,No) => If "No", then next "terceros_*" should be ignored/hidden.
        "terceros_nombre": "Pedro Muñoz Rodriguez",
        "terceros_rut": "24.355.055-K",
        "terceros_telefono": "+56998454884",
        "terceros_domicilio": "Street N° 1234",
        "terceros_mail": "pedro.munoz@gmail.com",
        "terceros_compania_de_seguros": "Mapfre Seguros de Vida",
        "terceros_placa_patente": "LL-KB-22",
        "terceros_marca": "Tesla",
        "terceros_modelo": "S10",
        "terceros_ano": "2021",                                                   // => Integer
        "terceros_culpable": "No",                                                // => Dropdown (Si,No)
        "terceros_lesionados": "No",                                              // => Dropdown (Si,No)
        "concurre_carabineros_al_lugar_del_siniestro": "Si",                      // => Dropdown (Si,No) => If "No", then next "carabineros_*" should be ignored/hidden.
        "carabineros_fecha": "2023-11-12",                                        // => Date (YYYY-MM-DD)
        "carabineros_hora": "14:32",
        "carabineros_numero_de_parte": "123456-A",
        "carabineros_numero_de_folio": "80393-B",
        "carabineros_numero_de_constancia": "23232-LA",
        "carabineros_citacion1": "No sé",
        "carabineros_fecha_de_citacion": "2023-12-25",                            // => Date (YYYY-MM-DD)
        "carabineros_juzgado": "Primer Juzgado de Puente Alto",
        "declaracion_nombre_completo": "Juan Gonzalez",
        "declaracion_rut": "12.456.677-8"
		}'
```

## API insert maintenance appointment

```jsx
POST 'https://soporte.connectcar.cl/api/v1/tickets/' \
--header 'X-On-Behalf-Of: juan@marketshop.io' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer MfaSE3CHlbT58A3czVPM7E8mn3UhNlcxfTQ6OMcvixnLAdhnWO2rXooPOq0n7UqJ' \
--data-raw '{
		"title":"Agendamiento por juan@marketshop.io",
		"group":"Users",
		"article":
			{
			"subject":"Agendamiento",
			"reply_to":"juan@marketshop.io",
			"from":"juan@marketshop.io",
			"body":"Schedule event date 18-12-2023 on address: Street 1234, Lo Barnechea",
			"type":"web",
			"internal":false,
			"content_type":"text/html"
			},
		"customer_id":"guess:juan@marketshop.io"
		}'
```