FROM phusion/baseimage
MAINTAINER Andrzej Marcinkowski "andrzej.marcinkowski@gmail.com"

ARG GITHUB_OAUTH_TOKEN
ARG DOCKER

RUN apt-get update
RUN apt-get install -y git

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /vagrant/repo
RUN git clone https://github.com/hospitalhub/hospitalpage

RUN /bin/bash -c "sudo rm -rf /var/www; ln -s /var/vagrant/hospitalpage /var/www"
RUN /bin/bash -c "cd hospitalpage && source resources/.env.bash && source scripts/install-server.sh"
RUN /bin/bash -c "cd hospitalpage && source scripts/install-server.sh"
RUN /bin/bash -c "cd hospitalpage && source scripts/install-dependencies.sh $GITHUB_OAUTH_TOKEN"
USER vagrant
ADD /home/vagrant
RUN /bin/bash -c "sudo rm -rf /var/www; sudo ln -s /home/vagrant/hospitalpage /var/www"
RUN /bin/bash -c "sudo cp /var/www/resources/.env /var/www"
RUN /bin/bash -c "source hospitalpage/scripts/install-wp-cli.sh"
RUN /bin/bash -c "cd /var/www && source scripts/install-wp-all.sh"
RUN /bin/bash -c "cd /var/www && source scripts/install-db.sh"

EXPOSE 80

RUN ls -la /
RUN ls -la /home
