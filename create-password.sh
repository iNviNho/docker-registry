#!/bin/bash

while getopts ":p:" opt; do
  case $opt in
    p) password="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    echo "Command ended with return code 0"
    exit 0
    ;;
  esac
done

if [ -z "$password" ]
then
      echo "Error: Parameter -p is empty"
      exit 0
fi

echo "Creating password"

docker run \
  --entrypoint htpasswd \
  registry:2 -Bbn vladino $password > auth/htpasswd