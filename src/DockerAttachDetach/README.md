# Attack Detach mode

- Expecting an input from user where terminal needs to be interactive

- Build the image, `docker build .`
- To run a container from the image, `docker run -it imageId` to be interactive
- When restarting the container, it will not be attached with interactive terminal. Run it with attached mode.`docker start -it containerId / containerName`
