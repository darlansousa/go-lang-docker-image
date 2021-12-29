FROM golang:rc-alpine3.15 AS builder

WORKDIR /build

COPY go.mod .
COPY hello.go .
RUN go build -o app

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /build/app .
ENTRYPOINT [ "./app" ]