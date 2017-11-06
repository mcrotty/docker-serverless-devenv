FROM ubuntu:16.04 
MAINTAINER mcrotty@tssg.org

RUN apt-get update && apt-get install -y unzip curl python openntpd sudo

# Node v8
RUN curl -sL https://deb.nodesource.com/setup_8.x | /bin/bash -
RUN apt-get install -y build-essential nodejs

# Amazon tools
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" 
RUN unzip awscli-bundle.zip \
&& ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws 

RUN npm install -g serverless
# User based development environment
RUN useradd --shell /bin/bash --home-dir /home/app --create-home --uid 1000 app
USER app
WORKDIR /home/app
EXPOSE 8000

