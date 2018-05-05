# ansible-docker-mumble

Installs a mumble server as docker container.
This role is only tested on ubuntu 16.04.

## System requirements

* Docker
* docker-compose
* Systemd

## Role requirements

* python-docker package

## Tasks

* Build docker image locally
* Create volume paths for docker container
* Create docker-compose file
* Setup systemd unit file
* Start/Restart service

## Role parameters

| Variable      | Type | Mandatory? | Default | Description           |
|---------------|------|------------|---------|-----------------------|
| version       | text | no         | 1.2.19  | Mumble version        |
| volumes.config | text | no        | <empty> | Local path to mumble config volume |
| publish.port   | text | no        | <empty> | Port to be published               |
| publish.interface | text | no     | 0.0.0.0 | Interface to be published          |

## Usage

### requirements.yml

```
- name: install-docker-mumble
  src: git@github.com:flandiGT/ansible-mumble.git
  scm: git
```

### Example Playbook

Usage (without parameters):

    - hosts: servers
      roles:
         - { role: install-docker-mumble }

Usage (with parameters):

    - hosts: servers
      roles:
      - role: install-docker-mumble
        version: 1.2.19
        volumes:
          config: /srv/docker/mumble/config
        publish:
          port: 64738
          interface: 0.0.0.0
