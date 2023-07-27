FROM debian:bullseye

# intalling nginx and openssl (for the SSL certificate)
RUN apt-get update && apt-get install -y nginx openssl

# Generates a self-signed SSL certificate and key using OpenSSL.
# The certificate and key are stored in the /etc/nginx/ssl/ directory
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/mvomiero.crt \
    -keyout /etc/nginx/ssl/mvomiero.key \
    -subj "/C=DE/ST=Berlin/L=Berlin/O=42 School/OU=mvomiero/CN=mvomiero/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

# Expose the only port allowed
EXPOSE 443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
