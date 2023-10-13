FROM python:3.9-slim-bullseye

USER root
EXPOSE 8443
RUN useradd -mU graticule
RUN apt update && apt upgrade -y

USER graticule
WORKDIR /home/graticule

RUN mkdir service
RUN mkdir service/cert
COPY setup.py .
COPY service/__init__.py service/main.py ./service/
COPY localhost-cert/*.pem ./service/cert/

RUN pip install --user --no-cache-dir --upgrade pip setuptools
RUN pip install --user --no-cache-dir --upgrade -e .

CMD export PATH=$PATH:~/.local/bin && uvicorn --app-dir service main:service --host 0.0.0.0 --port 8443 --ssl-keyfile service/cert/key.pem --ssl-certfile service/cert/cert.pem
