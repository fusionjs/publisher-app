#!/bin/bash

set -e

APP_URL=$(now --npm -t $NOW_TOKEN --public -e PRIVATE_KEY=$PRIVATE_KEY -e APP_ID=$APP_ID -e WEBHOOK_SECRET=$WEBHOOK_SECRET -e NODE_ENV="production")
now scale $APP_URL sfo 1 -T $NOW_TEAM --token=$NOW_TOKEN
now alias set $APP_URL $APP_NAME -t $NOW_TOKEN
now rm $APP_NAME --safe -T $NOW_TEAM -t $NOW_TOKEN -y
