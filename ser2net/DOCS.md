# Home Assistant Add-on: Ser2net

## Overview

This addon let you expose a serial device of your Home Assistant instance over the network.

Use cases:
- Share a serial device data between several computers in real time.
- Debug a serial device that can't be physically moved

It relies on the [ser2net](https://github.com/cminyard/ser2net/) (3.5.x) utility.

## How to use

### 1. Home assistant

Install the plugin and configure the device to expose on the configuration tab.

Once it's ok, you can start the service on the "Info" tab.

By default, your serial device will be exposed on TCP port 38001.

### 2. On remote hosts

To use the exposed serial device on a remote host, you can use [socat](http://www.dest-unreach.org/socat/).

Assuming that your Home Assistant hostname is `homeassistant`, you can execute the following command to create the serial device on `$HOME/HassTTY`:

```sh
socat pty,link=$HOME/HassTTY,waitslave,echo=0,raw tcp:homeassistant:38001
```

Feel free to adjust these values to suit your needs (and to read [man socat](http://transit.iut2.upmf-grenoble.fr/cgi-bin/man/man2html?filan+1) !).

