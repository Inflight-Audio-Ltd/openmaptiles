#!/bin/bash

ts() { date -u +%Y%m%d-%H%M%S; }

log() { INFO="$(ts) : ${STAGE} : $@"; echo "${INFO}"; echo "${INFO}" >> progress.log; }
run() { log $@; $@; echo "$(ts) : ${STAGE} : $@ : status=$?"; }

STAGE=STAGE-1

rm -f ./pgdata/.empty

log "---------------------------------"
log "START"
run make clean
run make
run make start-db
run make import-data
run make download area=planet
run make import-osm
run make import-wikidata
run make import-sql
log "DONE"
log "---------------------------------"
