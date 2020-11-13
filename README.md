当前项目将l2tp-ipsec代理转换为shadowsocks代理,如果你不想vpn全局代理网络请求，那么这个项目适合你

1. #### 构建容器
```shell
   docker build -t anynone/l2tp-ipsec-to-shadowsocks:1.0 .
   
```
2. #### 环境变量
    - VPN_SERVER_IPV4 l2tp-ipsec代理地址
    - VPN_PSK psk密码
    - VPN_USERNAME vpn用户名
    - VPN_PASSWORD vpn密码
    - SS_PASSWORD ss服务密码,默认123456
    - SS_SERVER_PORT ss服务端口,默认8388
    - SS_METHOD ss通信加密方式，默认aes-256-cfb
3. #### 启动
    ```bash

        docker run --rm -it --privileged \
                -host \  ### 使用本机网络,端口绑定自动映射
                -e VPN_SERVER_IPV4='请填写' \
                -e VPN_PSK='请填写' \
                -e VPN_USERNAME='请填写' \
                -e VPN_PASSWORD='请填写' \
                -e SS_PASSWORD='请填写' \
                -e SS_SERVER_PORT='8388' \
                anynone/l2tp-ipsec-to-shadowsocks:1.0
    ```
4. 连接
如果是host网络，使用ss连接本机端口即可，如果非host网络， docker inspect 容器id查看容器地址，或绑定宿主机端口