# Utility container

- The purpose is to spin up a container without needing to install any packages on host, but everything will be mirrored onto host via bind mount.
- Creating a lightweight Dockerfile using node image.
- Building the image `docker build -t node-util .`
- Run the container and executing npm init inside container `docker run -it -v "C:\Users\sparrow\Desktop\Docker-Complete\src\UtilityContainer:/app" node-util npm init` This will be mirrored to host as well.
- However much safer and way using ENTRYPOINT in Dockerfile and restrict to some arguments
- We can pass npm inside ENTRYPOINT, and just pass `init` or `install` instead `docker run -it -v "C:\Users\sparrow\Desktop\Docker-Complete\src\UtilityContainer:/app" node-util init`
- This means we could also install `express --save` and other npm packages.
