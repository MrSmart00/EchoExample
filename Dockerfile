FROM golang:1.15-alpine3.12 as build

WORKDIR /go/src

COPY . .

RUN apk add --no-cache git && \
    go get github.com/labstack/echo && \
    env GOOS=linux GOARCH=amd64 && \
    go build -o /go/bin/app ./main.go

FROM alpine:3.12

WORKDIR /app

COPY --from=build /go/bin/app .

ENTRYPOINT ["./app"]
