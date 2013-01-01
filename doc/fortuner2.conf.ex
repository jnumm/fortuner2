# Example configuration file for Fortuner2
# Copyright (C) 2013 Juhani Numminen <juhaninumminen0@gmail.com>
# Licensed under GPLv3+

# Place the configuration file to ~/.config/fortuner2/fortuner2.conf or
# /etc/fortuner2.conf. It should follow Bourne shell syntax.

title="Today's Fortune for ${USER}"
fortunecmd="fortune -a"
notifycmd="notify-send --icon=fortuner2 --urgency=normal"
