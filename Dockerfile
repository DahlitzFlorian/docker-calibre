FROM python:3.7.2-alpine

RUN mkdir /calibre

RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin install_dir=/calibre isolated=y

ENV PATH="/calibre/calibre:${PATH}"

LABEL maintainer="Florian Dahlitz <f2dahlitz@freenet.de>" \
      version="1.0.1"
