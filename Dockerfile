FROM ruby:2.7.1-buster

RUN apt-get update \
 && apt-get install -y --no-install-recommends \
      build-essential \
      curl \
      gnupg gnupg1 gnupg2 \
      imagemagick \
      ghostscript \
      default-libmysqlclient-dev \
      vim \
      less \
      git

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
 && apt install -y --no-install-recommends nodejs

WORKDIR /myapp
