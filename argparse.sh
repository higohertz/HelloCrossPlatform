declare -a LARGSD
declare -a DESCRD

ARGPARSE_VAR_PREFIX="ARGP_"
ARGPARSE_ALL_ARGS_MATCH=1
ARGPARSE_DEBUG=1
# arg="f:foo" count=1 description= dest= value=
# description, dest, value - illegal characters ':'
putarg() {

    local arg=
    local count=0
    local description=
    local dest=
    local value=1
    eval $1
    #echo "$arg, $count, $description"
    
    [[ -z $arg ]] && {
        echo "Not specified arg"
        return 1
    }

    local parg=( $(echo $arg | tr ":" "\n") )
    #echo "parg: [${parg[@]}], len(parg): ${#parg[@]}"

    local descrkey=
    if [[ ${#parg[@]} -eq 2 ]]; then  # short and long options specified
        descrkey="-${parg[0]}, --${parg[1]}"
        [[ -z $dest ]] && dest=$(echo ${parg[1]} | tr '-' '_')
        LARGSD+=("--${parg[1]}:$count:$dest:$value")
        LARGSD+=("-${parg[0]}:$count:$dest:$value")

    elif [[ ${#parg[@]} -eq 1 ]]; then # or shor or long
        local a=${parg[0]}
        if [[ ${#a} -eq 1 ]]; then  # short param
            [[ -z $dest ]] && dest=$a
            LARGSD+=("-$a:$count:$dest:$value")
            descrkey="-${a}"
        else    # long param
            [[ -z $dest ]] && dest=$(echo $a | tr '-' '_')
            LARGSD+=("--$a:$count:$dest:$value")
            descrkey="--${a}"
        fi
    else
        echo "Bad format argument arg=\"$arg\""
    fi
    #echo "descrkey: $descrkey"
    local param_arg=
    [[ $count>0 ]] && param_arg=" <Arg>"
    DESCRD+=("${descrkey}${param_arg}: $description")
}

# args_parse "$@"
args_parse() {
    while [[ $# -ne 0 ]]
    do
        local param=$1
        echo "take param: $param"
        shift
        local was_match=
        for i in ${LARGSD[@]}
        do
            # ex.: "--foo:1:FOO:0"
            local parg=( $(echo $i | tr ":" "\n") )
            #echo "parg: ${parg[@]}"
            local check_param=${parg[0]}

            if [[ "$param" == "$check_param" ]]; then
                was_match=1
                local count=${parg[1]}
                local value=${parg[3]}
                
                local d=
                if [[ $count > 0 ]]; then
                    # get arguments
                    for (( p=0; p<$count; p++ ))
                    do
                        local curp=$1
                        #echo "{curp:1:1}: ${curp:0:1}"
                        if [[ -z $curp || "${curp:0:1}" == '-' ]]; then
                            echo "Parameter \"$check_param\" require $count argument"
                            return 1
                        fi
                        d="$d$curp "
                        shift
                    done
                    d=${d:0:${#d}-1}
                else
                    d=$value
                fi
                [[ $ARGPARSE_DEBUG ]] && echo "${ARGPARSE_VAR_PREFIX}${parg[2]}=\"$d\""
                eval "${ARGPARSE_VAR_PREFIX}${parg[2]}=\"$d\""
                break
            fi
        done
        if [[ -z $was_match && $ARGPARSE_ALL_ARGS_MATCH ]]; then
            echo "Unexpected parameter \"$param\""
            return 1
        fi
    done
}

make_usage() {
    echo "Usage:"
    for i in "${DESCRD[@]}"
    do
        echo "$i"
    done
}
