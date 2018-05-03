# Prerequisites
- [Docker Swarm](https://docs.docker.com/get-started/part4/)

# Setup
Clone the cion repository 
```bash
$ git clone https://github.com/cionkubes/cion
$ cd cion
```

Create secrets that you will need
- [Token for webhook url](secrets.md#token)
- [Login details for docker repositories that are private.](secrets.md#dockerhub)
- [TLS certificates for any docker swarms with services you want to update](secrets.md#docker)
- [Kubernetes service user for any kubernetes cluster with deployments you want to update](secrets.md#kubernetes)

# Configuring the stack
It is recomended you have some experience with docker compose or docker stack, you can read about it [here.](https://docs.docker.com/compose/compose-file/#service-configuration-reference)

You may create your own compose file([look at this example](https://github.com/cionkubes/cion/blob/master/docker/cion-compose.yml)), or you may follow these instructions.

Install the docker stack deploy helper
```bash
$ pip install git+https://github.com/cionkubes/dsd
```

Create a preset
```bash
dsd docker/cion-compose.yml --out [profiles...] > my-stack.yml
```

