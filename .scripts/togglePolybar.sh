bars=$(pgrep polybar)
length=$(printf "$bars" | grep -c '^')
echo $bars | xargs -r kill
if [ $length -eq 0 ]
then
	polybar main & polybar second
fi

