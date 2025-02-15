FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/Append/Append.zip
RUN unzip Append.zip
RUN mv Append/* .
RUN rm -rf Append Append.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
