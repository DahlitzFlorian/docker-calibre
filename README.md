# Docker Calibre #
## Description ##
Contains a Dockerfile generating an image installing [calibre](https://calibre-ebook.com/about) in an alpine environment.

version 1.0.0

## Usage ##
The docker image is pushed to [Docker Hub](https://cloud.docker.com/repository/registry-1.docker.io/floriandahlitz/docker-calibre), so you can use it as base image as follows:

```Dockerfile
FROM floriandahlitz/docker-calibre
```