# run with 
#on host :
#xhost + local:
#non-network local connections being added to access control list

#Then on host 
#docker run -e DISPLAY=:0 -v /tmp/.X11-unix:/tmp/.X11-unix --net host -it firefox-drac firefox --display=:0

FROM scratch
COPY data /
COPY data/usr/bin/sh /bin/
COPY data/usr/bin/bash /bin/
RUN chmod ugo+x /bin/sh /bin/bash
RUN echo "%_netsharedpath /sys:/proc" >> /etc/rpm/macros.dist

#these ones are actually incremental
RUN rpm -ivh ./setup-2.5.55-1.noarch.rpm \
./filesystem-2.4.0-1.x86_64.rpm \
./tzdata-2006m-2.fc6.noarch.rpm \
./glibc-common-2.5-3.x86_64.rpm \
./libgcc-4.1.1-30.x86_64.rpm  \
./basesystem-8.0-5.1.1.noarch.rpm \
./glibc-2.5-3.x86_64.rpm \
./zlib-1.2.3-3.x86_64.rpm \
./mktemp-1.5-23.2.2.x86_64.rpm \
./gdbm-1.8.0-26.2.1.x86_64.rpm \
./termcap-5.5-1.20060701.1.noarch.rpm \
./libtermcap-2.0.8-46.1.x86_64.rpm \
./bash-3.1-16.1.x86_64.rpm \
./libxml2-2.6.26-2.1.1.x86_64.rpm \
./ncurses-5.5-24.20060715.x86_64.rpm \
./info-4.8-11.1.x86_64.rpm \
./readline-5.1-1.1.x86_64.rpm \
./sqlite-3.3.6-2.x86_64.rpm \
./libstdc++-4.1.1-30.x86_64.rpm \
./pcre-6.6-1.1.x86_64.rpm \
./grep-2.5.1-54.1.x86_64.rpm \
./db4-4.3.29-9.fc6.x86_64.rpm \
./audit-libs-1.2.8-1.fc6.x86_64.rpm \
./beecrypt-4.1.2-10.1.1.x86_64.rpm \
./cracklib-dicts-2.8.9-3.1.x86_64.rpm \
./expat-1.95.8-8.2.1.x86_64.rpm \
./libattr-2.4.32-1.1.x86_64.rpm \
./libsepol-1.12.27-1.x86_64.rpm \
./popt-1.10.2-32.x86_64.rpm \
./sed-4.1.5-5.fc6.x86_64.rpm \
./libacl-2.2.39-1.1.x86_64.rpm \
./acl-2.2.39-1.1.x86_64.rpm \
./libcap-1.10-25.x86_64.rpm \
./bzip2-libs-1.0.3-3.x86_64.rpm \
./chkconfig-1.3.30-1.x86_64.rpm \
./ethtool-3-1.2.2.x86_64.rpm \
./gawk-3.1.5-11.x86_64.rpm \
./iproute-2.6.16-6.fc6.x86_64.rpm \
./mingetty-1.07-5.2.2.x86_64.rpm \
./glib2-2.12.3-2.fc6.x86_64.rpm \
./procps-3.2.7-8.x86_64.rpm

#these ones are a dependency loop
RUN rpm -ivh ./SysVinit-2.86-14.x86_64.rpm ./pam-0.99.6.2-3.fc6.x86_64.rpm  ./libselinux-1.30.29-2.x86_64.rpm  ./coreutils-5.97-11.x86_64.rpm  ./cracklib-2.8.9-3.1.x86_64.rpm ./findutils-4.2.27-4.1.x86_64.rpm ./mcstrans-0.1.8-3.x86_64.rpm ./initscripts-8.45.3-1.x86_64.rpm ./module-init-tools-3.3-0.pre1.4.17.x86_64.rpm ./net-tools-1.60-73.x86_64.rpm  ./e2fsprogs-1.39-7.x86_64.rpm  ./device-mapper-1.02.07-3.x86_64.rpm  ./e2fsprogs-libs-1.39-7.x86_64.rpm  ./util-linux-2.13-0.44.fc6.x86_64.rpm   ./shadow-utils-4.0.17-5.x86_64.rpm ./udev-095-14.x86_64.rpm  ./psmisc-22.2-5.x86_64.rpm ./MAKEDEV-3.23-1.2.x86_64.rpm  ./iputils-20020927-41.fc6.x86_64.rpm ./fedora-release-notes-6-3.noarch.rpm ./fedora-release-6-4.noarch.rpm  ./sysklogd-1.4.1-39.2.x86_64.rpm  ./python-2.4.3-18.fc6.x86_64.rpm  ./openssl-0.9.8b-8.x86_64.rpm  ./krb5-libs-1.5-7.x86_64.rpm 

