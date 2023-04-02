#!/usr/bin/fish

hsetroot -cover $(xdg-user-dir)/Pictures/Wallpapers/$(ls $(xdg-user-dir)/Pictures/Wallpapers | shuf -n1)
