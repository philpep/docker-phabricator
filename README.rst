#####################
phabricator on docker
#####################

This is a set of docker_ and docker-compose_ configuration for running phabricator_.


Quick start
===========

::

    # clone this repository
    git clone https://github.com/philpep/docker-phabricator
    cd docker-phabricator

    # clone phabricator repositories in ./src
    git clone -b stable https://github.com/phacility/phabricator src/phabricator
    git clone -b stable https://github.com/phacility/arcanist src/arcanist
    git clone -b stable https://github.com/phacility/libphutil src/libphutil

    # edit the .env file and change UID / GID to your own user and group id
    # (this is required to have docker processes running with your uid/gid)
    edit .env

    # edit etc/local.json and set phabricator.base-uri security.alternate-file-domain as appropriate
    edit etc/local.json

    # then build docker images
    docker-compose build

    # then start php and mysql containers
    docker-compose up -d php mysql

    # then initialize the database
    ./bin/storage upgrade

    # then start nginx and phd (phabricator daemons)
    docker-compose up -d

    # your phabricator instance is now running on port 8080 and you can point
    # your ssl/reverse proxy on it.


Upgrades
========

::

    # This will pull repositories, stop, upgrade database and start phabricator
    ./bin/upgrade


.. _docker: https://www.docker.com/
.. _docker-compose: https://docs.docker.com/compose/
.. _phabricator: https://www.phacility.com/
