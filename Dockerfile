FROM ruby:2.6.5

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

WORKDIR /usr/src/app
COPY Gemfile ./
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN bundle config set --local path 'vendor/cache'
RUN bundle
COPY . .
RUN rails db:migrate RAILS_ENV=development
EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]