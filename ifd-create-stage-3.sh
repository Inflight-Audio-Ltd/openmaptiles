#!/bin/bash

ts() { date -u +%Y%m%d-%H%M%S; }

log() { INFO="$(ts) : ${STAGE} : $@"; echo "${INFO}"; echo "${INFO}" >> progress.log; }
run() { log $@; $@; echo "$(ts) : ${STAGE} : $@ : status=$?"; }

STAGE=STAGE-3

rm -f ./pgdata/.empty

log "---------------------------------"
log "START"
run make generate-tiles-pg
run make stop-db
log "DONE"
log "---------------------------------"
