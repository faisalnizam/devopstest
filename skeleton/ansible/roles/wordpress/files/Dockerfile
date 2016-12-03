FROM ubuntu:16.04

ENV DEBIAN_FRONTEND=noninteractive

EXPOSE 80

RUN  apt-get -qq update && \
     apt-get install -y \
     wget \
     php \
     php-curl \
     php-dom \
     php-fpm \
     php-mysql \
     php-mcrypt \
     nginx  \
     nano \
     curl \
     net-tools \
     mysql-server \
     supervisor \
     mysql-client && \
     mkdir -p /opt/rainloop/logs && \
     rm /etc/nginx/sites-enabled/default && \
     rm /etc/nginx/sites-available/default && \
     usermod -d /var/lib/mysql mysql


COPY conf/www.conf /etc/nginx/sites-available/default


WORKDIR /opt/rainloop

RUN  wget  -qO- http://repository.rainloop.net/installer.php | php

COPY conf/application.ini /opt/rainloop/data/_data_/_default_/configs/
COPY conf/app.conf /etc/supervisor/conf.d
COPY domains/*.ini /opt/rainloop/data/_data_/_default_/domains/

RUN  ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default && \
     find . -type d -exec chmod 755 {} \; && \
     find . -type f -exec chmod 644 {} \; && \
     chown www-data:www-data -R /opt/rainloop && \
     /etc/init.d/mysql start && \
     mysql -uroot -e 'create database rainloop' && \
     /etc/init.d/php7.0-fpm start && \
     /etc/init.d/nginx start && \
     curl http://localhost && \
     /etc/init.d/mysql stop && \
     /etc/init.d/php7.0-fpm stop && \
     /etc/init.d/nginx stop && \
     sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.0/fpm/php-fpm.conf

CMD /usr/bin/supervisord
