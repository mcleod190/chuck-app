# syntax = docker/dockerfile:1

ARG RUBY_VERSION=3.2-alpine
FROM registry.docker.com/library/ruby:$RUBY_VERSION

WORKDIR /rails

ENV RAILS_ENV="production" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test" \
    RAILS_SERVE_STATIC_FILES="true" \
    SECRET_KEY_BASE="96f9c9b5d4b8e23f1a0e8d7c6b5a4f3e2d1c0b9a8f7e6d5c4b3a2f1e0d9c8b7a"

RUN apk add --no-cache build-base postgresql-dev tzdata bash curl libpq

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile

RUN adduser -D -u 1000 rails && \
    chown -R 1000:1000 db log storage tmp
USER 1000

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server"]



