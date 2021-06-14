FROM fedora:latest

copy . /app
RUN dnf upgrade -y && dnf install autoconf automake \
    openmpi-devel hdf5-devel \
    libpq-devel zlib glibc-devel \
    gcc-gfortran gcc make -y

RUN ln -s /usr/lib64/openmpi/bin/* /usr/bin/

WORKDIR /app
RUN autoreconf --install
WORKDIR /app/docker_config_files
RUN chmod +x configure.sh
RUN ./configure.sh
WORKDIR /app/build
RUN make
RUN make install
WORKDIR /app/examples