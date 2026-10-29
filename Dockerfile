# syntax = docker/dockerfile:1

FROM registry.docker.com/library/ruby:3.2-slim-bookworm

WORKDIR /rails

ENV RAILS_ENV="production" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development:test" \
    RAILS_SERVE_STATIC_FILES="true" \
    SECRET_KEY_BASE="96f9c9b5d4b8e23f1a0e8d7c6b5a4f3e2d1c0b9a8f7e6d5c4b3a2f1e0d9c8b7a"

COPY Gemfile Gemfile.lock ./
COPY vendor/cache vendor/cache

RUN bundle config set --local without 'development test' && \
    bundle install --local

COPY . .

RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile && \
    useradd -u 1000 rails --create-home --shell /bin/bash && \
    chown -R 1000:1000 db log storage tmp

USER 1000

ENTRYPOINT ["/rails/bin/docker-entrypoint"]

EXPOSE 3000
CMD ["./bin/rails", "server", "-b", "0.0.0.0", "-p", "3000", "-u", "webrick"]

















