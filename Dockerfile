FROM ruby:3.2
ENV RAILS_ENV=production RACK_ENV=production BUNDLER_VERSION=2.4.22
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs yarn
WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN gem install bundler -v "$BUNDLER_VERSION" && bundle install
COPY . .
RUN bundle exec rake assets:precompile
RUN bundle exec rake db:migrate
CMD ["rails", "server", "-b", "0.0.0.0"]
