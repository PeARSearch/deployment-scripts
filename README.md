# deployment-scripts
Deployment scripts for PeARSearch functional testing

[Install and start docker](https://docs.docker.com/engine/installation/#get-started).

To create a container, build the dockerfile using:

`docker build . -t pears_app`


To start the container:

`docker run -d -p 9000:5000 -ti pears_app`
