# haskell_build_env
Alpine Linux based Haskell build environment for static binaries with musl.

Image is based on the examples from the FP Complete Haskell static compilation blog post
https://www.fpcomplete.com/blog/2016/10/static-compilation-with-stack .

## Usage
From your project directory run:

```
docker run -v $(pwd):/usr/src/build -v ${HOME}/.stack:/root/.stack -w /usr/src/build -it q4uw/haskell_build_env bash
```

This will:
* Give you a bash prompt in the container
* Mount your project directory in the docker container
* Mount your local `stack` home in the container to make use of artifact caching
* Set the working directory to the project root

## Static compilation

To statically compile a binary inside the containers project root:

```
stack install --local-bin-path /usr/src/build/dist --ghc-options '-optl-static -fPIC -optc-Os'
```

This above command will place the binary in the `${PROJECT_ROOT}/dist` directory.

## Compress the binary
You can further compress the binary which significantly reduces the size using `UPX`.

```
upx --best --ultra-brute dist/${BINARY_NAME}
```

