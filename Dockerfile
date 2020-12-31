FROM ubuntu:latest

USER root

RUN apt-get update && apt-get install -y python python-pip

RUN apt-get install curl

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

RUN python get-pip.py

RUN pip install flask 

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080
