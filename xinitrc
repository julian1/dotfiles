
xrdb -merge ~/.Xdefaults

# custom keys
if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

#
# should configure on one line...
#
#if true; then
#  # this can be confusing because xmonad won't open anything on the window
#  xrandr --auto --output DP1-1 --mode 1920x1200 --primary
#  xrandr --auto --output DP1-2 --mode 1280x1024 --right-of DP1-1
#  xrandr --output eDP1 --off
# desktop
#elif false; then
#
#  xrandr --auto --output eDP1 --brightness 0.8
#fi
#


# to turn on trackpad tap to select/button
synclient TapButton1=1

xset b off
# xset q | grep bell


xmonad




# xset -dpms; xset s off

