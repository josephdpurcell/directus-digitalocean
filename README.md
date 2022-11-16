# Directus for DigitalOcean

This repo shows how to deploy Directus to DigitalOcean as a container.

## Usage

1 - Configure the Dockerfile

Copy the Dockerfile to somewhere locally as you'll need to run some commands against it.

Modify the Dockerfile; you probably want to remove the env vars and instead set them on the App itself. (I didn't try this personally.)

2 - Create registry on DigitalOcean and get auth token

Login to DigitalOcean, go to Container Registry, create the registry and give it a name.

Login to DigitalOcean, go to API, Generate New Token, give it read and write scopes. You will need this token later.

3 - Install doctl and auth to registry

```
sudo snap install doctl
doctl registry login
docker login registry.digitalocean.com
# Paste auth token for user and pass
```

4 - Generate the docker container image and push it

```
docker pull directus/directus:latest
docker build -f Dockerfile . -t registry.digitalocean.com/your-registry/directus-docker:latest
docker push registry.digitalocean.com/your-registry/directus-docker:latest
```

5 - Deploy it as an App

Login to DigitalOcean, go to Apps, Create App, select "DigitalOcean Container Registry" as the service provider, choose your repository, and finish the wizard.

## Tip: Test using a plain http server.

See the [How-To Geek article](https://www.howtogeek.com/devops/how-to-push-and-pull-docker-images-with-digitaloceans-container-registry/) for details.

You'll follow the same steps above but replace the relevant steps

```
docker pull httpd:latest
# Give it a test drive:
docker run -p 80:80 httpd:latest
# You should see localhost:80 showing a 2xx response.
docker tag httpd:latest registry.digitalocean.com/your-registry/directus-docker:latest
docker push registry.digitalocean.com/your-registry/directus-docker:latest
# Your app should now show that same 2xx response.
```

## How this repo was built

```
git init
git commit -m 'Initial commit' --allow-empty
# Create LICENSE using github
git add . && git commit -m 'Add LICENSE'
# Create the dockerfile (edit the env vars)
git add . && git commit -m 'Add Dockerfile'
```

