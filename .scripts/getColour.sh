active=$(systemctl is-active $1 |\
	awk '{print $0=="active" ? "#0F0" : "#F00"}')

echo $active
