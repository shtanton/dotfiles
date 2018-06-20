RESOURCES=/home/charlie/.scripts/resources
colour1=$(awk '/colour8/{print $2}' $RESOURCES/colours)
colour2=$(awk '/colour1 /{print $2}' $RESOURCES/colours)

cat $RESOURCES/background.svg |\
	awk '{gsub("colour1", "'$colour1'");gsub("colour2", "'$colour2'");print}' |\
	display -window root
