FROM alpine:3.8
RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils
ARG UID=1000
ARG GID=1000
RUN sed -i "s@^mysql.*@mysql:x:$UID:$GID:mysql:/var/lib/mysql:/sbin/nologin@" /etc/passwd
RUN sed -i "s@^mysql.*@mysql:x:$GID:mysql@" /etc/group
RUN install -o mysql -g mysql -d /run/mysqld
RUN install -o mysql -g mysql -d /etc/mysql/conf.d
RUN chown -R mysql:mysql /etc/mysql /var/lib/mysql
RUN echo "!includedir /etc/mysql/conf.d/" >> /etc/mysql/my.cnf
COPY start.sh /start.sh
RUN chmod +x /start.sh
USER mysql
WORKDIR /var/lib/mysql
EXPOSE 3306/tcp
CMD ["/start.sh"]
