#!/bin/bash

source '/mnt/sdb1/SteamLibrary/steamapps/common/Geometry Dash/.log-scripts/.functions.sh'


this_pid=$$
full_exit_text='Detaching...'
kill_gd_on_full_exit=0


full_exit_lock=0
stream_disconnect &
print_loop
