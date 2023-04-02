#!/bin/sh

DISPLAY=:0 XDG_RUNTIME_DIR=/run/user/30034 XAUTHORITY=/home/insanity/.Xauthority DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$UID/bus SHELL=/bin/fish PATH=/nix/var/nix/profiles/default/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl exec "$@"
