FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y \
  nodejs \
  postgresql-client \
  npm \
  tzdata

RUN npm install npm@latest -g && \
  npm install n -g && \
  n latest

RUN npm install --global yarn

WORKDIR /x-disk
COPY . /x-disk/

RUN bundle install

COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD [ "rails", "s", "-b", "0.0.0.0" ]

EXPOSE 3000
