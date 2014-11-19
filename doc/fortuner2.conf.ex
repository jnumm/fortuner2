# An example configuration file for Fortuner2

# Place the configuration file to ~/.config/fortuner2/fortuner2.conf or
# /etc/fortuner2.conf. It should follow the Bourne shell syntax.

# The title of the notification. For custom values, $(eval_gettext ... )
# is not needed.
#title="$(eval_gettext "Today's Fortune")"
#title="Today's Fortune for $USER"

# Fortune command.
#fortunecmd="fortune"
#fortunecmd="fortune -s -o"

# Notify command. Here you can specify parameters for the notify sending
# program.
#notifycmd="notify-send --icon=fortuner2 --urgency=low"
#notifycmd="$notifycmd --expire-time=10000"
