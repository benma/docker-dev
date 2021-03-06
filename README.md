#Docker development environment#

This document describes how to create a development environment
inside a docker container with your `$HOME` folder mounted as the
`$HOME` folder inside the docker container. The benefit is that all
your dotfiles will be there.

##Usage##

1. fork this repo and clone your fork locally
2. edit the `Dockerfile`
  * for non-`bash` users: find out how to wrap your shell's init file
    and make sure that the $GOPATH is indeed `/opt/go/`.
1. create an image with `docker build --force-rm --pull -t notary-dev .`
1. log into development environment with

    ```bash
        docker run --rm -it -e TERM=$TERM -v $GOPATH/src/github.com/monetas:/opt/go/src/github.com/monetas -v $HOME:/home/dev notary-dev
    ```

1. create an alias for the `docker run` command that suits your needs
1. commit changes and push to your fork on GitHub
  * this is useful to inspire other developers with your setup
  * and it's a free backup of your environment
