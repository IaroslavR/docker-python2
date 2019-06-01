# docker-python2

Our CI python. Modification of [docker-python27-pandas](https://github.com/serebrov/docker-python27-pandas)

#### How to build

1. Copy requirements from application to `requirements.txt`
1. **bump image version in `.env` file**
1. `make` 
As result on dockerhub will be pushed image with **2** tags: TAG from `.env` and `latest`
1. It may turn out that the our `CI server` has run out of space. If this happens - delete old docker images: `make clean`

#### links
* https://blog.realkinetic.com/building-minimal-docker-containers-for-python-applications-37d0272c52f3
* https://www.codacy.com/blog/five-ways-to-slim-your-docker-images/
* https://blog.onebar.io/reducing-docker-image-size-using-multi-stage-build-4ec8ee111aae
* https://semaphoreci.com/blog/2016/12/13/lightweight-docker-images-in-5-steps.html


* https://pythonspeed.com/articles/faster-multi-stage-builds/
* https://pythonspeed.com/articles/multi-stage-docker-python/
* https://vsupalov.com/cache-docker-build-dependencies-without-volume-mounting/

* https://vsupalov.com/docker-latest-tag/
