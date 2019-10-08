FROM nginx
RUN mkdir /app
COPY /webpage/dist /app
COPY nginx-def.conf /etc/nginx/nginx.conf