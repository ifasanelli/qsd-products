# README
(seeds)
* Ao acessar  retorna o seguinte JSON com a lista dos
* tipos de produtos:

### GET '/api/v1/product_types'

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

* planos:

### GET '/api/v1/plans'

```json
[
  {
    "id": 1,
    "name": "Basic",
    "description": "Plano Básico",
    "product_type_id": 1,
    "details": "Plano básico contendo [x,y,z]",
    "created_at": "2020-02-08T21:21:46.398Z",
    "updated_at": "2020-02-08T21:21:46.398Z"
  },
  {
    "id": 2,
    "name": "Pro",
    "description": "Plano Profissional",
    "product_type_id": 1,
    "details": "Plano Profissional contendo [x,y,z,a,b]",
    "created_at": "2020-02-08T21:21:46.733Z",
    "updated_at": "2020-02-08T21:21:46.733Z"
  }
]
```