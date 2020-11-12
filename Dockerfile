FROM ubergarm/l2tp-ipsec-vpn-client

COPY startup.sh  /
COPY resolv.conf /etc/resolv.conf
RUN chmod +x /startup.sh && \
    apk update \
    && apk add py-pip \
    && pip install shadowsocks
