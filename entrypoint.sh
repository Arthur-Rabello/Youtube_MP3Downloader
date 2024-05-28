#!/bin/bash
set -e

# Remover um arquivo de PID preexistente do Rails, se existir.
rm -f /app/tmp/pids/server.pid

# Definir a senha do PostgreSQL para o comando psql
export PGPASSWORD=$DATABASE_PASSWORD

# Esperar pelo banco de dados estar disponível.
until psql -h "$DATABASE_HOST" -U "$DATABASE_USER" -c '\q'; do
  >&2 echo "Postgres ainda não está disponível - dormindo"
  sleep 1
done

yarn install

# Executar migrações do Rails
bundle exec rails db:create db:migrate

# Então executar o comando principal do contêiner (passado como argumento para este script)
exec "$@"
