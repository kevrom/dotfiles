#pcmanfm -d &

#Set wallpaper
#hsetroot -tile ~/.background.png &

#Refresh Xresources
xrdb -load  /home/kevrom/.Xresources &

xmodmap /home/kevrom/.Xmodmap

#urxvtd &

#compton &

#mpd
#mpd ~/.config/mpd/mpd.conf &

#Add panel scripts:
#export PATH=$PATH:~/.config/bar

#check if existing socket exists and killl for bspwm(doesn't play nice with logging out and in)
rm /tmp/$(ls /tmp | grep bspwm)

#xsetroot -cursor_name left_ptr &

xset s off
xset -dpms

#start bspwm and sxhkd
#sxhkd -f 100 -c /home/kevrom/.config/sxhkd/sxhkdrc &
urxvt &
#exec bspwm -c /home/kevrom/.config/bspwm/bspwmrc > .xinit.log
exec i3
