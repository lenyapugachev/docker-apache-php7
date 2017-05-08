FROM ubuntu
MAINTAINER Lenya Pugachev <lenyapugachev@me.com>

VOLUME ["/var/www"]

RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      apache2 \
      php7.0 \
      php7.0-cli \
      libapache2-mod-php7.0 \
      php7.0-gd \
      php7.0-dom \
      php7.0-json \
      php7.0-ldap \
      php7.0-mbstring \
      php7.0-mcrypt \
      php7.0-curl \
      php7.0-xml \
      php7.0-xsl \
      php7.0-zip \
      php7.0-soap

COPY apache_default /etc/apache2/sites-available/000-default.conf
COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

EXPOSE 443
CMD ["/usr/local/bin/run"]
