FROM alpine:latest

# Install required packages
RUN apk add --no-cache build-base wget tar 

# Set working directory
WORKDIR /busybox

# Download and extract BusyBox source code
RUN wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2 \
    && tar -xjf busybox-1.36.1.tar.bz2 \
    && mv busybox-1.36.1 busybox-source \
    && rm busybox-1.36.1.tar.bz2

WORKDIR /busybox/busybox-source

# Configure, compile, and install BusyBox
RUN make defconfig \
    && make -j$(nproc) \
    && make install

# Set up BusyBox as the default shell
CMD ["/busybox/busybox-source/_install/bin/sh"]
