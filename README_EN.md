# Snell Server Docker Image

[中文](README.md) ｜ English

## Usage

### Start Container

Start Snell Server Docker container using the following command:

```bash
docker run -d \
  --name snell-server \
  --network host \
  -v /path/to/snell:/snell \
  xxxbrian/snell-server
```

The --network host parameter uses host network mode so that Snell Server can directly use the host's IP address and port number. The -v /path/to/snell:/snell parameter maps the /snell directory inside the container to the /path/to/snell directory on the host so that you can modify the Snell Server configuration file.

### Configuration File

The Snell Server Docker image has a default configuration file config.sjson, which is located in the /path/to/snell directory. You can modify the port and PSK parameters of the configuration file using a text editor such as vim on the host. For example:


```bash
vim /path/to/snell/config.sjson
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