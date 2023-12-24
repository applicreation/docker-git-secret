FROM alpine

RUN apk add bash gawk git gpg make && \
    git clone https://github.com/sobolevn/git-secret.git /git-secret && \
    cd /git-secret && \
    make build && \
    PREFIX="/usr/local" make install && \
    rm -rf /git-secret && \
    apk del make

ENTRYPOINT ["git", "secret"]
