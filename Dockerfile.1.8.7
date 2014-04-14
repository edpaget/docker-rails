# DOCKER_VERSION 0.9.0
# VERSION 0.1.0

FROM edpaget/passenger:latest
MAINTAINER Edward Paget <ed@zooniverse.org>

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install build-essential libsqlite3-dev libcurl3 libxml2 libxslt1-dev libcurl4-gnutls-dev git-core mysql-client libmysqlclient-dev imagemagick libmagickwand-dev memcached

# Build Ruby
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install zlib1g zlib1g-dev wget libyaml-dev bison libssl-dev libreadline6-dev autoconf subversion curl
RUN wget -q -O ruby-1.8.7-p370.tar.gz http://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p370.tar.gz
RUN tar xvf ruby-1.8.7-p370.tar.gz
RUN rm ruby-1.8.7-p370.tar.gz
WORKDIR ruby-1.8.7-p370
RUN ./configure
RUN make
RUN make install

# Install RubyGems
WORKDIR /
RUN wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.22.tgz
RUN tar -xvzf rubygems-1.8.22.tgz
WORKDIR /rubygems-1.8.22
RUN sudo ruby setup.rb
RUN gem update --system 1.7.2

RUN gem install bundler
WORKDIR /rails
ADD Gemfile /rails/Gemfile
ADD Gemfile.lock /rails/Gemfile.lock
ADD /vendor/ /rails/vendor
RUN bundle install --without development test

ADD ./ /rails

WORKDIR /
VOLUME ["/rails/log"]

ENV RACK_ENV production
ENV RAILS_ENV production
ENV VIRTUAL_ENV hubble.galaxyzoo.org

VOLUME ["/rails/log"]

ADD docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD docker/site.conf /etc/nginx/sites-enabled/default

CMD ["-l", "/opt/rails_config/"]

