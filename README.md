# A Better Apache Image for Docker #
[![Docker Hub: ghifari160/apache](https://img.shields.io/badge/docker%20hub-ghifari160%2Fapache-ABD8EB.svg)](https://hub.docker.com/r/ghifari160/ubuntu)
[![](https://images.microbadger.com/badges/image/ghifari160/apache.svg)](https://microbadger.com/images/ghifari160/apache "Get your own image badge on microbadger.com")

This image is not just another Apache 2 image for Docker.

## Why Use This Image ##
By default, Apache runs in the background as a daemon. This default behavior
unnecessarily increased the difficulty to debug an issue during development. As
an insult to the injury, running a Docker container in the foreground does not
change this behavior as Apache runs as a daemon on the operating system level.
**This image forces Apache to run in the foreground and outputs its log into the
container's stdio.**

### Benefits of Running Apache in the Foreground ##
* Apache will respond to `SIGTERM` for a graceful shutdown.
* With some more configuration (configured by default in this image), Apache can
output its logs to the container's stdio for easier debugging.
* Apache may behave similarly to `dev_appserver.py` from Google Cloud Platform's
App Engine (i.e. it will output every connection to stdio).

## Installation ##
By default, this image should be run as a daemon.
```
docker run -d -p 8080:80 ghifari160/apache
```
However, this image may be run in the foreground for debug purposes.
```
docker run -it -p 8080:80 ghifari160/apache
```

### Further Configurations ###
#### Name your container ####
Add this parameter: `--name <name>`  
Example:
```
docker run --name apache -d -p 8080:80 ghifari160/apache
```

#### Run your code from a folder on the host computer ####
Add this parameter `-v /path/on/the/host/computer:/var/www/html`  
Example:
```
docker run -d -p 8080:80 -v /d/workspace/project:/var/www/html ghifari160/apache
```

#### Change the port on your container ####
Use this parameter `-p <port on the host>:80` to map the container's port to
another port on the host computer.  
Example:
```
docker run -d -p 8080:80 ghifari160/apache
```

#### macOS permission fixes
On macOS, shared volumes remains owned by the host user and group. Permissions
on these shared volumes are also determined by the host, unchangeable from
guest. On the home directory, the default owner and permission are
`<user>:staff` and `755`. Apache needs write access to its files and
directories. A workaround is to set the `www-data` UID and GID to `1000` and
`50`. The init script will do this if the value of `G16_MACOS` is `yes`. Use
the parameter `-e G16_MACOS=yes` to enable this workaround. Example:
```
docker run -d -e G16_MACOS=yes ghifari160/apache
```

## Tags ##
| Tags                      | Ubuntu Version | Size              |
|---------------------------|----------------|-------------------|
| `16.04` `xenial`          | 16.04          | [![](https://images.microbadger.com/badges/image/ghifari160/apache:16.04.svg)](https://microbadger.com/images/ghifari160/apache:16.04 "Get your own image badge on microbadger.com")|
| `17.04` `zesty`           | 17.04          | **NOT SUPPORTED** |
| `17.10` `artful`          | 17.10          | **NOT SUPPORTED** |
| `latest` `18.04` `bionic` | 18.04          |[![](https://images.microbadger.com/badges/image/ghifari160/apache.svg)](https://microbadger.com/images/ghifari160/apache "Get your own image badge on microbadger.com")|
