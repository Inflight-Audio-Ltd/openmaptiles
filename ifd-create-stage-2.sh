#!/bin/bash

ts() { date -u +%Y%m%d-%H%M%S; }

log() { INFO="$(ts) : ${STAGE} : $@"; echo "${INFO}"; echo "${INFO}" >> progress.log; }
run() { log $@; $@; echo "$(ts) : ${STAGE} : $@ : status=$?"; }

STAGE=STAGE-2

rm -f ./pgdata/.empty

log "---------------------------------"
log "START (manual step)"
run make psql
log "DONE"
log "---------------------------------"
