# Snell Server Docker Image

中文 ｜ [English](README_EN.md)

## 使用说明

### 启动容器

启动 Snell Server Docker 容器，使用以下命令：

```bash
docker run -d \
  --name snell-server \
  --network host \
  -v /path/to/snell:/snell \
  xxxbrian/snell-server
```

其中，`--network host` 参数使用宿主机网络模式，以便 Snell Server 可以直接使用主机的 IP 地址和端口号。`-v /path/to/snell:/snell` 参数将容器内的 `/snell` 目录映射到宿主机的 `/path/to/snell` 目录，以便可以修改 Snell Server 的配置文件。

### 配置文件

Snell Server Docker 镜像已经预制了一个默认配置文件 `config.sjson`，该配置文件位于 `/path/to/snell` 目录中，可以在宿主机上使用 `vim` 等文本编辑器修改该文件的端口和 PSK 等参数。例如：

```bash
vim /path/to/snell/config.sjson
```

修改完成后，可以使用以下命令重新启动容器，使修改的配置文件生效：

```bash
docker restart snell-server
```

### 查看日志

要查看 Snell Server 的运行日志，可以使用以下命令：

```bash
docker logs -f snell-server
```

该命令将以实时（follow）模式输出 Snell Server 容器的日志信息。可以使用 `Ctrl + C` 终止实时输出。

### 连接代理

使用支持 Snell 协议的客户端软件，例如 Surge、Quantumult 等，连接到 Snell Server。在客户端中，需要指定 Snell Server 的 IP 地址和端口号，以及 PSK 密码。

