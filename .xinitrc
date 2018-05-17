setxkbmap -layout gb -option ctrl:swapcaps
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
exec bspwm
