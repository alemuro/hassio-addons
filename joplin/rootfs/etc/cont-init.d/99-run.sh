#!/usr/bin/env bashio

bashio::log.warning "Warning - minimum configuration recommended : 2 cpu cores and 4 GB of memory. Otherwise the system will become unresponsive and crash." 

##############
# LAUNCH APP #
##############

# Configure app
bashio::config.has_value 'DB_CLIENT' && export DB_CLIENT=$(bashio::config 'DB_CLIENT') && bashio::log.info 'Database client set'
bashio::config.has_value 'POSTGRES_PASSWORD' && export POSTGRES_PASSWORD=$(bashio::config 'POSTGRES_PASSWORD') && bashio::log.info 'Postgrep Password set'
bashio::config.has_value 'POSTGRES_DATABASE' && export POSTGRES_DATABASE=$(bashio::config 'POSTGRES_DATABASE') && bashio::log.info 'Postgrep Database set'
bashio::config.has_value 'POSTGRES_USER' && export POSTGRES_USER=$(bashio::config 'POSTGRES_USER') && bashio::log.info 'Postgrep User set'
bashio::config.has_value 'POSTGRES_PORT' && export POSTGRES_PORT=$(bashio::config 'POSTGRES_PORT') && bashio::log.info 'Postgrep Port set'
bashio::config.has_value 'POSTGRES_HOST' && export POSTGRES_HOST=$(bashio::config 'POSTGRES_HOST') && bashio::log.info 'Postgrep Host set'
bashio::config.has_value 'MAILER_HOST' && export MAILER_HOST=$(bashio::config 'MAILER_HOST') && bashio::log.info 'Mailer Host set'
bashio::config.has_value 'MAILER_PORT' && export MAILER_PORT=$(bashio::config 'MAILER_PORT') && bashio::log.info 'Mailer Port set'
bashio::config.has_value 'MAILER_SECURE' && export MAILER_SECURE=$(bashio::config 'MAILER_SECURE') && bashio::log.info 'Mailer Secure set'
bashio::config.has_value 'MAILER_AUTH_USER' && export MAILER_AUTH_USER=$(bashio::config 'MAILER_AUTH_USER') && bashio::log.info 'Mailer User set'
bashio::config.has_value 'MAILER_AUTH_PASSWORD' && export MAILER_AUTH_PASSWORD=$(bashio::config 'MAILER_AUTH_PASSWORD') && bashio::log.info 'Mailer Password set'
bashio::config.has_value 'MAILER_NOREPLY_NAME' && export MAILER_NOREPLY_NAME=$(bashio::config 'MAILER_NOREPLY_NAME') && bashio::log.info 'Mailer Noreply Name set'
bashio::config.has_value 'MAILER_NOREPLY_EMAIL' && export MAILER_NOREPLY_EMAIL=$(bashio::config 'MAILER_NOREPLY_EMAIL') && bashio::log.info 'Mailer Noreply Email set'
bashio::config.has_value 'MAILER_ENABLED' && export MAILER_ENABLED=$(bashio::config 'MAILER_ENABLED') && bashio::log.info 'Mailer Enabled set'
export APP_BASE_URL=$(bashio::config 'APP_BASE_URL')

bashio::log.info 'Starting Joplin. Initial user is "admin@localhost" with password "admin"'

cd /home/joplin
npm --prefix packages/server start
