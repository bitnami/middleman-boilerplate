FROM bitnami/ruby:2.3
LABEL maintainer "Bitnami Team <webdev@bitnami.com>"

# Install nodejs and yarn
RUN install_packages gnupg
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    install_packages nodejs yarn

# Ruby base template
COPY Gemfile* package.json yarn.lock /app/
WORKDIR /app

# Install all the dependencies
RUN bundle install
RUN yarn install

CMD ["middleman", "server"]
