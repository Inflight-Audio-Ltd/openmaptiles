Replace `.env` and `openmaptiles.yaml` files in main dir with files from z0-z12 or z0-z6 (depending on which zoom levels you need).
Start screen or tmux session.
Run `sudo ifd-create-normal.sh` script.

If modified maps are needed (with some names removed and/or renamed), start `ifd-create-modified-1.sh` script.
At the end of pre-processing, psql console will start. You may change records in the DB.
Once completed run `ifd-create-modified-2.sh` to finish tiles generation.

