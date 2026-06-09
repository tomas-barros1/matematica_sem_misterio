# Matemática Sem Mistério

Plataforma Rails com experiência gamificada para o ensino fundamental.

## Setup

```bash
bundle install
bin/rails db:migrate db:seed
bin/rails server
```

## Acessos iniciais

- Admin: `admin@example.com`
- Estudante: `estudante@example.com`
- Senha padrão: `Password1!`

## Testes

```bash
bundle exec rspec
```

## Docker

```bash
docker build -t matematica-sem-misterio .
docker run -p 3000:80 -e RAILS_MASTER_KEY=... matematica-sem-misterio
```

O container executa `bundle exec rails db:migrate` antes de iniciar o Puma.

## Render

1. Crie um Web Service usando `render.yaml`.
2. Configure `RAILS_MASTER_KEY`.
3. Ajuste `APP_HOST` para o domínio do serviço.
4. Faça o deploy.
