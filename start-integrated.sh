#!/bin/bash

source '/mnt/sdb1/SteamLibrary/steamapps/common/Geometry Dash/.glial/.functions.sh'


this_pid=$$

latest_log=$(get_latest_log)


echo 'Waiting for Geometry Dash to start...'

steam steam://rungameid/322170

while [[ $latest_log == $(get_latest_log) ]]; do
    sleep 0.5
done

full_exit_lock=0
stream_disconnect &
print_loop
