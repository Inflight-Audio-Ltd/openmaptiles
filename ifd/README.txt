Replace `.env` and `openmaptiles.yaml` files in main dir with files from z0-z12 or z0-z6 (depending on which zoom levels you need).
Start screen or tmux session.

If normal (unmodified) maps are needed:
 * `sudo ./ifd-create-full.sh`

If modified maps are needed (with some names removed and/or renamed):
 * `sudo ./ifd-create-stage-1.sh`
 * `sudo ./ifd-create-stage-2.sh`
 * modify database (see an example below)
 * `sudo ./ifd-create-stage-3.sh`

Removing "Israel" name from the map:
During the stage 2 (see above) a PSQL console is started.
Following operations are required to remove a name from the database (and thus from the resulting tiles file):
 * `\c openmaptiles`

 * `DELETE FROM ne_10m_admin_0_countries WHERE name_en='Israel';`
 * `DELETE FROM osm_country_point WHERE name_en='Israel';`
 * `DELETE FROM wd_names WHERE labels -> 'name:en' = 'Israel';`

 * `DELETE FROM ne_10m_admin_1_states_provinces WHERE name_en='Abkhazia';`
 * `DELETE FROM osm_country_point WHERE name_en='Abkhazia' OR name_en = 'South Ossetia';`
 * `DELETE FROM wd_names WHERE labels -> 'name:en' = 'Abkhazia' OR labels -> 'name:en' = 'South Ossetia';`

Changing different names in the map requires other changes in the database.
This requires further investigation.
