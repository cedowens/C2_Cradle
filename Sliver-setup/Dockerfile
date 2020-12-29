FROM golang:1.15

RUN mkdir -p /sliverc2

WORKDIR /sliverc2

ADD . /sliverc2/

RUN chmod +x sliver-server

CMD ["/sliverc2/sliver-server"]

