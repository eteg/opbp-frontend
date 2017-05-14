FROM gradle:jdk8

USER root

# Instalação do nodejs
RUN sh -c 'curl -sL https://deb.nodesource.com/setup_7.x | bash -' \
	&& apt-get install -y nodejs \
	&& alias node='nodejs'

# Instalação do yarn
RUN sh -c 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -' \
	&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
	&& apt-get update \ 
	&& apt-get install -y yarn
	
# Executa a build
VOLUME /build
ADD . .
RUN gradle build --stacktrace