#!/usr/bin/env python2.7

import urllib2
import sys
import re
import os
import time
 

def request_emails():
	username = "***"
	password = "***"
	url = "https://mail.google.com/mail/feed/atom"

	passman = urllib2.HTTPPasswordMgrWithDefaultRealm()
	passman.add_password(None, url, username, password)
	urllib2.install_opener(urllib2.build_opener(urllib2.HTTPBasicAuthHandler(passman)))

	req = urllib2.Request(url)
	f = urllib2.urlopen(req)
	return f.read()

def parse_for_mails(xml):
	pattern = re.compile("<fullcount>(\d+)")
	tot_mails_pattern = pattern.search(xml)
	return tot_mails_pattern.groups()[0]

def update_file(now, file_mails):
	if not os.path.isfile("./mails.txt"):
		open("./mails.txt", "w").close()
	
	file_mails.seek(0,0)
	file_mails.truncate()
	xml = request_emails()
	tot_mails = parse_for_mails(xml)
	file_mails.write("%s=%s" % (now, tot_mails))	


if __name__=="__main__"
	now = int(time.time())
	file_mails = open("./mails.txt", "r+")
	txt_mails = file_mails.readline()

	if not txt_mails:
		update_file(now, file_mails)
	else:
		updated , tot_mails =  txt_mails.split("=")

		if now >= int(updated) + 10:
			update_file(now, file_mails)

	print "^fg(\#178FD1)^i(/home/gfonseca/.config/herbstluftwm/icons/mail.xbm) ^fg(white)%s" % tot_mails
