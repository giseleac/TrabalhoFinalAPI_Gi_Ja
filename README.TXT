# 📚 Biblioteca GIJA

Sistema de Gerenciamento de Biblioteca desenvolvido para a disciplina **Desenvolvimento de Serviços e APIs**, utilizando Node.js, Express, MySQL, JWT e OAuth 2.0 (Google).

## 👩‍💻 Integrantes

- Gisele Costa
- Janina Silva

---

# 📌 Objetivo

Desenvolver uma API REST para gerenciamento de uma biblioteca, permitindo o cadastro e gerenciamento de livros, categorias, usuários e empréstimos, além da implementação de autenticação utilizando JWT e OAuth 2.0 com Google.

---

# 🚀 Tecnologias Utilizadas

- Node.js
- Express.js
- MySQL
- Knex.js
- JWT (JSON Web Token)
- Passport.js
- OAuth 2.0 (Google)
- bcrypt
- dotenv
- Thunder Client
- Git e GitHub

---

# 📂 Estrutura do Projeto

```
config/
controllers/
middlewares/
models/
public/
routes/
views/

index.js
package.json
biblioteca_gija.sql
```

---

# 📚 Funcionalidades

## Livros

- Cadastrar livro
- Listar livros
- Buscar livro por ID
- Atualizar livro
- Excluir livro

---

## Categorias

- Cadastrar categoria
- Listar categorias
- Buscar categoria por ID
- Atualizar categoria
- Excluir categoria

---

## Usuários

- Cadastrar usuário
- Listar usuários
- Buscar usuário por ID
- Atualizar usuário
- Excluir usuário

---

## Empréstimos

- Registrar empréstimo
- Listar empréstimos
- Buscar empréstimo por ID
- Atualizar empréstimo
- Excluir empréstimo

---

# 🔐 Autenticação JWT

A autenticação foi implementada utilizando JSON Web Token (JWT).

Após o login do usuário com e-mail e senha, a API gera um token contendo informações do usuário autenticado.

Esse token deve ser enviado no cabeçalho Authorization para acessar as rotas protegidas.

Exemplo:

```
Authorization: Bearer SEU_TOKEN
```

O middleware de autenticação verifica se o token é válido antes de permitir o acesso às rotas protegidas.

---

# 🔑 OAuth 2.0

Foi implementado login utilizando conta Google através do protocolo OAuth 2.0.

Fluxo de autenticação:

1. Usuário clica em **Entrar com Google**
2. É redirecionado para a página de login do Google
3. Realiza a autenticação
4. O Google retorna os dados do usuário para a aplicação
5. A API recebe as informações do usuário autenticado

---

# ▶️ Como executar o projeto

## Instalar dependências

```
npm install
```

## Configurar arquivo .env

```
GOOGLE_CLIENT_ID=SEU_CLIENT_ID
GOOGLE_CLIENT_SECRET=SEU_CLIENT_SECRET
GOOGLE_CALLBACK_URL=http://localhost:8001/api/auth/google/callback

JWT_SECRET=sua_chave_jwt
```

---

## Executar

```
npm run dev
```

Servidor:

```
http://localhost:8001
```

---

# 🧪 Testes

Os testes da API foram realizados utilizando o Thunder Client.

Foram testados:

- CRUD completo
- Login
- JWT
- OAuth Google
- Rotas protegidas

---

# 📖 Banco de Dados

O banco de dados utilizado foi o MySQL.

O script para criação do banco encontra-se no arquivo:

```
biblioteca_gija.sql
```

---

# 📌 Rotas Principais

## Login

```
POST /api/login
```

## OAuth

```
GET /api/auth/google
```

```
GET /api/auth/google/callback
```

## Livros

```
GET /api/livros
POST /api/livros
PUT /api/livros/:id
DELETE /api/livros/:id
```

## Categorias

```
GET /api/categorias
POST /api/categorias
PUT /api/categorias/:id
DELETE /api/categorias/:id
```

## Usuários

```
GET /api/usuarios
POST /api/usuarios
PUT /api/usuarios/:id
DELETE /api/usuarios/:id
```

## Empréstimos

```
GET /api/emprestimos
POST /api/emprestimos
PUT /api/emprestimos/:id
DELETE /api/emprestimos/:id
```

---

# 📄 Licença

Projeto desenvolvido para fins acadêmicos na disciplina **Desenvolvimento de Serviços e APIs** da Faculdade Senac.