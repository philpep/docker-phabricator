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

    # edit docker-compose.yml and change UID / GID to your own user and group id
    # (this is required to have docker processes running with your uid/gid)
    edit docker-compose.yaml

    # edit etc/local.json and set phabricator.base-uri security.alternate-file-domain as appropriate
    edit etc/local.json

    # then build docker images
    docker-compose build

    # then run phabricator
    docker-compose up

    # then initialize the database
    ./bin/storage upgrade

    # then enjoy your phabricator instance !
