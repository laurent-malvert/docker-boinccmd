FROM laurentmalvert/docker-boinc:latest

MAINTAINER Laurent Malvert <laurent.malvert@gmail.com>

LABEL                                                                          \
    Vendor="Laurent Malvert"                                                   \
    Description="A base container image providing boinccmd to control clients" \
    Version="wheezy_7.0.27"                                                    \
    Boinc-Version="7.0.27"                                                     \
    Base-Version="debian:wheezy"

# -- BOINC ---------------------------------------------------------------

USER boinc

ENTRYPOINT ["boinccmd"]
