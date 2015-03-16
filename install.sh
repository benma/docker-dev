apt-get update
apt-get install -y --no-install-recommends \
    git \
    mercurial \
    tig \
    emacs \
    xclip \
    ack-grep \
    python3

apt-get autoremove

go get golang.org/x/tools/cmd/goimports
go get code.google.com/p/rog-go/exp/cmd/godef
