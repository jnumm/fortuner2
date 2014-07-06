# An example configuration file for Fortuner2

# Place the configuration file to ~/.config/fortuner2/fortuner2.conf or
# /etc/fortuner2.conf. It should follow the Bourne shell syntax.

# The title of the notification. For custom values, $(eval_gettext ... )
# is not needed.
# Default value:
#title="$(eval_gettext "Today's Fortune")"
# Example custom value:
#title="Today's Fortune for $USER"

# Fortune command.
# Default value:
#fortunecmd="fortune"
# Example custom value:
#fortunecmd="fortune -s -o"

# Notify command. Here you can specify parameters for the notify sending
# program.
# Default value (if notify-send >= 0.7.5 is detected, the string
# "--app-name=Fortuner" is appended to this):
#notifycmd="notify-send --icon=fortuner2 --urgency=low"
# Example custom value:
#notifycmd="$notifycmd --expire-time=10000"

# How many fortunes are shown.
# Default value:
#count=1
# Example custom value:
#count=2

# Time (in seconds) to sleep after displaying each fortune.
# Default value:
#delay=0
# Example custom value:
#delay=5
