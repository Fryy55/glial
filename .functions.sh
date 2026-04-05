source "$(dirname "$(readlink -f "$0")")/config.cfg"
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

source "$(dirname "$(readlink -f "$0")")/.print_loop.sh"


trap 'full_exit' SIGINT
