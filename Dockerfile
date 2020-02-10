FROM ruby:2.6

LABEL maintainer="venkat.bitla@gmail.com"

# Set up Linux
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && \
  apt-get install -qq -y build-essential libpq-dev nodejs yarn

RUN mkdir /byndr
WORKDIR /byndr

# Copy Gem files
COPY Gemfile /byndr/Gemfile
COPY Gemfile.lock /byndr/Gemfile.lock

# Bundle Install
RUN bundle config --delete bin
RUN gem list bundler
RUN gem install bundler -v 2.0.2
RUN gem list bundler
RUN bundle install

COPY . /byndr

# Yarn Install
# RUN npm install -g yarn
RUN yarn install --check-files


EXPOSE 3000

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]