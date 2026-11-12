

# use xset -q to query


xset s off
xset s noblank
xset dpms 0 0 0

# may need to be last...!!!
xset -dpms


# keyboard repeat rate.
# ie. when holding down delete key.
xset r rate 200


##############

# xrandr --output eDP --brightness   0.33
xrandr --output eDP --brightness   0.9 # 1.0

# volume
# wpctl set-volume @DEFAULT_AUDIO_SINK@   0.6


# permissions for trusted
xhost + local:

##############


# may not be needed.
# light-dm/ xmonad  may well read ~/.Xresources automatically
# but may be better to eliminate ~/.Xresources, and localize here.


# alternative to
# xrdb -merge ~/.Xresources
# note - ~/.Xresource if it exists, may also be read by light-dm .

# use xrdb -query  to query
xrdb -merge <<EOF
XTerm*VT100*selectToClipboard: true
XTerm*selectToClipboard: true
! XTerm*foreground: #ffffff
EOF


# required keyboard mapping - for 'shift insert'
# to enable text copy/paste to xterm.
xmodmap -e "keycode 96 = Insert Insert"




