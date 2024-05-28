# Youtube_MP3Downloader

## Objetivo

Criar um projeto em Ruby on Rails que receba um link de um vídeo no YouTube e um email, assim ele irá enviar um anexo MP3 do vídeo para o email digitado.

## Configurações Gerais

### Configuração da .ENV

Duplique o arquivo `.env.example` e faça alterações caso necessário.

```bash
cp .env.example .env
```

### Como Utilizar o Sistema

#### 1. Configuração Inicial

Após configurar o arquivo `.env` com as variáveis necessárias, execute o seguinte comando para construir e iniciar os contêineres Docker:

```bash
sudo docker-compose up --build
```

#### 2. Acessando o Sistema

Conecte-se ao endereço local fornecido pelo Docker, normalmente `http://localhost:3000`, a menos que você tenha configurado uma porta diferente.

![Acesso ao sistema](https://github.com/Arthur-Rabello/Youtube_MP3Downloader/assets/146759263/c362d408-0382-49f2-99c1-ee745d8661d4)

#### 3. Submetendo uma URL de Música do YouTube

Na interface do sistema, insira uma URL de uma música do YouTube e um e-mail válido no formulário fornecido.

![image](https://github.com/Arthur-Rabello/Youtube_MP3Downloader/assets/146759263/e13f1fce-9005-4105-9ee6-7cf1200e6774)

#### 4. Recebendo o E-mail de Confirmação

Ao submeter o formulário, você deve receber um e-mail de confirmação contendo o link para download da música em formato MP3.

![image](https://github.com/Arthur-Rabello/Youtube_MP3Downloader/assets/146759263/3da853a0-d472-4807-993b-6252edfdeede)

### Comandos Adicionais

Para acessar o terminal bash do contêiner web do Docker, siga estes passos:

1. Liste os contêineres em execução:

    ```bash
    sudo docker ps
    ```

2. Acesse o contêiner desejado (substitua `<container-name>` pelo nome ou ID do contêiner):

    ```bash
    sudo docker exec -it <container-name> /bin/bash
    ```

### Para Usuários com PostgreSQL Instalado em Suas Máquinas

Caso você já possua o PostgreSQL instalado e em execução na sua máquina, poderá ocorrer um erro indicando que a porta 5432 está em uso. Para corrigir isso, siga os passos abaixo para parar o processo do PostgreSQL. As instruções são fornecidas para Linux, Windows e macOS.

#### Para Linux

1. **Pare o serviço do PostgreSQL**:

    ```bash
    sudo service postgresql stop
    ```

#### Para Windows

1. **Pare o serviço do PostgreSQL**:

    - Abra o **Prompt de Comando** como Administrador.
    - Execute o seguinte comando:

    ```powershell
    net stop postgresql
    ```

#### Para macOS

1. **Pare o serviço do PostgreSQL**:

    ```bash
    brew services stop postgresql
    ```

Seguindo esses passos, você deverá parar o serviço do PostgreSQL, liberando a porta 5432 para ser utilizada.

### Considerações Finais

- Certifique-se de que as portas 3000 (para o servidor web) e 5432 (para o PostgreSQL) estão livres e acessíveis.
- Utilize um serviço de email seguro e não compartilhe suas credenciais publicamente.
- Para garantir a segurança, revise as permissões dos arquivos sensíveis, como o `.env`.
