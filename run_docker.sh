docker run --rm -it --privileged \
           -e VPN_SERVER_IPV4='{proxy ip}' \
           -e VPN_PSK='{psk}' \
           -e VPN_USERNAME='{username}' \
           -e VPN_PASSWORD='{password}' \
           -e SS_PASSWORD='{ss_password}' \
              {container_id}