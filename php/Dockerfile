FROM alpine:edge
RUN apk add --no-cache \
    git \
    mercurial \
    py-pygments \
    py3-setuptools \
    php7-mcrypt \
    php7-json \
    php7-dom \
    php7-pdo \
    php7-zip \
    php7-mysqli \
    php7-bcmath \
    php7-gd \
    php7-odbc \
    php7-pdo_mysql \
    php7-gettext \
    php7-bz2 \
    php7-iconv \
    php7-curl \
    php7-ctype \
    php7-session \
    php7-memcached \
    php7-mbstring \
    php7-opcache \
    php7-apcu \
    php7-fileinfo \
    php7-pcntl \
    php7-posix \
    php7-fpm \
    php7
RUN apk add --no-cache py2-pip && \
    pip install --no-cache hg-evolve==8.0.1 && \
    apk del py2-pip
# test that pygmentize works
RUN pygmentize -h
COPY hgrc /etc/mercurial/hgrc
RUN sed -i "s@;error_log =.*@error_log = /dev/stderr@g" /etc/php7/php-fpm.conf
ARG UID=1000
ARG GID=1000
RUN addgroup -g $GID php
RUN adduser -s /bin/ash -G php -u $UID -D -H -h /src/phabricator php
RUN install -o php -d /src/phabricator
COPY phd /usr/local/bin/phd
RUN chmod +x /usr/local/bin/phd
USER php
EXPOSE 9000/tcp
CMD ["/usr/sbin/php-fpm7", "--nodaemonize", "--force-stderr"]
