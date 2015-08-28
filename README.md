[![Join the chat at https://gitter.im/DURAARK/duraark-system](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/DURAARK/duraark-system?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# DURAARK System

DURAARK is a "semantic building information modeling (BIM) archival and retrieval system". It allows stakeholders in the architecture, engineering and construction (AEC) domain and allows them to carry out the following (meta) use cases:

* Deposit 3D architectural objects
* Search and retrieve archived objects
* Maintain semantic digital archive
* Detect differences between planning state and as-built state
* Monitor the evolution of a structure over time
* Identify similar objects within a point cloud scan
* Plan, document and verify retrofitting/energy
* Exploit contextual information for urban planning
* Enrich BIM/IFC model with metadata from a repository

As architectural data file formats we support building information modeling (BIM) files in the IFC-SPF format and point cloud scans in the E57 format. More information can be found at the http://www.duraark.eu.

## Installation

DURAARK is a set of (micro-)services (DURAARK Service Platform) which expose a Web-API and a graphical web application as user interface ([DURAARK WorkbenchUI](https://github.com/DURAARK/workbench-ui/)).

### Prerequisites

The deployment is tested on Ubuntu 14.04 LTS. Other Linux distribution should work too, but are not tested. [Docker](https://docs.docker.com/userguide/) and [Docker Compose](https://docs.docker.com/compose/) are used for installation and have to be installed on the system you want to deploy the DURAARK system on. The following instructions assume that Docker and Docker Compose are installed on working on the system. See the above links on how to install them for various platforms. [Git](https://git-scm.com/downloads) has to be installed, too.

It is also possible to install DURAARK on Windows and Mac users via the [Docker Toolbox](https://docs.docker.com/installation/windows/)). Installing Docker Compose on windows is possible, but seems to be a bit of a hurdle. See this [Stackoverflow answer](http://stackoverflow.com/questions/29289785/how-to-install-docker-compose-on-windows) for details.

Our recommended stack is to install DURAARK on a Docker-compatible Linux system or to use a [VirtualBox](https://www.virtualbox.org/) to install a Linux distribution on your Windows host.

### Installation Steps

On the host you want to deploy DURAARK execute the following simple steps (assuming that Docker and Docker Compose are installed and working):

```js
> git clone https://github.com/DURAARK/duraark-system.git
> cd duraark-system
> docker-compose up -d
```

This will deploy the system in the current stable version (v0.7.0) and after some setup time the DURAARK WorkbenchUI web application is available at http://<HOST-IP>/ (http://localhost if you did the setup on your local host) and can be accessed in the browser.

## Development Environment

The development environment consists of the following sub-modules:

* [duraark-sessions](https://github.com/DURAARK/duraark-sessions)
* [duraark-metadata](https://github.com/DURAARK/duraark-metadata)
* [duraark-sda](https://github.com/DURAARK/duraark-sda)
* [duraark-geometricenrichment](https://github.com/DURAARK/duraark-geometricenrichment)
* [duraark-digitalpreservation](https://github.com/DURAARK/duraark-digitalpreservation)
* [workbench-ui](https://github.com/DURAARK/workbench-ui)
* [api-gatekeeper](https://github.com/DURAARK/api-gatekeeper)

To setup the environment follow these steps:

```js
> git clone --recursive https://github.com/DURAARK/duraark-system.git
> cd duraark-system
> (cd ./duraark-metadata && git submodule init && git submodule update)
> (cd ./duraark-geometricenrichment && git submodule init && git submodule update)
> (for repo in duraark-*; do cd $repo && npm install; cd ..; done)
> (cd ./workbench-ui && bower install && npm install)
> docker-compose -f devenv-compose.yml build
> docker-compose -f devenv-compose.yml up -d
```

This will checkout all sub-repositories and build the dockerized development environment (this step takes a while, you may want to grab a coffee or tea). After building the docker containers are started and you can access the WorkbenchUI at http://localhost. Changing the source code in a sub-module will live reload the container (except for 'api-gatekeeper', where you have to restart the container manually after an nginx config change).

## Platform Support

The system is running on Docker-enabled platforms ([Docker](https://docs.docker.com/installation/))

## API

We are hosting public API endpoints of the DURAARK Service Platform at following URLs:

* http://data.duraark.eu/services/api/sessions/
* http://data.duraark.eu/services/api/metadata/
* http://data.duraark.eu/services/api/sda/
* http://data.duraark.eu/services/api/geometricenrichment/
* http://data.duraark.eu/services/api/digitalpreservation/

The endpoints provide the respective API documentation.

## Demo

A public demo of the [DURAARK WorkbenchUI](http://github.com/duraark/workbench-ui) is available [here](http://workbench.duraark.eu). It uses the API of the [DURAARK Service Platform](https://github.com/duraark/duraark-system) to power the GUI. The version running there is v0.7.0.

The bleeding edge version of the whole system is also available on our [development server](http://juliet.cgv.tugraz.at). It is a development system. You've been warned ...

That said, if the server is running you will have the newest development version available there, ready to be explored for currently developed features. It is likely to be buggy, though. The development is targeting v0.8.0 at the moment. See our [release plan](https://github.com/DURAARK/workbench-ui/milestones) for more information on future features.
