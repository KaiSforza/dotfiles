# -*- coding: utf-8 -*-

#import subprocess

from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Tue 30 Jul 11:59:46 PM KW31
#                          ^-- calendar week
status.register("clock",
                format="%Y/%m/%d %H:%M:%S ",)

# Shows the average load of the last minute and the last 5 minutes
# (the default value for format is used)
status.register("load",
                format="{avg1}:{avg5}:{avg15}")

# Shows your CPU temperature, if you have a Intel CPU
status.register("temp",
                format="{temp:.0f}°C",)

# The battery monitor has many formatting options, see README for details

# This would look like this, when discharging (or charging)
# d:14.22W[77.81%](2h:41m)
# And like this if full:
# f:14.22W[91.21%]()
#
# This would also display a desktop notification (via dbus) if the percentage
# goes below 5 percent while discharging. The block will also color RED.
status.register("battery",
                format="{status}:{consumption:.2f}W"
                "\[{percentage_design:.2f}%\]"
                "({remaining:%E%H:%M:%S})",
                alert=True,
                alert_percentage=5,
                status={
                    "DIS": "d",
                    "CHR": "c",
                    "FULL": "f"},
                )

# Shows the address and up/down state of eth0. If it is up the address is shown
# in
# green (the default value of color_up) and the CIDR-address is shown
# (i.e. 10.10.10.42/24).
# If it's down just the interface name (eth0) will be displayed in red
# (defaults of format_down and color_down)
#
# Note: the network module requires PyPI package netifaces-py3
status.register("network",
                interface="enp0s25",
                format_up="{interface}:{v4}",)

# Has all the options of the normal network and adds some wireless specific
# things
# like quality and network names.
#
# Note: requires both netifaces-py3 and basiciw
status.register("wireless",
                interface="wlp3s0",
                format_up="{interface}:{essid} {v4} {quality:03.0f}%",)

# Run the status bar
status.run()
