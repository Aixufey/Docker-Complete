# Docker-Complete

## Images & Containers

- Image: Blueprint for a container, setup and instructions..
- Container: The running "unit of software"
- One Image, multiple container instances..
- Containers are independent instances of an Image

```mermaid
    %%{init: {'theme': 'neutral'}}%%

    graph BT;
    A(Image: NodeJS App Code, NodeJS Environment);
    B[Instances];
    C[ContainerA: Running NodeJS App];
    D[ContainerB: Running NodeJS App];
    E[ContainerC: Running NodeJS App];
    A --> B;
    B --> C;
    B --> D;
    B --> E;
```

- Use [prebuilt Image](https://hub.docker.com/_/node)
- Running prebuilt Node Image `docker run -it node` `it` flag is interactive mode to pull into running container of this instance
- Show all containers `docker ps -a`
- A Container has it's own environment, and need an exposed port to communicate

---

### Building an Image

- Image is layer based architecture and is read-only.

- Once an Image has been built it's isolated, which means any changes to source code will have any effect to the built Image.

- Every instruction creates an layer, that will be cached. This can help with building performance, i.e. skip running `npm i` everytime we are building when we did not made any dependency changes.

---

### Running an Image

- Run an image with `docker run` will create a new instance
- Resume / Stop the instance with `docker start` / `docker stop`
- By default container is in attached mode, this means CLI is listening to the container. We can detach it with `-d` flag `docker run -p 3000:80 -d imageId`. To attach again `docker attach imageId`.

#### Why detach mode?

- Sometimes we to interact with the terminal, thus we can use another flag `-it` that is interactive terminal, even without detaching.
- `docker run -it imageId` spins up a container with interactive terminal while listening to the container.

---

