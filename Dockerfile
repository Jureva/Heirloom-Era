FROM ruby:2.6.5

# throw errors if Gemfile has been modified since Gemfile.lock
#RUN bundle config --global frozen 1

WORKDIR /usr/src/app
COPY Gemfile ./
RUN bundle install
COPY . .
RUN bin/rails db:migrate
RUN bin/rake db:seed
EXPOSE 3000

CMD bin/rails server -b 0.0.0.0 -p 3000