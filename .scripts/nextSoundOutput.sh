sink=$(pacmd list-sinks |\
	grep index |\
	awk 'NR==1{x=$0}{print}END{print x}' |\
	awk 'x{print $2; x=0}/\*/{x=1}')

pacmd set-default-sink $sink

pacmd list-sink-inputs |\
	awk '/index/{print $2}' |\
	xargs -I{} pacmd move-sink-input {} $sink

desc=$(pacmd list-sinks |\
	awk '/\*/{x=1}x&&/device\.description/{print $3; x=0}')

paplay ~/.sounds/to-the-point.ogg
