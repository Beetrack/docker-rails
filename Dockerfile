FROM ubuntu:14.04
MAINTAINER Andres Colonia "andreskal@gmail.com"

RUN locale-gen en_US.UTF-8

ENV HOME /root
ENV PATH $HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH
ENV SHELL /bin/bash
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt-get -y update

# install ruby dependencies
RUN apt-get -y install git curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

# install nginx
# RUN apt-get -y install nginx

# install mysql dev
RUN apt-get -y install libmysqlclient-dev

RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build

RUN echo 'eval "$(rbenv init -)"' >> $HOME/.profile
RUN echo 'eval "$(rbenv init -)"' >> $HOME/.bashrc

RUN rbenv install 2.1.5
RUN rbenv global 2.1.5

RUN gem install rails -v 4.0.11

# exucete rails server
#CMD ["rails", "server", "-b", "0.0.0.0"]
