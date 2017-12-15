FROM alpine:3.6

ENV GOPATH=/go
ENV GOBIN=${GOPATH}/bin
ENV PROJ=issue-sync
ENV ORG_PATH=github.com/coreos

WORKDIR ${GOPATH}/src/${ORG_PATH}/${PROJ}

RUN mkdir -p ${GOBIN}

COPY . .

RUN apk --no-cache add ca-certificates git build-base go

RUN go install

ENV PATH=${PATH}:${GOBIN}

# RUN go get
#
# RUN go build -o ${GOBIN}/issue-sync
#
# RUN go get ./...
#
# RUN go build
#
# RUN go install
#
# RUN go get ./...
#WORKDIR /opt/issue-sync
#
#RUN apk update --no-cache && apk add ca-certificates
#
#COPY bin/issue-sync /opt/issue-sync/issue-sync
#
#COPY config.json /opt/issue-sync/config.json
#
#ENTRYPOINT ["./issue-sync"]
#

#CMD ["--config", "config.json"]
