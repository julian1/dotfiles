

# use xset -q to query


xset s off
xset s noblank
xset dpms 0 0 0

# may need to be last...!!!
xset -dpms

##############

xrandr --output eDP --brightness   0.33

# permissions for trusted
xhost + local:

##############


# keyboard repeat rate.
# eg. for holding down delete key.
xset r rate 200

# may not be needed.
# or done automatically be light-dm/ xmonad
xrdb -merge ~/.Xresources

# required mapping - for 'shift insert' to copy text into xterm.
xmodmap -e "keycode 96 = Insert Insert"



