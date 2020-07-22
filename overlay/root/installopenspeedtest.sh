#!/bin/sh
########################################################################
# Type: Installation file for shirosaidevÂ´s Diskover
# ----------------------------------------------------------------------
# Summary: Batch file to run inside a Jail @ FreeNAS or FreeBSD
# ----------------------------------------------------------------------
# Warning: I have NOT tighten the security of the jail
# ----------------------------------------------------------------------
# Description:
#    This is installes all Elasticsearch 5.6 , Redis 4.x , Python 3.7
#    with required modules , and PHP 7.2 with extenshions, and modules.
#    It also creates a Nginx webserver for the diskover-web module. 
#    You must run #pkg install bash and use bash to run the script.
#    
#    diskover is written and maintained by Chris Park (shirosai) 
#    and runs on Linux and OS X/macOS using Python 2/3.
#    
#    This sh file for FreeBSD is made by Andreas M Aanerud ( Aanerud )
# ----------------------------------------------------------------------
# changelist:
#    2019/02/18: 1st version
########################################################################

# Installing Nginx
    clear
    echo '--------------------------------------------------------------------------------'
    echo ' INSTALLING  Nginx'
    echo '--------------------------------------------------------------------------------'
    echo
    #pkg install -y nginx
    mv /usr/local/etc/nginx/nginx.conf /usr/local/etc/nginx/nginx.conf.bak
     echo "
#user  nobody;
worker_processes  auto;
events {
    worker_connections  2024;
}
http {
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;
    server {

        listen   8080;
        listen   3000;
        root /root/www/
        index index.html;
        server_name localhost;

        location / {
            access_log off;
            gzip off;
            fastcgi_read_timeout 999;
            client_max_body_size 9999M;
            log_not_found  off;
            server_tokens off;
            error_page  405     =200 $uri;
            error_log /dev/null;
            tcp_nodelay on;
            tcp_nopush on;
            sendfile on;
            open_file_cache max=200000 inactive=20s;
            open_file_cache_valid 30s;
            open_file_cache_min_uses 2;
            open_file_cache_errors on;

if ($http_origin ~* (https?://[^/]*\.openspeedtest\.com(:[0-9]+)?|https?://openspeedtest\.com(:[0-9]+)?)) {
        add_header 'Access-Control-Allow-Origin' "$http_origin" always;
        add_header 'Access-Control-Allow-Headers' 'Accept,Authorization,Cache-Control,Content-Type,DNT,If-Modified-Since,Keep-Alive,Origin,User-Agent,X-Mx-ReqToken,X-Requested-With' always;
        add_header 'Access-Control-Allow-Methods' 'GET, POST, OPTIONS' always;
         
    }

if ($request_method = OPTIONS ) {
        add_header Access-Control-Allow-Credentials "true";
        add_header 'Access-Control-Allow-Headers' 'Accept,Authorization,Cache-Control,Content-Type,DNT,If-Modified-Since,Keep-Alive,Origin,User-Agent,X-Mx-ReqToken,X-Requested-With' always;
        add_header 'Access-Control-Allow-Origin' "$http_origin" always;        
        add_header Access-Control-Allow-Methods "GET, POST, OPTIONS" always;
        return 204;
            }

             
            
    
        }
}

}
" >> /usr/local/etc/nginx/nginx.conf


  echo 'nginx_enable="YES"' >> /etc/rc.conf
    # Start services
    service nginx start