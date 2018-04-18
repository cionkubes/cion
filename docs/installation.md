# Prerequisites
- [Access to a machine with Docker Swarm](https://docs.docker.com/get-started/part4/)

# Setup
Clone the cion repository 
```bash
$ git clone https://github.com/cionkubes/cion
$ cd cion
```

Create secrets that you will need
- [Token for webhook url](secrets.md#token)
- [Login details for any docker repositories that has restricted read access.](secrets.md#dockerhub)
- [TLS certificates for any docker swarms with services you want to update](secrets.md#docker)
- [Kubernetes service user for any kubernetes cluster with deployments you want to update](secrets.md#kubernetes)
