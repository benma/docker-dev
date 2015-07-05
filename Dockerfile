FROM monetas/golang-base:latest

# Make sure to set your Go env vars in your .bashrc only if they have not been set before, like this:
# if [ -z "$GOPATH" ]
#     then
#     export GOPATH=$HOME/go
#     export GOROOT=$HOME/src/go
#     export PATH="$HOME/bin:$GOPATH/bin:$HOME/opentxs/bin:$GOROOT/bin:$PATH"
# fi


MAINTAINER Marko Bencun "marko@monetas.net"

ADD install.sh ./
RUN sh install.sh

ADD bashrc ./

CMD uid=$(ls -ldn $GOPATH/src/github.com/monetas/ | awk '{print $3}') && \
    useradd -d /home/dev -M -u $uid -s /bin/bash dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/dev && \
    echo "export GOPATH=$GOPATH GOROOT=$GOROOT PATH=$PATH" >> /opt/bashrc && \
    cat /home/dev/.bashrc bashrc >> /opt/bashrc && \
    chown -R dev:dev $GOPATH && \
    sh /opt/run_services.sh && \
    cd $GOPATH/src/github.com/monetas/gotary/scripts/database && sh install.sh && \
    sudo -i -u dev bash --rcfile /opt/bashrc
