
FROM ebspace/armhf-debian:latest

MAINTAINER Hao Tseng "ebspace@gmail.com"

ENV CERTBOT_DIR /certbot

# Install Let's Encrypt CERTBOT
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends wget openssl ca-certificates && \
    mkdir -p ${CERTBOT_DIR} && \
    (cd ${CERTBOT_DIR}; wget https://dl.eff.org/certbot-auto; chmod +x certbot-auto) && \
    ${CERTBOT_DIR}/certbot-auto --no-self-upgrade --noninteractive --os-packages-only && \
    ${CERTBOT_DIR}/certbot-auto --no-self-upgrade --noninteractive --version && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


VOLUME /etc/letsencrypt
VOLUME /var/lib/letsencrypt
VOLUME /var/log/letsencrypt

EXPOSE 443 80

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD [""]


