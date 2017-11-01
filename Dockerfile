FROM mhart/alpine-node
MAINTAINER mcrotty@tssg.org

RUN apk update && apk add unzip curl python openntpd

# Amazon tools
RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" 
RUN unzip awscli-bundle.zip \
&& ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws 

# User based development environment
RUN npm install -g serverless
RUN addgroup -S app && adduser -s /bin/ash -D -h /home/app -u 1000 -g app -G app app
USER app
WORKDIR /home/app

