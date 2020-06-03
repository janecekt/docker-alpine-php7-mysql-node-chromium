### Overview

* Image based alpine
* Contains node + yarn to support node-based builds
* Contains chromium to support execution of Karma or similar tests
* Contains php7.4 to support execution of php
* Contains mysql-client to support setup of mysql DB


### Build This Image

```
docker build --network=host --tag docker-alpine-php7-mysql-node-chromium .
```


### Run image

To run interactively
```
docker run -it --network=host -v /my/volume/:/mnt docker-alpine-php7-mysql-node-chromium /bin/sh
```

The /my/volume would typically contain your workspace or sources