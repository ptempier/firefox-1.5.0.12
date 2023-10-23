# firefox-1.5.0.12
firefox for old drac 1.5.0.12 based on fedora 6

Old encryptions have been removed from browser, so now it's not possible to connect to them unless using an old version of firefox.

run with
docker run -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix --net host -it firefox-drac firefox --display=:0


.... I would push the already built image to https://ghcr.io
But the image is 1.1G and the fre limit is at 500Mb
