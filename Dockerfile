FROM nvidia/cuda:12.6.1-cudnn-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y python3.11-dev python3.11-venv python3-setuptools git

RUN python3.11 -m venv /app-venv

RUN /app-venv/bin/pip install torch

COPY setup.py /app/
COPY tinychat /app/tinychat/
COPY extra /app/extra/
COPY format.py /app/
COPY main.py /app/
COPY exo/ /app/exo/

RUN /app-venv/bin/pip install /app/

COPY container-entrypoint.sh /app/

EXPOSE 8000

WORKDIR /app
CMD [ "./container-entrypoint.sh" ]

