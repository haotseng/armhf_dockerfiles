#!/bin/bash
set -e

exec ${CERTBOT_DIR}/certbot-auto $@

