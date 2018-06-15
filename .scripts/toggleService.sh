sudo /usr/bin/systemctl $(systemctl is-active $1 |\
	awk '{print $0=="active" ? "stop" : "start"}') \
	$1
