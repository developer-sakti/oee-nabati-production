FROM nginx
RUN mkdir /app
COPY /webpage/dist /app
COPY nginx.conf /etc/nginx/nginx.conf