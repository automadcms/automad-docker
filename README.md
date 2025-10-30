# Automad

The official Docker image for [Automad](https://automad.org) including **Nginx** and **PHP**.

## Building

In order to build this image with a specific version, run the following command:

```bash
docker build --build-arg version=v2.x-dev -t automad/automad:v2.x-dev .
```

## Using this Image

You can create a container called `mysite` and start it by using the following command:

```bash
docker run -dp 80:80 -v ./app:/app -e UID=$(id -u) --name mysite automad/automad
```

This will essentially make your site available at port `80` and mount a directory called `/app` for data persistence. The mount point will have the same `UID` assigned that is used by you on the host machine. This way permissions should work out of the box. A new user account for the Automad dashboard will be created automatically. The account details will be logged by the running container. You can show these logs using the following command:

```bash
docker logs mysite
```

Your can now navigate to [localhost](http://localhost) to view your new site.

### Docker Compose

Alternatively you can also use `docker compose` with the following configuration:

```yaml
version: "3"
services:
  app:
    container_name: automad
    image: automad/automad:latest
    environment:
      UID: 1000 # your host UID
    ports:
      - 80:80
    volumes:
      - ./app:/app
```

And then in order to start the container:

```bash
docker compose up -d
```
