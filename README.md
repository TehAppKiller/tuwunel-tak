# tuwunel-tak
[![tuwunel-tak](https://snapcraft.io/tuwunel-tak/badge.svg)](https://snapcraft.io/tuwunel-tak)
![snap arch](https://badgen.net/snapcraft/architecture/tuwunel-tak)
![snap size](https://badgen.net/snapcraft/size/tuwunel-tak/amd64/stable)

## Snap Description
UnOfficial release of Tuwunel\
https://snapcraft.io/tuwunel-tak

## Tuwunel Description
<img src="/icon.svg" width="100">
Tuwunel is a featureful Matrix homeserver.
  
You can use it instead of Synapse with your favorite client, bridge or bot. It is written entirely in Rust to be a scalable, low-cost, enterprise-ready, community-driven alternative, fully implementing the Matrix Specification for all but the most niche uses.
This project is the official successor to conduwuit after it reached stability. Tuwunel is now used by many companies with a vested interest in its continued development by full-time staff. It is primarily sponsored by the government of Switzerland 🇨🇭 where it is currently deployed for citizens.

See https://github.com/matrix-construct/tuwunel for more details.

## Information
The API service is accessible by default at http://localhost:8008

Tuwunel Release\
Service is restarted on any condition.

Post install command to check if service is running well and responses:
```
sudo snap logs tuwunel-tak
```

Post install commands to access `/media` and `/mnt` folders, see resources, if your database or any other file need to be stored outside the snap data area:
```
sudo snap connect tuwunel-tak:removable-media
sudo snap connect tuwunel-tak:mount-observe
```

**!!! Files can only be written in a directory owned by `root` !!!**\
**!!! `/home` base directory content is not readable !!!**

This is due to current behavior and restrictions of snaps by Canonical.\
Check common doc in FAQ if you want to setup data in `/home` directory.

## How to access Configuration file
1. Accessible through `/var/snap/tuwunel-tak/current/etc/tuwunel/tuwunel.toml` with default snapd installation

2. You can access the snap in shell mode and edit the file with Vim:
```
sudo snap run --shell tuwunel-tak.tuwunel
vi $SNAP_DATA/etc/tuwunel/tuwunel.toml
```
One help sheet of Vim commands available [here](https://devhints.io/vim).

## Minimal configuration
### Database
* (Recommended) Store your database in `$SNAP_COMMON` which is accessible through simlink "/var/common"
`database_path = "/var/common/var/lib/tuwunel"` ; your database will be saved in `"$SNAP_COMMON/var/lib/tuwunel"`

* (NOT recommended) To store your database in `$SNAP_DATA`, do not use first slash:
`database_path = "var/lib/tuwunel"` # your database will be saved in `"$SNAP_DATA/var/lib/tuwunel"` this way

* `$SNAP_COMMON` is the common data kept for each new release of the snap ; `$SNAP_DATA` is data copied from current snap release to the new one

* (Alternative) To store your database in `/home` folder, do not forget to connect "removable-media", and read common documentation

### Other parameters
* New user registration is disabled by default (cf. @'allow_registration')
* etc...
* Please read the toml-integrated doc and Tuwunel official doc

### Apply Configuration
To restart the service with new configuration, use the command:
```
sudo snap restart tuwunel-tak
```
  
## Configuration information
Configuration file is automatically created if not found in "$SNAP_DATA/etc/tuwunel/" ; copied from original source configuration file.\
Configuration file is never updated (for now) ; if changes are required with new software release, it is your full responsibility to update it (for now).

## FAQ
See my common doc about [FAQ](https://github.com/TehAppKiller/Snapcraft-common-doc/tree/main#FAQ).

## Building
See my common doc about [building a snap](https://github.com/TehAppKiller/Snapcraft-common-doc/tree/main#Building).

## Versionning
See my common doc about [versionning](https://github.com/TehAppKiller/Snapcraft-common-doc/tree/main#Versionning).
