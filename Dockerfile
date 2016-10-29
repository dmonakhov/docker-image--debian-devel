FROM debian

MAINTAINER Dmitry Monakhov <dmonakhov@gmail.com>
####################
# Jenkins-CI build image.

# Image has docker-binary inside so docker.build will also works
####################
##EXAMPLE
# #! groovy
# def ds_opt= '-v /var/run/docker.sock:/var/run/docker.sock';
# docker.image('dmonakhov/debian-devel').inside(ds_opt){
#
#    // build xfstests-blk devel enviroment
#    docker.build('xfstests-bld', 'https://github.com/tytso/xfstests-bld.git')
#  }
####################
# TODO: Remove 'build-essential' and substitude it with more fine grained pkg list
#
RUN apt-get update && \
    echo install avocado def packages && \
    apt-get install -y --no-install-recommends \
	    git \
	    rsync \
	    make \
	    gdebi-core \
	    pkg-config \
	    libvirt-dev \
	    python-dev \
	    python-lzma \
	    python-pip \
	    python-pystache \
	    python-setuptools \
	    python-stevedore  \
	    python-yaml && \
    echo install extra avocado packages && \
    apt-get install -y --no-install-recommends \
	    ansible \
	    emacs-nox \
	    pigz \
	    libzip2 \
	    pxz \
	    wget && \
    ln -f /usr/bin/pigz  /bin/gzip && \
    ln -f /usr/bin/pigz  /usr/bin/gzip && \
    echo install kernel-devel packages && \
    apt-get install -y --no-install-recommends \
	    build-essential \
	    guilt \
	    bc \
	    flex \
	    bison \
	    libc6-dev \
	    libelf-dev \
	    libnuma-dev \
	    liblzma-dev && \
    echo Install docker files && \
    mkdir /tmp/BLD && \
    cd /tmp/BLD && \
    wget  https://get.docker.com/builds/Linux/x86_64/docker-latest.tgz && \
    tar zxvf docker-latest.tgz && \
    mv docker/docker /usr/local/bin/ && \
    echo "Cleanup" && \
    apt-get clean && \
    rm -rf \
       /usr/share/doc /usr/share/doc-base \
       /usr/share/man /usr/share/locale /usr/share/zoneinfo

