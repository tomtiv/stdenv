

# XFCE

sudo apt install -y xserver-xorg xfce4 xfce4-goodies
xfce4-whiskermenu-plugin
sudo systemctl get-default
sudo systemctl set-default graphical.target.
sudo dpkg-reconfigure lightdm
sudo update-alternatives --config x-session-manager
sudo update-alternatives --config x-window-manager
sudo nano /usr/share/lightdm/lightdm.conf.d/01_debian.conf
# sudo apt install -y firefox-esr thunderbird gimp inkscape libreoffice libreoffice-gtk3 libreoffice-gnome default-jdk
