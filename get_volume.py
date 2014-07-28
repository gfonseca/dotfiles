#!/usr/bin/env python2.7

import subprocess as sp
import re

stdout = sp.check_output(["amixer", "-D", "pulse", "get", "Master"])
regex = re.compile("Front Left: Playback \d+ \[(\d+)\%\] \[(on|off)\]")
ou = regex.search(stdout)
vol, is_on = ou.groups()
vol = int(vol)

if is_on == "off":
	print "^fg(orange)^i(/home/gfonseca/.config/herbstluftwm/icons/mute.xbm) ^fg(white)M"
elif vol <= 20:
	print "^i(/home/gfonseca/.config/herbstluftwm/icons/spkr_02.xbm) ^fg(white)%d%%" % vol
elif vol <= 100: 
	print "^i(/home/gfonseca/.config/herbstluftwm/icons/spkr_01.xbm) ^fg(white)%d%%" % vol

