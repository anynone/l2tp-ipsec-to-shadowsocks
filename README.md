1. 构建容器 docker build .

2. 修改run_docker.sh， 修改l2tp代理地址，帐号密码，build出的镜像id

3. 执行run_docker.sh

4. 默认项目
```bash
ss端口: 8388
ss加密算法: aes-256-cfb
连接地址: docker inspect 容器ip查看容器ip地址，或者docker run开启容器增加--host参数，将绑定到127.0.0.1
```