#!/bin/bash
SUBCOMMAND=$1
shift  # Remove the subcommand from the argument list
bash "~/bin/cp/${SUBCOMMAND}.sh" "$@"
