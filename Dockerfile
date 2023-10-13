FROM python:3.9-slim-bullseye

WORKDIR /home
COPY setup.py .
RUN mkdir service
COPY service/__init__.py service/main.py ./service/

RUN apt update && apt upgrade -y

RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir --upgrade -e .

CMD uvicorn --app-dir service main:service --host 0.0.0.0 --port 8001
