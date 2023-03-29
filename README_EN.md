# Snell Server Docker Image

[中文](README.md) ｜ English

## Usage

### Start Container

#### Default Config

Start Snell Server Docker container using the following command:

```bash
docker run -d \
  --name snell-server \
  --network host \
  -v /path/to/snell:/snell \
  your-dockerhub-username/snell-server
```

The `--network host` parameter uses host network mode so that Snell Server can directly use the host's IP address and port number. The `-v /path/to/snell:/snell` parameter maps the `/snell` directory inside the container to the `/path/to/snell` directory on the host so that you can modify the Snell Server configuration file.

By default, Snell Server listens on port `54454`, uses the PSK password `xxxbrianSnellServer`, and IPv6 is not enabled.

#### Customize Config

Start Snell Server Docker container using the following command:

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

The `--network host` parameter uses host network mode so that Snell Server can directly use the host's IP address and port number. The `-v /path/to/snell:/snell` parameter maps the `/snell` directory inside the container to the `/path/to/snell` directory on the host so that you can modify the Snell Server configuration file. The `-e` parameter is used to set environment variables, where `SNELL_PORT` sets the port number that Snell Server listens on, `SNELL_PSK` sets the PSK password that Snell Server uses, and `SNELL_IPV6` sets whether IPv6 is enabled. Here, yourport and yourpassword are the port number and password you want to use, respectively, and IPv6 is disabled by default.

### Configuration File

The Snell Server Docker image has a default configuration file `snell-server.conf`, which is located in the `/path/to/snell` directory. You can modify the port and PSK parameters of the configuration file using a text editor such as vim on the host. For example:

```bash
vim /path/to/snell/snell-server.conf
```

After the modification is completed, you can use the following command to restart the container to make the modified configuration file take effect:

```bash
docker restart snell-server
```

### View Logs

To view the running logs of Snell Server, you can use the following command:

```bash
docker logs -f snell-server
```

The command outputs the log information of the Snell Server container in real-time (follow mode). You can use Ctrl + C to terminate the real-time output.

### Connect to Proxy

Use a client software that supports the Snell protocol, such as Surge, Quantumult, etc., to connect to Snell Server. In the client, you need to specify the IP address and port number of Snell Server, as well as the PSK password.
