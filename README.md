# Youtube_MP3Downloader

## Objetivo

Criar um projeto em Ruby on Rails que receba um link de um vídeo no YouTube e um email, assim ele irá enviar um anexo MP3 do vídeo para o email digitado.

## Configurações Gerais

### Configuração da .ENV

Crie um arquivo `.env` e configure os seus dados

```yaml
# .env
POSTGRES_USER=seu_usuario
POSTGRES_PASSWORD=sua_senha
DATABASE_USER=seu_usuario
DATABASE_PASSWORD=sua_senha
DATABASE_NAME=mp3downloader_development
DATABASE_HOST=db
DATABASE_PORT=5432

HONEYBADGER_API_KEY=sua_honeybadger_api_key

SMTP_ADDRESS=smtp.gmail.com
SMTP_PORT=587
SMTP_DOMAIN=example.com
SMTP_USER_NAME=seu_email@gmail.com
SMTP_PASSWORD=sua_senha
SMTP_AUTHENTICATION=plain
SMTP_ENABLE_STARTTLS_AUTO=true
```

### Comandos

Após configurar o arquivo `.env` digite no terminal esse comando:

```bash
docker-compose up --build
```
