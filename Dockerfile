ARG BASE_IMAGE
FROM $BASE_IMAGE AS compile-image
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
       # for build from slim image
       git g++ \
       libtiff5-dev libjpeg62-turbo zlib1g-dev \
       libfreetype6-dev liblcms2-dev libwebp-dev \
       libharfbuzz-dev libfribidi-dev tcl8.6-dev \
       tk8.6-dev python-tk build-essential
ENV PATH=/root/.local/bin:$PATH
COPY requirements.txt /tmp/requirements.txt
RUN pip install --user -r /tmp/requirements.txt
COPY requirements-new.txt /tmp/requirements-new.txt
RUN pip install --user -r /tmp/requirements-new.txt
ENV PYTHONPATH=/opt/project:$PYTHONPATH


ARG BASE_IMAGE
FROM $BASE_IMAGE AS build-image
LABEL maintainer=<iarruss@ya.ru>
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libgeos-c1v5 \
        default-libmysqlclient-dev \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/
COPY --from=compile-image /root/.local /root/.local
ENV PATH=/root/.local/bin:$PATH
ENV PYTHONPATH=/opt/project:$PYTHONPATH
