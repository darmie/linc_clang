#!/bin/sh
if [ -f .env ]
then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi
rm -f package.zip
zip -r package.zip src *.hxml *.json *.md haxe_libraries
haxelib submit package.zip $HAXELIB_PWD --always