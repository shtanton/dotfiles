setxkbmap -layout gb
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
exec bspwm
