#!/bin/bash

ts() { date -u +%Y%m%d-%H%M%S; }

log() { echo "$(ts) : ${STAGE} : $@" >> progress.log; }
run() { log $@; $@; }

STAGE=STAGE-1

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
