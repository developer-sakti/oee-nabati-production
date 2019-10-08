FROM nginx

ADD nginx-def.conf /etc/nginx/conf.d/default.conf

COPY /apiserver/public /var/www/public

# COPY /mobilepage /mobilepage