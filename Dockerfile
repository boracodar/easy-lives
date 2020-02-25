FROM ruby:2.6.3-alpine

ARG APP_DIR=/usr/src/app/

RUN apk update && apk upgrade && \
  apk add bash build-base libxml2-dev libxslt-dev curl yarn postgresql-libs postgresql-client postgresql-dev tzdata && \
  apk upgrade --available && \
  rm -rf /var/cache/apk/*

RUN mkdir -p $APP_DIR

WORKDIR $APP_DIR

COPY Gemfile* $APP_DIR

RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

COPY package.json $APP_DIR
COPY yarn.lock $APP_DIR

RUN yarn install --production && \
  yarn install --check-files

COPY . $APP_DIR
