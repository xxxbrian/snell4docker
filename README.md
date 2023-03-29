# Snell Server Docker Image

中文 ｜ [English](README_EN.md)

## 使用说明

### 启动容器

#### 默认参数配置

启动 Snell Server Docker 容器，使用以下命令：

```bash
docker run -d \
  --name snell-server \
  --network host \
  -v /path/to/snell:/snell \
  xxxbrian/snell-server
```

其中，`--network host` 参数使用宿主机网络模式，以便 Snell Server 可以直接使用主机的 IP 地址和端口号。`-v /path/to/snell:/snell` 参数将容器内的 `/snell` 目录映射到宿主机的 `/path/to/snell` 目录，以便您可以修改 Snell Server 的配置文件。

默认情况下，Snell Server 监听的端口号为 `54454`，使用的 PSK 密码为 `xxxbrianSnellServer`，IPv6 功能未启用。

#### 手动参数配置

启动 Snell Server Docker 容器，使用以下命令：

```bash
docker run -d \
  --name snell-server \
  --network host \
  -v /path/to/snell:/snell \
  -e SNELL_PORT=yourport \
  -e SNELL_PSK=yourpassword \
  -e SNELL_IPV6=false \
  your-dockerhub-username/snell-server
```

其中，`--network host` 参数使用宿主机网络模式，以便 Snell Server 可以直接使用主机的 IP 地址和端口号。`-v /path/to/snell:/snell` 参数将容器内的 `/snell` 目录映射到宿主机的 `/path/to/snell` 目录，以便您可以修改 Snell Server 的配置文件。`-e` 参数用于设置环境变量，其中 `SNELL_PORT` 设置 Snell Server 监听的端口号，`SNELL_PSK` 设置 Snell Server 使用的 PSK 密码，`SNELL_IPV6` 设置是否启用 IPv6。这里，`yourport` 和 `yourpassword` 分别为您想要使用的端口号和密码，IPv6 功能默认未启用。

### 配置文件

> 如果您使用了手动参数配置，可能不需要修改配置文件。

Snell Server Docker 镜像已经预制了一个默认配置文件 `snell-server.conf`，该配置文件位于 `/path/to/snell` 目录中，可以在宿主机上使用 `vim` 等文本编辑器修改该文件的端口和 PSK 等参数。例如：

```bash
vim /path/to/snell/snell-server.conf
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
