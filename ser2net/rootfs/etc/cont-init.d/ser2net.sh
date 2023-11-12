#!/usr/bin/with-contenv bashio
# ==============================================================================
# Generate ser2net configuration file
# ==============================================================================

if ! bashio::config.has_value "device"; then
    bashio::exit.nok "You need to setup a device"
fi

tempio --template /usr/share/tempio/ser2net.conf --out /etc/ser2net.conf < /data/options.json
chmod 644 /etc/ser2net.conf

