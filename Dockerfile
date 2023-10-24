FROM akgha.azurecr.io/asr/java_v11_oracle_build:4.2.0

ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN --mount=type=cache,target=/root/.m2 mvn -f $HOME/pom.xml clean install

