# FROM node:alpine3.11

# RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
# RUN apk update && \
#     apk upgrade --no-cache && \
#     apk add --no-cache \
#         git \
#         yarn
# RUN git config --global http.sslVerify false
# WORKDIR /home/www

FROM nimlang/nim:alpine

RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache \
        openssh-client \
        ca-certificates \
        openssl \
        pcre \
        bsd-compat-headers \
        lcov \
        nodejs yarn \
        && \
    update-ca-certificates
RUN yarn config set strict-ssl false
RUN git config --global http.sslVerify false
ENV PATH $PATH:/root/.nimble/bin
WORKDIR /home/www
