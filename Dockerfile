FROM ubuntu:22.04

SHELL ["/bin/bash", "-c"]

# パッケージインストール
RUN apt-get update \
    && apt-get install -y sudo unzip zip vim tar less iputils-ping curl jq git gnupg

# ユーザー作成
ARG USER_NAME=vscode
ARG USER_GROUP_NAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid ${USER_GID} ${USER_GROUP_NAME} \
    && useradd --uid ${USER_UID} --gid ${USER_GID} --shell /bin/bash --create-home -m ${USER_NAME} \
    && echo "${USER_GROUP_NAME}	ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${USER_GROUP_NAME} \
    && chmod 0440 /etc/sudoers.d/${USER_GROUP_NAME}

# SDKMANでJava/Gradleインストール
ARG JAVA_VERSION=17.0.9-amzn
ARG GRADLE_VERSION=7.5
ARG SDKMAN_DIR=/home/vscode/.sdkman

USER vscode
RUN curl -s "https://get.sdkman.io" | bash \
    && bash -lc "source ${SDKMAN_DIR}/bin/sdkman-init.sh && sdk install java ${JAVA_VERSION} && sdk install gradle ${GRADLE_VERSION}"

# Spring Bootプロジェクトをコピーしてビルド
USER root
COPY demo /home/vscode/app
RUN chown -R vscode:vscode /home/vscode/app

USER vscode
WORKDIR /home/vscode/app
RUN chmod +x ./gradlew \
    && bash -lc "source ${SDKMAN_DIR}/bin/sdkman-init.sh && ./gradlew build"

# アプリ起動
CMD bash -lc "source /home/vscode/.sdkman/bin/sdkman-init.sh && java -jar build/libs/demo-0.0.1-SNAPSHOT.jar"

