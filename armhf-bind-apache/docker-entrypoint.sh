#!/bin/bash
set -e

BIND_CONF_DIR=${BIND_DIR}/conf
BIND_LIB_DIR=${BIND_DIR}/lib
BIND_CACHE_DIR=${BIND_DIR}/cache

setup_bind_dir() {

  # set config directory
  if [ ! -d ${BIND_CONF_DIR} ]; then
    mkdir -m 0755 -p ${BIND_CONF_DIR}
    mv /etc/bind/* ${BIND_CONF_DIR}
    
    if [ -d ${BIND_INIT_CONF_DIR} ]; then
      cp ${BIND_INIT_CONF_DIR}/* ${BIND_CONF_DIR}
    fi
    
    chown -R root:${BIND_USER} ${BIND_CONF_DIR}
    
  fi
  rm -rf /etc/bind
  ln -sf ${BIND_CONF_DIR} /etc/bind

  # set lib directory
  if [ ! -d ${BIND_LIB_DIR} ]; then
    mkdir -p ${BIND_LIB_DIR}
    chown ${BIND_USER}:${BIND_USER} ${BIND_LIB_DIR}
  fi
  rm -rf /var/lib/bind
  ln -sf ${BIND_LIB_DIR} /var/lib/bind

  # set cache directory
  if [ ! -d ${BIND_CACHE_DIR} ]; then
    mkdir -m 0755 -p ${BIND_CACHE_DIR}
    chown root:${BIND_USER} ${BIND_CACHE_DIR}
    if [ -d ${BIND_INIT_DATA_DIR} ]; then
      cp ${BIND_INIT_DATA_DIR}/* ${BIND_CACHE_DIR}
    fi
    
    chown -R ${BIND_USER}:${BIND_USER} ${BIND_CACHE_DIR}
    
  fi
  rm -rf /var/cache/bind
  ln -sf ${BIND_CACHE_DIR} /var/cache/bind

  # create pid dir
  mkdir -m 0775 -p /var/run/named
  chown root:${BIND_USER} /var/run/named
}

setup_bind_dir

# allow arguments to be passed to named
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$@"
  set --
elif [[ ${1} == named || ${1} == $(which named) ]]; then
  EXTRA_ARGS="${@:2}"
  set --
fi

# default behaviour is to launch named
if [[ -z ${1} ]]; then
  echo "Starting apache"
  /etc/init.d/apache2 start
  
  echo "Starting named..."
  exec $(which named) -u ${BIND_USER} -g ${EXTRA_ARGS}
else
  exec "$@"
fi




