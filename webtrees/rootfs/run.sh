#!/usr/bin/env bashio

if [ -f /data/config.ini.php ]; then
ln -s /data/config.ini.php /var/www/webtrees/data
fi

if [ -f /data/webtrees.sqlite ]; then
ln -s /data/webtrees.sqlite /var/www/webtrees/data
fi

##########
# BANNER #
##########

if bashio::supervisor.ping; then
  bashio::log.blue \
  '-----------------------------------------------------------'
  bashio::log.blue " Add-on: $(bashio::addon.name)"
  bashio::log.blue " $(bashio::addon.description)"
  bashio::log.blue \
  '-----------------------------------------------------------'

  bashio::log.blue " Add-on version: $(bashio::addon.version)"
  if bashio::var.true "$(bashio::addon.update_available)"; then
    bashio::log.magenta ' There is an update available for this add-on!'
    bashio::log.magenta \
    " Latest add-on version: $(bashio::addon.version_latest)"
    bashio::log.magenta ' Please consider upgrading as soon as possible.'
  else
    bashio::log.green ' You are running the latest version of this add-on.'
  fi

  bashio::log.blue " System: $(bashio::info.operating_system)" \
  " ($(bashio::info.arch) / $(bashio::info.machine))"
  bashio::log.blue " Home Assistant Core: $(bashio::info.homeassistant)"
  bashio::log.blue " Home Assistant Supervisor: $(bashio::info.supervisor)"

  bashio::log.blue \
  '-----------------------------------------------------------'
  bashio::log.blue \
  ' Please, share the above information when looking for help'
  bashio::log.blue \
  ' or support in, e.g., GitHub, forums or the Discord chat.'
  bashio::log.green \
  ' https://github.com/alexbelgium/hassio-addons'
  bashio::log.blue \
  '-----------------------------------------------------------'
fi