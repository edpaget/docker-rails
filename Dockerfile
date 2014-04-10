# DOCKER_VERSION 0.9.0
# VERSION 0.1.0

FROM ubuntu:12.04
MAINTAINER Edward Paget <ed@zooniverse.org>

# Setup Apt
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install apt-transport-https ca-certificates
RUN echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger precise main" >> /etc/apt/sources.list
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y -q install nginx-extras passenger supervisor

# Configure nginx
RUN mkdir -p /var/log/supervisor
RUN rm /etc/nginx/sites-enabled/default

ADD config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD config/nginx.conf /etc/nginx/nginx.conf
ADD start_nginx_rails.sh /opt/start_nginx_rails.sh
RUN chmod +x ./opt/start_nginx_rails.sh

VOLUME ["/var/log/nginx", "/var/log/supervisor"]

EXPOSE 80
ENTRYPOINT ["./opt/start_nginx_rails.sh"]
