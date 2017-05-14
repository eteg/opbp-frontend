FROM openjdk:8

# Instalação do nodejs
RUN sh -c 'curl -sL https://deb.nodesource.com/setup_7.x | bash -'
RUN apt-get install -y nodejs
RUN alias node='nodejs'

# Instalação do yarn
RUN sh -c 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -'
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Instalação do gradle
RUN apt-get install -y gradle

# Executa a build
VOLUME /build
ADD . .
RUN gradle build --stacktrace