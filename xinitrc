
xrdb -merge ~/.Xdefaults

# custom keys
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi


# screen 
#xrandr --output VGA1 --mode 1920x1200
#xrandr --output LVDS1 --off

# to turn on trackpad tap to select/button 
synclient TapButton1=1

xset b off 
# xset q | grep bell

xrandr --output eDP1 --brightness 0.7 

xmonad




# xset -dpms; xset s off

