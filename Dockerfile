FROM python:3.9-slim-bullseye

EXPOSE 8443
WORKDIR /home
COPY setup.py .
RUN mkdir service
RUN mkdir service/cert
COPY service/__init__.py service/main.py ./service/
COPY localhost-cert/*.pem ./service/cert/

RUN apt update && apt upgrade -y

RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir --upgrade -e .

CMD uvicorn --app-dir service main:service --host 0.0.0.0 --port 8443 --ssl-keyfile service/cert/key.pem --ssl-certfile service/cert/cert.pem
