FROM amazonlinux

WORKDIR /work

RUN set -x && \
    yum -y install yum-plugin-fastestmirror && \
    yum -y update && \
    yum install -y python27-devel python27-pip gcc gcc-c++ cmake && \
    yum install -y libtiff-devel libjpeg-devel libzip-devel freetype-devel \
      lcms2-devel libwebp-devel tcl-devel tk-devel && \
    pip install --upgrade pip
