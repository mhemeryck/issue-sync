FROM golang:1.9.2-alpine3.7

WORKDIR /go/src/app
COPY . .

RUN apk --no-cache add git

RUN go-wrapper download
RUN go-wrapper install
