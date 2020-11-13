FROM ubergarm/l2tp-ipsec-vpn-client

COPY startup.sh  /
RUN chmod +x /startup.sh && \
    apk update \
    && apk add py-pip \
    && pip install shadowsocks
