#/bin/sh

run () {
    lsb_release -a
    cat /etc/issue
    uname -i | awk '{ printf "%s " , $1 }'
    uname -a | awk '{ printf "Kernel: %s " , $3 }'
    uname -m | awk '{ printf "%s | " , $1 }'
    printf "\n"
    uptime | awk '{ printf "Uptime: %s %s %s", $3, $4, $5 }' | sed 's/,//g'
    printf "\n"
    printf "CPU: "
    cat /proc/cpuinfo | grep "model name" | head -1 | awk '{ for (i = 4; i <= NF; i++) printf "%s ", $i }'
    printf "\n"
    #sensors | grep Core | head -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
    #sensors | grep Core | tail -1 | awk '{ printf "%s %s %s\n", $1, $2, $3 }'
}

run