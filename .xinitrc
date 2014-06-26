sxhkd &
urxvt &
exec bspwm
panel &

xmodmap ~/.Xmodmap
xcape -e 'Control_L=Escape'

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
