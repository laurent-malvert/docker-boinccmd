FROM laurentmalvert/boinc:latest

MAINTAINER Laurent Malvert <laurent.malvert@gmail.com>

LABEL                                                                          \
    Vendor="Laurent Malvert"                                                   \
    Description="A base container image providing boinccmd to control clients" \
    Version="0.1"

# -- BOINC ---------------------------------------------------------------

USER boinc

ENTRYPOINT ["boinccmd"]
