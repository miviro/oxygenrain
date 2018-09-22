FROM golang
LABEL maintainer="Miguel Vila <eonmilu@gmail.com>"

ENV GOPATH=/go
ADD . $GOPATH/src/github.com/eonmilu/oxygenrain
WORKDIR $GOPATH/src/github.com/eonmilu/oxygenrain
EXPOSE 8080 8443 8903

COPY goyt/ /go/src/github.com/eonmilu/goyt/
RUN go get github.com/derekparker/delve/cmd/dlv github.com/gorilla/mux github.com/lib/pq

RUN go build

ENTRYPOINT ["/go/bin/dlv", "debug", "."]