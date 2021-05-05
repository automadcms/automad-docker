# Automad

The official Docker image for [Automad](https://automad.org).

## Using this Image

The first time you run this image, a new user account for the Automad dashboard will be created automatically. The account details are displayed in the terminal and therefore the image shouldn't run in detached mode.

	docker run -p 80:80 automad/automad

After the first run you can use the following command to run the image in detached mode.

	docker run -dp 80:80 automad/automad
