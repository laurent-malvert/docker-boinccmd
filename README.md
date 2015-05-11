## Description

Provides a `Dockerfile` to build a docker image allowing you to run
the `boinccmd` command in a container, to control a remote BOINC
client.

For a dockerized BOINC client, see the `docker-boinc` repository.

## Why?

3 simple reasons:

 * I occasionally want to run BOINC on a machine that isn't mine, and
   it's either restricted or I don't want it to be visible or to leave
   stray data on the machine.

 * I didn't find a decent Dockerfile for this yet that I could use
   directly, and I figured others might like to have one.

 * It serves as a good test-bed for me to learn about docker for other
   purposes, as it could require me to use a lot of its features on
   the long run if it matures into something decent: volumes, data
   containers, links, compose, etc...

## Pull From DockerHub

    docker pull laurentmalvert/docker-boinccmd

## Build It Yourself

    docker -t boinccmd .

## Usage

For information on the `boinccmd` itself, read its [documentation][1]
at the BOINC wiki.

### General Usage

    docker run                              \
           --rm                             \
           laurentmalvert/docker-boinccmd   \
               --host <HOST>                \
               [<BOINCCMD_ARGS>]

### Controlling a Dockerized BOINC Client

Assuming you are using a dockerized BOINC client, like the one
provided by the `docker-boinc` repo, and that you gave its container
the name `boinc`, you can control is using:

    docker run                             \
           --rm                            \
           --link boinc:boinc              \
           laurentmalvert/docker-boinccmd  \
               --host boinc                \
               [<BOINCCMD_ARGS>]

#### Examples

    # get current state
    docker run                             \
           --rm                            \
           --link boinc:boinc              \
           laurentmalvert/docker-boinccmd  \
               --host boinc                \
               --get_state

    # join account manager
    docker run                             \
           --rm                            \
           --link boinc:boinc              \
           laurentmalvert/docker-boinccmd  \
               --host boinc                \
               --join_acct_mgr <URL> <LOGIN> <PASS>

## Possible Improvements ?

 * Use volumes to grab startup config.
 * Provide some preset startup scripts.
 * `boinccmd` image unnecessarily installs the whole of boinc, when it
   only requires parts of it.



[1]: http://boinc.berkeley.edu/wiki/Boinccmd_tool
