FROM akgha.azurecr.io/asr/java_v11_oracle_build:4.2.0

ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME
RUN mkdir /cache
RUN --mount=type=cache,target=/cache if [ -f /cache/files.tar.gz ]; then tar xfvz /cache/files.tar.gz -C /; fi
RUN mvn -f $HOME/pom.xml clean verify
RUN --mount=type=cache,target=/cache find /root/.m2/repository -type f -name "*.jar" -o -name "*.pom" -o -name "*.slingosgifeature"> /tmp/archives && tar cfvz /cache/files.tar.gz -T /tmp/archives


