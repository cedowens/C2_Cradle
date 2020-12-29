FROM golang:1.15

RUN mkdir -p /chaosc2

RUN cd /chaosc2 && echo "this is my test file" >> /chaosc2/metest.txt

ADD . /chaosc2/ 

RUN cd /chaosc2/CHAOS/cmd/chaos/ && go build

CMD ["/chaosc2/CHAOS/cmd/chaos/chaos"]

