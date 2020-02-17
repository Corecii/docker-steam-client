# docker-steam-client

A docker image that installs the linux steam client on top of an opengl-supporting docker image.

docker-steam-client is based on [thewtex/opengl](https://github.com/thewtex/docker-opengl). This handles setting up graphics, and additionally:
* sets up a public browser-based vnc client on port 6080
* sets up a non-root user, `user`, with password-less sudo priveleges
* includes a `run.sh` script to aid in running this docker image