# VNC SERVER

sudo apt install tightvncserver -y
vncserver
echo "startxfce4 &">>~/.vnc/xstartup

nano ~/startvnc.sh

!/bin/bash
vncserver -kill :1 > /dev/null 2>&1
rm -f /tmp/.X1-lock
rm -f /tmp/.X11-unix/X1
vncserver -geometry 1920x1080

chmod u+x ~/startvnc.sh

~/startvnc.sh