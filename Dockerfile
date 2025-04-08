FROM nginx:latest

COPY . /src/nginx/html/

EXPOSE 80
