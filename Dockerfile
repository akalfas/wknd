FROM akgha.azurecr.io/asr/java_v11_oracle_build:4.2.0 AS build

ENV HOME=/usr/app
RUN mkdir -p $HOME
WORKDIR $HOME
ADD . $HOME

RUN --mount=type=cache,target=/cache if [ -f /cache/files.tar.gz ]; then tar xfvz /cache/files.tar.gz -C /; fi && mvn -f $HOME/pom.xml clean verify
RUN --mount=type=cache,target=/cache find /root/.m2/repository -type f -name "*.jar" -o -name "*.pom" -o -name "*.slingosgifeature" -o -name "*.gz" -o -name "*.zip"> /tmp/archives && tar cfvz /cache/files.tar.gz -T /tmp/archives && rm -rf /root/.m2/repository

FROM akgha.azurecr.io/asr/java_v11_oracle_build:4.2.0
COPY --from=build /usr/app/all/target/aem-guides-wknd.all-3.2.2.zip all.zip


