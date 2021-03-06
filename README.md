# README

### GET '/api/v1/product_types'
* Ao acessar retorna o seguinte JSON com a lista dos tipos de produtos:

```json
[
  {
    "id": 1,
    "name": "TESTHOSPTEST41",
    "description": "Descrição do TESTHOSPTEST41",
    "product_key": "TST41",
    "created_at": "2020-02-05T19:54:49.985Z",
    "updated_at": "2020-02-05T19:54:49.985Z"
  },
  {
    "id": 2,
    "name": "TESTHOSPTEST432",
    "description": "Descrição do TESTHOSPTEST432",
    "product_key": "TS432",
    "created_at": "2020-02-05T19:54:49.993Z",
    "updated_at": "2020-02-05T19:54:49.993Z"
  },
  {
    "id": 3,
    "name": "TESTHOSPTEST122",
    "description": "Descrição do TESTHOSPTEST122",
    "product_key": "TS122",
    "created_at": "2020-02-05T19:54:50.001Z",
    "updated_at": "2020-02-05T19:54:50.001Z"
  }
]
```

### GET '/api/v1/product_types/1'
* Ao acessar retorna um JSON com a lista de planos de um tipo de produto:

```json
[
  {
    "id": 1,
    "name": "TESTHOSPTEST41 BASICO",
    "description": "Descrição test",
    "product_type_id": 1,
    "details": "Detalhe detalhado",
    "created_at": "2020-02-10T18:22:34.155Z",
    "updated_at": "2020-02-11T19:25:39.391Z",
    "status": "available"
  },
  {
    "id": 2,
    "name": "Basic",
    "description": "Plano Básico",
    "product_type_id": 1,
    "details": "Plano básico contendo [x,y,z]",
    "created_at": "2020-02-10T18:22:34.201Z",
    "updated_at": "2020-02-10T18:22:34.201Z",
    "status": null
  },
  {
    "id": 3,
    "name": "Pro",
    "description": "Plano Profissional",
    "product_type_id": 1,
    "details": "Plano Profissional contendo [x,y,z,a,b]",
    "created_at": "2020-02-10T18:22:34.206Z",
    "updated_at": "2020-02-10T18:22:34.206Z",
    "status": null
  }
]
```

### GET '/api/v1/plans'
* Ao acessar retorna o seguinte JSON com a lista dos tipos de produtos:

```json
[
  {
    "id": 1,
    "name": "TESTHOSPTEST41 BASICO",
    "description": "Descrição test",
    "product_type_id": 1,
    "details": "Detalhe detalhado",
    "created_at": "2020-02-10T23:02:25.331Z",
    "updated_at": "2020-02-10T23:02:25.331Z",
    "status": null
  },
  {
    "id": 2,
    "name": "Basic",
    "description": "Plano Básico",
    "product_type_id": 1,
    "details": "Plano básico contendo [x,y,z]",
    "created_at": "2020-02-10T23:02:25.669Z",
    "updated_at": "2020-02-10T23:02:25.669Z",
    "status": null
  },
  {
    "id": 3,
    "name": "Pro",
    "description": "Plano Profissional",
    "product_type_id": 1,
    "details": "Plano Profissional contendo [x,y,z,a,b]",
    "created_at": "2020-02-10T23:02:25.735Z",
    "updated_at": "2020-02-10T23:02:25.735Z",
    "status": null
  }
]
```

### GET '/api/v1/plans/1'
* Ao acessar retorna o seguinte JSON com detalhes de um plano:

```json
{
  "id": 1,
  "name": "TESTHOSPTEST41 BASICO",
  "description": "Descrição test",
  "product_type_id": 1,
  "details": "Detalhe detalhado",
  "created_at": "2020-02-10T18:22:34.155Z",
  "updated_at": "2020-02-11T19:25:39.391Z",
  "status": "available"
}
```

### GET '/api/v1/plans/1/prices'
* Ao acessar retorna o seguinte JSON com a lista dos preços de um plano:

```json
[
  {
    "id": 1,
    "plan_price": "4356.87",
    "plan_id": 1,
    "created_at": "2020-02-10T18:22:34.167Z",
    "updated_at": "2020-02-10T18:22:34.167Z",
    "periodicity": "CincoAnos"
  },
  {
    "id": 2,
    "plan_price": "5351.09",
    "plan_id": 1,
    "created_at": "2020-02-10T18:22:34.183Z",
    "updated_at": "2020-02-10T18:22:34.183Z",
    "periodicity": "SeisAnos"
  },
  {
    "id": 3,
    "plan_price": "6129.13",
    "plan_id": 1,
    "created_at": "2020-02-10T18:22:34.189Z",
    "updated_at": "2020-02-10T18:22:34.189Z",
    "periodicity": "SeteAnos"
  }
]
```

### GET '/api/v1/periodicities'
* Ao acessar retorna o seguinte JSON com a lista de periodicidades:

```json
[
  {
    "id": 1,
    "name": "Semestral",
    "period": 6,
    "created_at": "2020-02-09T03:32:26.393Z",
    "updated_at": "2020-02-09T03:32:26.393Z"
  }
]
```
