FROM ruby:2.6.6-buster

RUN apt update && apt install -y -qq --no-install-recommends software-properties-common build-essential

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y yarn

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock package* yarn* ./
RUN yarn install --check-files
RUN gem install bundler && bundle install

COPY . .
