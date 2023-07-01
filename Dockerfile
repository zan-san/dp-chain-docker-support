
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

WORKDIR /dpchain/dper/client/conf

RUN go run initConfig.go


#CMD cd /dpchain/dper/client/project && ./dperClient

CMD cd /dpchain/dper/client/auto/dper_dper1 && ./dperClient -mode=multi_http




#put this file in same directory of dpchain

#command 
#docker build -t zansan/dper:0.9 .

