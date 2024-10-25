#!/bin/bash
make clean
make
make start-db
make import-data
make download area=planet
make import-osm
make import-wikidata
make import-sql
make generate-tiles-pg
make stop-db

