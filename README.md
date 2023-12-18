# Docker-Complete

## Images & Containers

- Image: Blueprint for a container, setup and instructions..
- Container: The running "unit of software"
- One Image, multiple container instances..

```mermaid

flowchart BT
    A[Image
        NodeJS App Code
        NodeJS Environment
    ] --> B(Instances)
    B --> C{ContainerA
        Running NodeJS App
    }
    B --> D{ContainerB
        Running NodeJS App
    }
    B --> E{ContainerC
        Running NodeJS App
    }
```

- Use [prebuilt Image](https://hub.docker.com/_/node)
- Running prebuilt Node Image `docker run -it node` `it` flag is interactive mode to pull into running container of this instance
- Show all containers `docker ps -a`
- A Container has it's own environment, and need an exposed port to communicate
