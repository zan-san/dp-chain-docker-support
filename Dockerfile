
FROM golang:1.19
USER root
WORKDIR /
MAINTAINER zan-san 
# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change


COPY . .

WORKDIR /dpchain

RUN go env -w GOPROXY=https://proxy.golang.com.cn,direct

RUN go env -w GO111MODULE=on

RUN go mod download && go mod verify



WORKDIR /dpchain/dper/client

RUN ./build.sh


CMD cd /dpchain/dper/client/project && ./dperClient
