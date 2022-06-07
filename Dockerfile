FROM golang:1.17-alpine
WORKDIR /build

ENV PORT=8000

COPY go.mod go.mod ./
COPY go.sum go.sum ./
COPY main.go main.go ./

RUN go mod download

RUN go build -o app-server

EXPOSE ${PORT}

CMD './app-server'