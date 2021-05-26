FROM        nginx:latest

COPY        ./nginx/index.html /usr/share/nginx/html/index.html
COPY        ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY        ./nginx/default.conf /etc/nginx/conf.d/default.conf.template

COPY        ./scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN         chmod +x /usr/local/bin/entrypoint.sh

EXPOSE      80
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["bash", "-c"]


