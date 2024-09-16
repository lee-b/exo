#!/bin/bash

echo "Running exo..."

/app-venv/bin/python ./main.py \
	--disable-tui \
	--wait-for-peers 2 \
	#--debug \
	--discovery-timeout 10 \
	"$@"

RC=$?

echo "Exo complete. Exiting."
exit $RC

