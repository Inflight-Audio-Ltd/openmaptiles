Replace `.env` and `openmaptiles.yaml` files in main dir with files from z0-z12 or z0-z6 (depending on which zoom levels you need).
Start screen or tmux session.

If normal (unmodified) maps are needed:
 * `sudo ./ifd-create-full.sh`

If modified maps are needed (with some names removed and/or renamed):
 * `sudo ./ifd-create-stage-1.sh`
 * `sudo ./ifd-create-stage-2.sh`
 * modify database (see an example below)
 * `sudo ./ifd-create-stage-3.sh`
