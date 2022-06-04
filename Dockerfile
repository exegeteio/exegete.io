FROM ruby:3.1.2-bullseye

ENV BINDING=0.0.0.0
ENV PORT=3000

WORKDIR /app
COPY Gemfile* /app
RUN bundle install --quiet -j4

COPY ./ /app

EXPOSE 3000
CMD ["bundle", "exec", "jekyll", "s", "--port=3000", "--host=0.0.0.0"]
