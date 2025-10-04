#!/bin/bash

logs_dir='/mnt/sdb1/SteamLibrary/steamapps/common/Geometry Dash/geode/logs'
# config
kill_gd_on_full_exit=1
full_exit_text='Exiting...'
full_exit_lock=1
# $this_pid should be defined (this_pid=$$)


full_exit() {
    if [ $full_exit_lock -eq 1 ]; then
        echo "Can't exit right now; full exit locked"
        return
    fi

    echo
    echo $full_exit_text

    if [ $kill_gd_on_full_exit -ne 0 ]; then
        pkill 'Main'
    fi
    kill $this_pid
    exit 0
}

stream_disconnect() {
    while true; do
        if [[ -z $(pgrep 'Main') ]]; then
            full_exit
            break
        fi
    done
}

get_latest_log() {
    echo "$(ls -t "$logs_dir" | head -n 1)"
}

print_loop() {
    reset_style=$'\e[0m'
    debug_h_style=$'\e[30m'
    info_h_style=$'\e[34m'
    warn_h_style=$'\e[33m'
    warn_b_style=$'\e[93m'
    error_h_style=$'\e[91m'
    error_b_style=$'\e[31m'

    tail -f "$logs_dir/$(get_latest_log)" | sed -Ee "s/^(.{9})DEBUG/$debug_h_style\1DEBUG$reset_style/g" -e "s/^(.{9})INFO/$info_h_style\1INFO$reset_style/g" -e "s/^(.{9})WARN(.*)/$warn_h_style\1WARN$warn_b_style\2$reset_style/g" -e "s/^(.{9})ERROR(.*)/$error_h_style\1ERROR$error_b_style\2$reset_style/g"
}


trap 'full_exit' SIGINT
