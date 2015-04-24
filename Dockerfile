FROM ubuntu:14.04

RUN locale-gen en_US en_US.UTF-8 && \
    dpkg-reconfigure locales

RUN apt-get update && apt-get install -y \
    build-essential \
    git-core \
    python-pip \
    software-properties-common \
  && rm -rf /var/lib/apt/lists/*

RUN pip install virtualenv;

RUN mkdir -p /home/shippable/setup

ADD addBuildDeps.sh /home/shippable/setup/addBuildDeps.sh
RUN /bin/bash  /home/shippable/setup/addBuildDeps.sh

CMD ["/bin/bash"]
