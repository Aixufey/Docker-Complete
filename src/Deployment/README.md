# Deployment of Container

## Bind Mounts, Volumes & COPY

- In development we use binding to make changes to code so container can update it instantly.
- In production, Image/Container is the single source of truth, without relying on anything. It has everything it need to run the application.

## AWS

- Deploying on AWS EC2 instance using SSH.
- To use the private key, change the permission with `chmod 400 aws-example.pem`
- Using private key to connect.`ssh -i "aws-example.pem" ec2-user@ec2-51-20-96-149.eu-north-1.compute.amazonaws.com`

## Install Docker on Cloud Instance

- Update: `sudo yum update -y`
- Install: `sudo yum -y install docker`
- Start: `sudo service docker start`

## Deploy prebuilt Image

- It's easier to build the image on local host and just run the prebuilt image on remote EC2 instance.
- Create a repo on Docker-Hub name `aws-example` and build it on host i.e. `docker build -t aws-example .` then rename the tag to your repo, `docker tag aws-example yourAccount/aws-example`
- Push the built image to repo `docker push yourAccount/aws-example`

## Run public Image from remote

- Inside EC2 CLI, run the image from pushed repo, `sudo docker run -d --rm -p 80:80 yourAccount/aws-example`, the same way you spins up a container.

## Testing the running Container from remote

- AWS has security groups to protect traffic, by default EC2 instance is protected from traffic

- inbound is default at port 22 - SSH ip 0.0.0.0/0, so we can connect using private key from anywhere. The running container inside EC2 instance may listen to some port e.g. `80`. Thus, we need to add HTTP rule for incomming traffic.
- outboud is open to all, that's how we could run the image from public dockerhub repo.

## Summary

1. Local machine builds the Image.
2. Push the Image into Dockerhub, open available.
3. Remote only installed Docker to run the final Image that contains application.
