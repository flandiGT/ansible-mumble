FROM alpine:3.7
MAINTAINER flandiGT <https://github.com/flandiGT> (thank you to Chris Kankiewicz <Chris@ChrisKankiewicz.com> <https://github.com/PHLAK/docker-mumble>)

# Define Mumble version
ARG MUMBLE_VERSION={{version}}

# Create Mumble directories
RUN mkdir -pv /opt/mumble /etc/mumble

# Create non-root user
RUN adduser -DHs /sbin/nologin -u {{user_uid}} mumble

COPY files/config.ini /opt/mumble/default_config.ini
COPY files/entrypoint.bash /opt/mumble/docker-entrypoint.bash

# Copy SuperUser password update script
COPY files/supw /usr/local/bin/supw
RUN chmod +x /usr/local/bin/supw

# Set the bzip archive URL
ARG BZIP_URL=https://github.com/mumble-voip/mumble/releases/download/${MUMBLE_VERSION}/murmur-static_x86-${MUMBLE_VERSION}.tar.bz2

# Install dependencies, fetch Mumble bzip archive and chown files
RUN apk add --update ca-certificates bzip2 tar tzdata wget \
    && wget -qO- ${BZIP_URL} | tar -xjv --strip-components=1 -C /opt/mumble \
    && apk del ca-certificates bzip2 tar wget && rm -rf /var/cache/apk/* \
    && chown -R mumble:mumble /etc/mumble /opt/mumble

EXPOSE 64738 64738/udp

USER mumble

VOLUME /etc/mumble

ENTRYPOINT ["/opt/mumble/docker-entrypoint.bash"]
