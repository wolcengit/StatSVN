#!/bin/sh

function buildweb() {
  local name="$1"
  local url="$2"
  local usr="$3"
  local pwd="$4"
  local fn="$(date +%Y-%m-%d-%H-%M-%S).log"

  local PSRC="/app/work/src/$name"
  local PLOG="/app/work/log/$name"
  local PWEB="/app/work/web/$name"
  local FLOG="$PLOG/$(date +%Y-%m-%d-%H-%M-%S).log"

  if [ ! -d "$PSRC" ]; then
    mkdir -p $PSRC
    mkdir -p $PLOG
    mkdir -p $PWEB
    svn co $url $PSRC --username ${usr} --password ${pwd} --no-auth-cache --non-interactive --trust-server-cert
  else
    cd $PSRC
    svn update --username ${usr} --password ${pwd} --no-auth-cache --non-interactive --trust-server-cert
  fi
  cd $PSRC
  svn log -v --xml  --username ${usr} --password ${pwd} --no-auth-cache --non-interactive --trust-server-cert >$FLOG
  cd /app
  java -jar statsvn.jar $FLOG $PSRC -charset utf-8 -disable-twitter-button -title $name -output-dir $PWEB
  if [ ! -d "/usr/share/nginx/html/$name" ]; then
    ln -s $PWEB /usr/share/nginx/html/$name
  fi
}
