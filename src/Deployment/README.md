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
