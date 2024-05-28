# Use a imagem Ruby oficial como base
FROM ruby:2.7.4

# Instale dependências do sistema
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  ffmpeg \
  python3 \
  python3-pip \
  postgresql-client

# Instale yt-dlp via pip
RUN pip3 install yt-dlp

# Instale Yarn via npm
RUN npm install -g yarn

# Configure o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copie o Gemfile e Gemfile.lock para o contêiner
COPY Gemfile Gemfile.lock ./

# Instale as gems
RUN bundle install

# Copie o restante do código do aplicativo
COPY . .

# Instale dependências do Node.js
RUN yarn install --check-files

# Instale Webpack globalmente
RUN npm install -g webpack webpack-cli

# Pré-compilar os assets para produção
RUN bundle exec rails assets:precompile

# Copie o script de inicialização
COPY entrypoint.sh /usr/bin/

# Torne o script de inicialização executável
RUN chmod +x /usr/bin/entrypoint.sh

# Copie o arquivo .env
COPY .env .env

# Expõe a porta em que o servidor Rails será executado
EXPOSE 3000

# Comando para iniciar o servidor Rails
ENTRYPOINT ["entrypoint.sh"]
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

RUN yarn install 
