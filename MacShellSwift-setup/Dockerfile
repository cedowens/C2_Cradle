FROM python:3

RUN mkdir -p /mss

ADD . /mss/

WORKDIR /mss

RUN openssl req -new -newkey rsa:2048 -nodes -out ca.csr -keyout ca.key -subj "/C=US/ST=CA/L=Redwood City/O=Mac Experts LLC" && openssl x509 -trustout -signkey ca.key -days 365 -req -in ca.csr -out ca.pem

CMD ["python3", "swiftshell-server.py"]
