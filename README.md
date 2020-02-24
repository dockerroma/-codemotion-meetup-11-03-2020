# README

## codemotion-meetup-11-03-2020

This code is extracted from [wildfly/quickstart example]: https://github.com/wildfly/quickstart and it is released under APACHE 2.0 License. 

```bash
git clone https://github.com/dockerroma/codemotion-meetup-11-03-2020.git
```

## Install docker compose

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

Make it executable

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

# Build Application and run JBoss WildFly + Application + Filebeat

```bash
docker-compose up --build
```

## Build Elastic for Docker

We added to this project the code from `https://github.com/elastic/stack-docker.git` with few modifications.

In order to run  Elastic Stack (Elastic, Kibana, Logstash) you need to do the following:

```bash
sysctl -w vm.max_map_count=262144
```

to increase memory usage according Elastic standards.

```bash
cd stack-docker
```

```bash
/usr/local/bin/docker-compose -f setup.yml up
```

this command will initialize containers and create the elastic password (username is "elastic").
For further details see instructions [here](https://github.com/elastic/stack-docker).

## Start ElasticStack

```bash
/usr/local/bin/docker-compose up
```
