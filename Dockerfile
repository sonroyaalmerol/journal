from ruby:3.1.2

RUN apt update && apt install -y nodejs

RUN gem update --system
RUN gem install bundler

RUN mkdir /app
WORKDIR /app

ENV RAILS_SERVE_STATIC_FILES 1
ENV RAILS_LOG_TO_STDOUT 1

ADD Gemfile Gemfile.lock /app/

RUN bundle update --bundler
RUN bundle install

ADD . /app

RUN bundle exec rake assets:precompile

RUN chmod +x /app/bin/*

RUN mkdir -p tmp/pids

EXPOSE 3000

ENTRYPOINT ["/app/bin/docker-run"]
