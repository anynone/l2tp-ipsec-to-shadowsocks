docker run --rm -it --privileged \
           -e VPN_SERVER_IPV4='{proxy ip}' \
           -e VPN_PSK='vpn' \
           -e VPN_USERNAME='vpn' \
           -e VPN_PASSWORD='vpn' \
           -e SS_PASSWORD='*mm5wd1a' \
              40627a1bb82c