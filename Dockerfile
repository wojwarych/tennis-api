FROM python:3.10.8-slim-buster

ENV PYTHONFAULTHANDLER=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONHASHSEED=random \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

RUN apt-get update && apt-get upgrade

WORKDIR /app

COPY requirements.txt /app/
RUN pip install -U pip setuptools && pip install -r requirements.txt

COPY ./src /app/
