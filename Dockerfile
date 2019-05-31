FROM python:2.7
LABEL maintainer=<iarruss@ya.ru>
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       gfortran \
       libgeos-c1v5 \
       libgeos-dev \
       libpq-dev \
       libblas-dev \
       liblapack-dev \
       default-libmysqlclient-dev \
       python-dev \
       libffi-dev libssl-dev
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
