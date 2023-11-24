#!/usr/bin/with-contenv bashio
#echo 'The shell is starting!'
bashio::log.info "The shell is starting! Creating configuration..."
UPDATE_APP=$(bashio::config 'update')
PIPTOKEN=$(bashio::config 'piptoken')
PROJECTID=$(bashio::config 'projectid')
echo "option update is ${UPDATE_APP};";
if [ "$UPDATE_APP" = true ]
then
    echo "Waiting for pip..."
    pip install poctesx --no-cache-dir --upgrade --no-deps --force-reinstall --index-url https://__token__:$PIPTOKEN@gitlab.com/api/v4/projects/$PROJECTID/packages/pypi/simple
    wait
    echo "App updated"
fi
echo "Starting worker"
poctes.py