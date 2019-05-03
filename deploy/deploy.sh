#!/bin/bash

set -ex

APP_URL=$(now --npm --public -e PRIVATE_KEY=$PRIVATE_KEY -e APP_ID=$APP_ID -e WEBHOOK_SECRET=$WEBHOOK_SECRET -e NODE_ENV="production" -T $NOW_TEAM -t $NOW_TOKEN)
now scale $APP_URL sfo 1 -T $NOW_TEAM --token=$NOW_TOKEN
now alias set $APP_URL $NOW_ALIAS -T $NOW_TEAM -t $NOW_TOKEN
now rm $NOW_PROJECT --safe -y -T $NOW_TEAM -t $NOW_TOKEN || true
