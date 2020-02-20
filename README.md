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

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

## Java JMS Application for Wildfly (helloworld-mdb)

```bash
git clone https://github.com/wildfly/quickstart.git
```

```bash
cd wildfly/helloworld-mdb/
```


## Download Elastic for Docker

```bash
git clone https://github.com/elastic/stack-docker.git
```

```bash
cd stack-docker
```

## Setup elastic stack

```bash
/usr/local/bin/docker-compose -f setup.yml up
```

## Start ElasticStack

```bash
/usr/local/bin/docker-compose up
```
