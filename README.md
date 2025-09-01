# Semana 3 — CRUD RESTful (Produtos)

Este repositório contém os artefatos para a **Semana 3** (REST/RESTful) conforme os slides: CRUD de **Produtos**, com **MySQL** e documentação de endpoints.

> Baseado no conteúdo da Semana #3: REST, recursos/URIs, verbos HTTP, RMM e status codes (vide slides da disciplina).

## Como usar no MySQL Workbench

1. Abra o **MySQL Workbench**.
2. Conecte no seu servidor local (por exemplo, `localhost:3306`).
3. Vá em **File → Open SQL Script...** e selecione `schema.sql`.
4. Execute o script (relâmpago) para criar o banco `semana3_rest`, a tabela `produtos` e dados de exemplo.
5. (Opcional) Rode consultas: `SELECT * FROM semana3_rest.produtos;`

## Modelo de Dados (produtos)
- `id` (PK, auto_increment)
- `nome` (varchar 120, obrigatório)
- `descricao` (text)
- `preco` (decimal 10,2)
- `estoque` (int)
- `ativo` (boolean TINYINT)
- `criado_em` (timestamp, default now)
- `atualizado_em` (timestamp, auto update)

## Endpoints REST (exemplo)

Recurso: `/api/produtos`

- **GET /api/produtos** → lista todos (200 OK)
- **GET /api/produtos/{id}** → um item (200 OK; 404 se não encontrar)
- **POST /api/produtos** → cria (201 Created + `Location`)
- **PUT /api/produtos/{id}** → atualiza (200 OK; 204 se sem corpo; 404 se não encontrar)
- **DELETE /api/produtos/{id}** → remove (204 No Content; 404 se não encontrar)

### Exemplos `curl`

```bash
# Listar
curl -X GET http://localhost:8080/api/produtos

# Detalhar
curl -X GET http://localhost:8080/api/produtos/1

# Criar
curl -X POST http://localhost:8080/api/produtos   -H "Content-Type: application/json"   -d '{"nome":"Lente Blue Filter","descricao":"Proteção para luz azul","preco":299.90,"estoque":30,"ativo":true}'

# Atualizar
curl -X PUT http://localhost:8080/api/produtos/1   -H "Content-Type: application/json"   -d '{"nome":"Lente Prime 1.56 (Atualizada)","descricao":"AR melhorado","preco":149.90,"estoque":20,"ativo":true}'

# Remover
curl -X DELETE http://localhost:8080/api/produtos/1
```

### Status Codes (regras de bolso da aula)
- **201 Created** em POST com `Location`
- **200 OK** em PUT/PATCH quando retorna corpo
- **204 No Content** em PUT/PATCH/DELETE sem corpo
- **422 Unprocessable Entity** para erro de validação
- **401/403** para auth/perm ⚠️ (quando aplicável)

## OpenAPI
Veja `openapi.yaml` para a especificação dos endpoints.

## Postman
Importe `postman_collection.json` no Postman. A variável `baseUrl` aponta por padrão para `http://localhost:8080`.

---

> Dica de aula: implemente a API em qualquer stack (ex.: Spring Boot/Node) e conecte nesta tabela do MySQL.