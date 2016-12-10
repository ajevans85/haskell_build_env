# Docker image is based on the examples given on the FP Complete Haskell static compliation blogpost
# https://www.fpcomplete.com/blog/2016/10/static-compilation-with-stack

# USE ALPINE LINUX
FROM alpine
RUN apk update
# INSTALL BASIC DEV TOOLS, GHC, GMP & ZLIB
RUN echo "https://s3-us-west-2.amazonaws.com/alpine-ghc/8.0" >> /etc/apk/repositories
ADD https://raw.githubusercontent.com/mitchty/alpine-ghc/master/mitch.tishmack%40gmail.com-55881c97.rsa.pub \
    /etc/apk/keys/mitch.tishmack@gmail.com-55881c97.rsa.pub
RUN apk update
RUN apk add alpine-sdk git ca-certificates ghc gmp-dev zlib-dev
# GRAB A RECENT BINARY OF STACK
ADD https://s3.amazonaws.com/static-stack/stack-1.1.2-x86_64 /usr/local/bin/stack
RUN chmod 755 /usr/local/bin/stack

ADD https://github.com/lalyos/docker-upx/releases/download/v3.91/upx /usr/local/bin/upx
RUN chmod 755 /usr/local/bin/upx
