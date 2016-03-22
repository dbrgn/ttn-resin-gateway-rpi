FROM resin/raspberrypi-buildpack-deps

# Enable systemd
ENV INITSYSTEM on

# Copy the installer
run pwd
# COPY . ~/ttn-gateway
COPY ./resin-install.sh ~/ttn-gateway

# Build the gateway
WORKDIR ~/ttn-gateway
RUN ./resin-install.sh

# Make sure we start up within the bin directory
WORKDIR /opt/ttn-gateway/bin
COPY ./resin-run.sh /opt/ttn-gateway/bin/resin-run.sh

# Start it up
CMD ["sh", "-c", "./resin-run.sh"]
