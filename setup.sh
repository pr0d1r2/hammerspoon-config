#!/bin/bash

D_R=`cd \`dirname $0\` ; pwd -P`
SOURCE_DIRS="$D_R/init.d"

git pull

if [ ! -d $HOME/.hammerspoon ]; then
  mkdir -p $HOME/.hammerspoon || return $?
fi

echo > $HOME/.hammerspoon/init.lua.tmp

for SOURCE_DIR in $SOURCE_DIRS
do
  if [ -d $SOURCE_DIR ]; then
    for FILE in `ls $SOURCE_DIR/*.lua`
    do
      echo "Adding file: $FILE"
      cat $FILE >> $HOME/.hammerspoon/init.lua.tmp
    done
  fi
done

mv $HOME/.hammerspoon/init.lua.tmp $HOME/.hammerspoon/init.lua
