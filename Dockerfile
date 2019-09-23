FROM golang:1.13.0-alpine3.10 AS builder
WORKDIR /go/src/github.com/gliderlabs/registrator/

COPY . .

RUN GOPROXY=https://goproxy.io CGO_ENABLED=0 GOOS=linux go build \
		-a -installsuffix cgo \
		-ldflags "-X main.Version=$(cat VERSION)" \
		-o bin/registrator \
		.

FROM alpine:3.10
RUN apk add --no-cache ca-certificates
COPY --from=builder /go/src/github.com/gliderlabs/registrator/bin/registrator /bin/registrator

ENTRYPOINT ["/bin/registrator"]
