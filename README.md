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

### GET '/api/v1/plans/1/prices'
* Ao acessar retorna o seguinte JSON com a lista dos preços de um plano:

```json
[
  {
    "id": 1,
    "plan_price": "4356.87",
    "plan_id": 1,
    "periodicity_id": 1,
    "created_at": "2020-02-09T00:34:30.567Z",
    "updated_at": "2020-02-09T00:34:30.567Z"
  },
  {
    "id": 2,
    "plan_price": "5351.09",
    "plan_id": 1,
    "periodicity_id": 2,
    "created_at": "2020-02-09T00:34:30.656Z",
    "updated_at": "2020-02-09T00:34:30.656Z"
  },
  {
    "id": 3,
    "plan_price": "6129.13",
    "plan_id": 1,
    "periodicity_id": 3,
    "created_at": "2020-02-09T00:34:30.745Z",
    "updated_at": "2020-02-09T00:34:30.745Z"
  }
]
```
