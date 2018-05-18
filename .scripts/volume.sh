sink=$(pacmd list-sinks |\
	awk '/\*/{print $3}')

pactl set-sink-volume $sink $1
