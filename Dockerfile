FROM nginx:alpine

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add openjdk8 subversion
ADD statsvn/dist/statsvn.jar  /app/
ADD docker-cron /var/spool/cron/crontabs/root
ADD docker-start.sh /docker-entrypoint.d/
RUN chmod +x /docker-entrypoint.d/docker-start.sh
ADD docker-index.html /usr/share/nginx/html/index.html
ADD docker-statsvn-functions.sh /app/statsvn-functions.sh
ADD docker-statsvn.sh /app/statsvn.sh
RUN chmod +x /app/*.sh
