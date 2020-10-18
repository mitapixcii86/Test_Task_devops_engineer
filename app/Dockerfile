# FROM ubuntu
# RUN apt-get update
# RUN apt-get install nginx -y
# COPY app/static_website/index.html /var/www/html
# COPY app/static_website/sample.jpeg /var/www/html
# EXPOSE 80
# CMD ["nginx","-g","daemon off;"]
FROM nginx:alpine
ADD .  /usr/share/nginx/html/