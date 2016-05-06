# Dockerised PHP-FPM with Hiawatha

Docker base image for PHP-FPM based on [AlpineLinux](http://alpinelinux.org).

Intended for use behind a [reverse proxy](https://github.com/jwilder/nginx-proxy) of some sort.

### Usage
````bash
docker pull mitcdh/hiawatha-php
````

### Structure
* `/www`: Web root

### Exposed Ports
* `80`: http web server