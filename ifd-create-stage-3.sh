#!/bin/bash

ts() { date -u +%Y%m%d-%H%M%S; }

log() { echo "$(ts) : ${STAGE} : $@" >> progress.log; }
run() { log $@; $@; }

STAGE=STAGE-3

rm -f ./pgdata/.empty

log "---------------------------------"
log "START"
run make generate-tiles-pg
run make stop-db
log "DONE"
log "---------------------------------"
