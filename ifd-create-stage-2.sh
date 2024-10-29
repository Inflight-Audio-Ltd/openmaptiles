#!/bin/bash

ts() { date -u +%Y%m%d-%H%M%S; }

log() { echo "$(ts) : ${STAGE} : $@" >> progress.log; }
run() { log $@; $@; }

STAGE=STAGE-2

log "---------------------------------"
log "START (manual step)"
run make psql
log "DONE"
log "---------------------------------"
