### Oscar the chatbot, an AI assistant for Web Summit (2024)

## Description

The core function of the AI assistant is to answer questions regarding the different talks and events of the Web Summit by using Retrieval-Augmented Generation (RAG) which stores information in a vector database. A registered user can ask about:

- the agenda <img align="right" width="300" src="https://res.cloudinary.com/dzaz6s9ar/image/upload/v1747597145/Screenshot_2025-05-18_at_21.13.06_a7ulht.png" />
- startups
- VCs
- corporates
- ... etc

## Web App

Oscar is developed with Ruby and supported by the Rails framework. It follows the MVC pattern, uses Active Record as an interface for a PostgreSQL database. Authentication is operated through Devise. Real-time chat supported by OpenAI’s API, Turbo Streams and Background Jobs. RAG is implemented via the neighbor gem.

![ruby](https://img.shields.io/badge/Ruby-3.1.2-F32C24?style=for-the-badge&logo=ruby&logoColor=white) ![Rails](https://img.shields.io/badge/Rails-7.1.5-C52F24?style=for-the-badge&logo=rubyonrails&logoColor=white) ![JavaScript](https://img.shields.io/badge/JavaScript-ES6-yellow?style=for-the-badge&logo=javascript&logoColor=white) ![SCSS](https://img.shields.io/badge/SCSS-3.5-BF4080?style=for-the-badge&logo=sass&logoColor=white) ![HTML](https://img.shields.io/badge/HTML-5-E34F26?style=for-the-badge&logo=html5&logoColor=white) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14.6-4764BE?style=for-the-badge&logo=postgresql&logoColor=white) ![Bootstrap](https://img.shields.io/badge/Bootstrap-5-7852B2?style=for-the-badge&logo=bootstrap&logoColor=white)

## Ruby gems (non exhaustive)

[![neighbor](https://img.shields.io/badge/neighbor-0.5.2-red.svg)](https://rubygems.org/gems/neighbor) [![simple_form](https://img.shields.io/badge/simple_form-5.1.0-red.svg)](https://rubygems.org/gems/simple_form) [![pg_search](https://img.shields.io/badge/pg_search-2.3.5-red.svg)](https://rubygems.org/gems/pg_search) [![solid_cable](https://img.shields.io/badge/solid_cable-3.0.8-red.svg)](https://rubygems.org/gems/solid_cable) [![solid_queue](https://img.shields.io/badge/solid_queue-1.1.5-red.svg)](https://rubygems.org/gems/solid_queue) [![ruby-openai](https://img.shields.io/badge/ruby--openai-8.1.2-red.svg)](https://rubygems.org/gems/ruby-openai)

## Run Locally

Clone the project

```bash
  git clone https://github.com/maricalmer/infamous-berlin.git my-project
```

Go to the project directory and remove git logs

```bash
  cd my-project
  rm -rf .git
```

Install dependencies

```bash
  bundle install
  yarn install
```

Create database with seeds

```bash
  rails db:create db:migrate db:seed
```

Start the server

```bash
  rails s
```


## License

[MIT](https://choosealicense.com/licenses/mit/)
