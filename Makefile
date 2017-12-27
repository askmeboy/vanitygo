PROJPATH=${GOPATH}/src/github.com/toxeus/go-secp256k1

default:
	go run *.go

deps:
	go get github.com/akamensky/base58
	go get -d github.com/toxeus/go-secp256k1
	go get github.com/urfave/cli
	cd ${PROJPATH} && git submodule update --init # not needed for Go >= 1.6
	cd ${PROJPATH}/c-secp256k1 && ./autogen.sh && ./configure && make
	cd ${PROJPATH} && go install
	go install
