FROM python:2

RUN mkdir -p /EvilOSX && cd /EvilOSX

ADD . /EvilOSX/

WORKDIR /EvilOSX

RUN pip install -r requirements.txt

CMD ["python", "start.py", "--cli", "--port", "80"]

