# docker-python2

Our CI python. Modification of [docker-python27-pandas](https://github.com/serebrov/docker-python27-pandas)

#### How to build

1. Copy requirements from application
2. `push` changes
3. Go to [dockerhub](https://hub.docker.com/r/iarruss/docker-python2/~/settings/automated-builds/) and trigger automated build
4. Optional: set tag to latest created image
5. It may turn out that the our `CI server` has run out of space. If this happens - delete old docker images

#### How to set additional tag to `latest` image:

```bash
docker pull iarruss/docker-python2:latest
docker images
docker tag <hash-of-latest> iarruss/docker-python2:<new-tag>
docker push iarruss/docker-python2:<new-tag>
``` 
