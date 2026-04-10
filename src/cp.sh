#!/bin/bash
SUBCOMMAND=$1
shift  # Remove the subcommand from the argument list
bash "~/bin/codeport/${SUBCOMMAND}.sh" "$@"
