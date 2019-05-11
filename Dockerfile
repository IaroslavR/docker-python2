#FROM python:2.7.15-slim as base
FROM iarruss/python2:latest

#FROM iarruss/python2 as builder

LABEL maintainer="<iarruss@ya.ru>"
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
        gfortran \
        # needed for shapely
        libgeos-c1v5 libgeos-dev \
        libpq-dev \
        libblas-dev liblapack-dev \
        default-libmysqlclient-dev \
        python-dev git g++ \
        libtiff5-dev libjpeg62-turbo zlib1g-dev \
        libfreetype6-dev liblcms2-dev libwebp-dev \
        libharfbuzz-dev libfribidi-dev tcl8.6-dev \
        tk8.6-dev python-tk build-essential\
    && apt-get purge -y \
    && apt-get autoremove -y \
    && pip install --upgrade pip

#COPY requirements.txt /requirements.txt
#RUN pip install --install-option="--prefix=/install" -r /requirements.txt
#
#FROM python:2.7.15-slim
#COPY --from=builder /install /usr/local

