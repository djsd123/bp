FROM alpine:latest

RUN echo "http://dl-4.alpinelinux.org/alpine/latest-stable/main/" >> /etc/apk/repositories && \
    apk add --update nginx && \
    rm -rf /var/cache/apk/* && \
    mkdir /www && \
    chown -R nginx /www

ADD nginx.conf /etc/nginx/nginx.conf
ADD hello_world.conf /etc/nginx/conf.d/hello_world.conf
ADD index.html /www/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