#another dependency loop
RUN rpm -ivh ./yum-3.0.6-1.fc6.noarch.rpm  ./rpm-libs-4.4.2-32.x86_64.rpm ./rpm-python-4.4.2-32.x86_64.rpm  ./yum-metadata-parser-1.0.3-2.fc6.x86_64.rpm ./elfutils-libs-0.123-1.fc6.x86_64.rpm  ./python-sqlite-1.1.7-1.2.1.x86_64.rpm ./python-elementtree-1.2.6-5.x86_64.rpm ./neon-0.25.5-5.1.x86_64.rpm ./elfutils-libelf-0.123-1.fc6.x86_64.rpm  ./python-urlgrabber-2.9.9-2.noarch.rpm ./rpm-4.4.2-32.x86_64.rpm 


RUN yum update  -y
RUN yum install -y firefox

#build with
#sudo docker build ./firefox-drac/  -t firefox-drac


#where to get all the files


#mkdir -p /home/$USER/firefox-drac/data
#> /home/$USER/firefox-drac/Dockerfile
#copy pasta this file into it

#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/iso/FC-6-x86_64-rescuecd.iso
#extract the iso
#unsquash images/stage2.img
#sudo unsquashfs -f -d /home/$USER/firefox-drac/data  images/stage2.img




#wget to /home/$USER/firefox-drac/data

#RUN rpm -ivh ./cracklib-2.8.9-3.1.x86_64.rpm ./cracklib-dicts-2.8.9-3.1.x86_64.rpm ./pam-0.99.6.2-3.fc6.x86_64.rpm ./coreutils-5.97-11.x86_64.rpm libselinux-1.30.29-2.x86_64.rpm  ./findutils-4.2.27-4.1.x86_64.rpm python-2.4.3-18.fc6.x86_64.rpm ./openssl-0.9.8b-8.x86_64.rpm ./krb5-libs-1.5-7.x86_64.rpm ./mcstrans-0.1.8-3.x86_64.rpm ./e2fsprogs-libs-1.39-7.x86_64.rpm


