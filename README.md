# Automad

The official Docker image for [Automad](https://automad.org) including **Nginx** and **PHP 8**.

[![Build Docker Image](https://github.com/marcantondahmen/automad-docker/actions/workflows/build.yml/badge.svg?branch=master&event=schedule)](https://github.com/marcantondahmen/automad-docker/actions/workflows/build.yml)

## Using this Image

You can create a container called `mysite` and start it by using the following command:

	docker run -dp 80:80 --name mysite automad/automad

A new user account for the Automad dashboard will be created automatically. The account details will be logged by the running container. You can show these logs using the following command:

	docker logs mysite

Your can now navigate to [localhost](http://localhost) to view your new site.
