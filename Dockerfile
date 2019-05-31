ARG BASE_IMAGE
FROM $BASE_IMAGE
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
       libffi-dev libssl-dev \
       # for build
       git g++ \
       libtiff5-dev libjpeg62-turbo zlib1g-dev \
       libfreetype6-dev liblcms2-dev libwebp-dev \
       libharfbuzz-dev libfribidi-dev tcl8.6-dev \
       tk8.6-dev python-tk build-essential
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
