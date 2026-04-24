#!/bin/bash

INIT_FLAG="/tmp/.osquery_initialized"

if [ ! -f "$INIT_FLAG" ]; then
    cat << 'BANNER'

   ___  ___  __ _ _   _  ___ _ __ _   _
  / _ \/ __|/ _` | | | |/ _ \ '__| | | |
 | (_) \__ \ (_| | |_| |  __/| |   | |_| |
  \___/|___/\__, |\__,_|\___||_|    \__, |
             |___/                   |___/

 🚨  DO NOT USE THIS CONTAINER IN PRODUCTION ENVIRONMENTS!  🚨

 💡  To run the osquery interactive interface, type: osqueryi

BANNER
    touch "$INIT_FLAG"
fi

exec "$@"
