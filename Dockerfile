# USE ALPINE LINUX
FROM alpine

# INSTALL BASIC DEV TOOLS, GHC, GMP & ZLIB. Note we need to add the alpine-ghc signiture key
RUN echo "https://s3-us-west-2.amazonaws.com/alpine-ghc/8.0" >> /etc/apk/repositories
ADD https://raw.githubusercontent.com/mitchty/alpine-ghc/master/mitch.tishmack%40gmail.com-55881c97.rsa.pub \
    /etc/apk/keys/mitch.tishmack@gmail.com-55881c97.rsa.pub

RUN apk update
RUN apk add alpine-sdk git ca-certificates ghc gmp-dev zlib-dev

# GRAB A RECENT BINARY OF STACK
ADD https://s3.amazonaws.com/static-stack/stack-1.1.2-x86_64 /usr/local/bin/stack
RUN chmod 755 /usr/local/bin/stack

# GRAP UPX BINARY COMPRESSION APP
ADD https://github.com/lalyos/docker-upx/releases/download/v3.91/upx /usr/local/bin/upx
RUN chmod 755 /usr/local/bin/upx

CMD ["bash"]
