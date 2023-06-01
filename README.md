# Automad

The official Docker image for [Automad](https://automad.org) including **Nginx** and **PHP 8.1**.

[![Build Docker Image](https://github.com/marcantondahmen/automad-docker/actions/workflows/build.yml/badge.svg?branch=master&event=schedule)](https://github.com/marcantondahmen/automad-docker/actions/workflows/build.yml)

## Using this Image

You can create a container called `mysite` and start it by using the following command:

```bash
docker run -dp 80:80 --name mysite automad/automad
```

A new user account for the Automad dashboard will be created automatically. The account details will be logged by the running container. You can show these logs using the following command:

```bash
docker logs mysite
```

Your can now navigate to [localhost](http://localhost) to view your new site.

### Data Persistence

In order to persist data when shutting down a container, it is possible to mount the `/app` volume that contains the entire application and its data.
The following `docker-compose.yml` file can be used to bind the `/app` volume to a local directory called on the host machine in the current directory:

```yaml
version: "3"
services:
  app:
    container_name: automad
    image: automad/automad:latest
    ports:
      - 80:80
    volumes:
      - ./app:/app
```

Run the following command in order to start the container:

    docker compose up -d
