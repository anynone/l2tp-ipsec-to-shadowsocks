#!/bin/sh
 
# template out all the config files using env vars


sed -i 's/right=.*/right='$VPN_SERVER_IPV4'/' /etc/ipsec.conf
echo ': PSK "'$VPN_PSK'"' > /etc/ipsec.secrets
sed -i 's/lns = .*/lns = '$VPN_SERVER_IPV4'/' /etc/xl2tpd/xl2tpd.conf
sed -i 's/name .*/name '$VPN_USERNAME'/' /etc/ppp/options.l2tpd.client
sed -i 's/password .*/password '$VPN_PASSWORD'/' /etc/ppp/options.l2tpd.client

# startup ipsec tunnel
ipsec initnss
sleep 1
ipsec pluto --stderrlog --config /etc/ipsec.conf
sleep 5
#ipsec setup start
#sleep 1
#ipsec auto --add L2TP-PSK
#sleep 1
ipsec auto --up L2TP-PSK
sleep 3
ipsec --status
sleep 3

# startup xl2tpd ppp daemon then send it a connect command
(sleep 7 && echo "c myVPN" > /var/run/xl2tpd/l2tp-control) & \
(echo "wait start ss,modify route\n" && sleep 10 && \
route add -host $VPN_SERVER_IPV4 gw 172.17.0.1 dev eth0 && \
route del default && \
route add default gw 1.0.0.1 && \
echo "`sed 's/nameserver.*/nameserver 1.0.0.1/g' /etc/resolv.conf`" > /etc/resolv.conf && \
echo "route ready\n" && \
/usr/bin/ssserver -k $SS_PASSWORD && \
iptables -I INPUT -p tcp --dport 8388 -j ACCEPT
) & \
exec /usr/sbin/xl2tpd -p /var/run/xl2tpd.pid -c /etc/xl2tpd/xl2tpd.conf -C /var/run/xl2tpd/l2tp-control -D