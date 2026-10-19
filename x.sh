

# use xset -q to query


xset s off
xset s noblank
xset dpms 0 0 0

# may need to be last...!!!
xset -dpms

##############

xrandr --output eDP --brightness   0.33

# wpctl set-volume @DEFAULT_AUDIO_SINK@   0.5

# permissions for trusted
xhost + local:

##############


# keyboard repeat rate.
# ie. when holding down delete key.
xset r rate 200

# may not be needed.
# light-dm/ xmonad  may well read ~/.Xresources automatically
# but eliminating ~/.Xresources, and localizing config here may be preferred.

# consider heredoc
# xrdb -merge <<EOF
# XTerm*VT100*selectToClipboard: true
# XTerm*selectToClipboard: true
# XTerm*foreground: #ffffff
# EOF

xrdb -merge ~/.Xresources

# required keyboard mapping - for 'shift insert' to enable text copy/paste to xterm.
# consider use heredoc
# xmodmap - << 'EOF'
xmodmap -e "keycode 96 = Insert Insert"



