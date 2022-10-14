#!/bin/bash

function print_help()
{
    echo -e "Syntax: $0 command (install|start) [-h] [-l] [-p] [-ht]"
    echo -e "\t[-h --help]: Display this help"
    echo -e "\t[-l --logfile]: Specify a filepath to save container sdout"
    echo -e "\t[-p --privilege]: Set network mode to 'host'"
    echo -e "\t[-ht --host]: Set network mode to 'host'"
    echo
    echo -e "example :"
    echo -e "$0 install"
    echo -e "$0 start -ht -p -l ./my-logfile.log"
    exit 1
}

NETWORK="none"
PRIVILIGED=false
DOCKER_IMAGE="kali-image"
DOCKER_NAME="kali"

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            print_help
        ;;
        -l|--logfile)
            LOGPATH="$2"
            shift # past argument
            shift # past value
        ;;
        -ht|--host)
            NETWORK="host"
            shift # past argument
            # shift # past value
        ;;
        -p|--priviliged)
            PRIVILIGED=true
            shift # past argument
            # shift # past value
        ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
        ;;
        *)
            POSITIONAL_ARGS+=("$1") # save positional arg
            shift # past argument
        ;;
    esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

if [[ -n $1 ]]; then
    if [ $1 == "start" ]; then
        if [[ -n $LOGPATH ]]; then
            docker logs -f $DOCKER_NAME &> $LOGPATH &
        fi
        docker compose run $DOCKER_NAME --net=$NETWORK ${PRIVILIGED:+--privileged}
        exit 0
    fi
    
    if [ $1 == "install" ]; then
        docker build . -t $DOCKER_IMAGE
        exit 0
    fi
fi