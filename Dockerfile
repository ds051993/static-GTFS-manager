FROM python:3.9-slim-bullseye

RUN apt-get update && \
    apt-get install -y python3-pip libhdf5-dev build-essential && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app
COPY . /app/

RUN pip3 install --upgrade pip

RUN pip3 install -r requirements.txt --user

EXPOSE 5000

CMD cd /app/ && python3 GTFSManager.py