#  505  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/updates/6/x86_64/wget-1.10.2-8.fc6.1.x86_64.rpm
#  506  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/updates/6/x86_64/yum-3.0.6-1.fc6.noarch.rpm
#  507  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/updates/6/x86_64/yum-metadata-parser-1.0.3-2.fc6.x86_64.rpm
#  513  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/updates/6/x86_64/glibc-2.5-18.fc6.x86_64.rpm
#  514  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/zlib-1.2.3-3.x86_64.rpm
#  515  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/openssl-0.9.8b-8.x86_64.rpm
#  516  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/info-4.8-11.1.x86_64.rpm
#  517  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/bash-3.1-16.1.x86_64.rpm
#  524  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/glibc-common-2.5-3.x86_64.rpm
#  525  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/basesystem-8.0-5.1.1.noarch.rpm
#  526  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libgcc-4.1.1-30.x86_64.rpm
#  531  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/filesystem-2.4.0-1.x86_64.rpm
#  532  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/tzdata-2006m-2.fc6.noarch.rpm
#  533  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/setup-2.5.55-1.noarch.rpm
#  538  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/glibc-2.5-3.x86_64.rpm
#  582  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/python-2.4.3-18.fc6.x86_64.rpm
#  583  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/python-elementtree-1.2.6-5.x86_64.rpm
#  584  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/python-sqlite-1.1.7-1.2.1.x86_64.rpm
#  585  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/rpm-4.4.2-32.x86_64.rpm
#  586  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/rpm-python-4.4.2-32.x86_64.rpm
#  587  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/python-sqlite-1.1.7-1.2.1.x86_64.rpm
#  588  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/sqlite-3.3.6-2.x86_64.rpm
#  589  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libxml2-2.6.26-2.1.1.x86_64.rpm
#  598  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/bzip2-libs-1.0.3-3.x86_64.rpm
#  599  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/ncurses-5.5-24.20060715.x86_64.rpm
#  600  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/readline-5.1-1.1.x86_64.rpm
#  601  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libtermcap-2.0.8-46.1.x86_64.rpm
#  602  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/mktemp-1.5-23.2.2.x86_64.rpm
#  603  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/gdbm-1.8.0-26.2.1.x86_64.rpm
#  618  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/termcap-5.5-1.20060701.1.noarch.rpm
#  624  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/krb5-libs-1.5-7.x86_64.rpm
#  625  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libgssapi-0.10-1.x86_64.rpm
#  626  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/coreutils-5.97-11.x86_64.rpm

#  654  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/grep-2.5.1-54.1.x86_64.rpm
#  657  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/pam-0.99.6.2-3.fc6.x86_64.rpm
#  658  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libselinux-1.30.29-2.x86_64.rpm
#  659  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/acl-2.2.39-1.1.x86_64.rpm
#  660  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libacl-2.2.39-1.1.x86_64.rpm
#  661  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/findutils-4.2.27-4.1.x86_64.rpm
#  662  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/db4-4.3.29-9.fc6.x86_64.rpm

#  674  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/pcre-6.6-1.1.x86_64.rpm
#  679  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libstdc++-4.1.1-30.x86_64.rpm

#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/rpm-libs-4.4.2-32.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libattr-2.4.32-1.1.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libsepol-1.12.27-1.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/beecrypt-4.1.2-10.1.1.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/expat-1.95.8-8.2.1.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/shadow-utils-4.0.17-5.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/audit-libs-1.2.8-1.fc6.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libsepol-1.12.27-1.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/popt-1.10.2-32.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/sed-4.1.5-5.fc6.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/cracklib-2.8.9-3.1.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/cracklib-dicts-2.8.9-3.1.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/neon-0.25.5-5.1.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/elfutils-libs-0.123-1.fc6.x86_64.rpm
#wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/mcstrans-0.1.8-3.x86_64.rpm
#https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/e2fsprogs-libs-1.39-7.x86_64.rpm
#  718  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/mcstrans-0.1.8-3.x86_64.rpm
#  721  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/e2fsprogs-libs-1.39-7.x86_64.rpm
#  728  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/device-mapper-1.02.07-3.x86_64.rpm
#  729  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/libcap-1.10-25.x86_64.rpm
#  730  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/chkconfig-1.3.30-1.x86_64.rpm
#  731  wget https://archive.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/system-config-services-0.9.1-1.fc6.noarch.rpm
#  563  wget https://archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/udev-095-14.x86_64.rpm
#  564  wget https://archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/iputils-20020927-41.fc6.x86_64.rpm
#  565  wget https://archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/dev86-0.16.17-2.2.x86_64.rpm
#  566  wget https://archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/MAKEDEV-3.23-1.2.x86_64.rpm
#  567  wget https://archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/mcelog-0.7-1.22.fc6.x86_64.rpm
#//archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/sysklogd-1.4.1-39.2.x86_64.rpm
#  587  wget https://archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/elfutils-libelf-0.123-1.fc6.x86_64.rpm
#  588  wget https://archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/python-urlgrabber-2.9.9-2.noarch.rpm
