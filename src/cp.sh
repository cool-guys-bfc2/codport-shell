#!/bin/bash
SUBCOMMAND=$1
shift  # Remove the subcommand from the argument list
bash "$HOME/bin/cp-${SUBCOMMAND}" "$@"
