# Easy Lives

[![CircleCI](https://circleci.com/gh/lucascaton/easy-lives.svg?style=svg)](https://circleci.com/gh/lucascaton/easy-lives)

Aplicação criada nas [lives do Lucas Caton](https://www.lucascaton.com.br/lives).

Assista em: [youtube.com/lucascaton](https://www.youtube.com/lucascaton?sub_confirmation=1)!

### Contribuindo para este projeto

#### Usando Docker

Faça uma cópia do `.env.sample` e configure caso desejado. Execute o seguinte comando:

```
docker-compose pull &&
docker-compose up -d --no-deps --build &&
docker-compose run --rm app rails db:create db:migrate
```
