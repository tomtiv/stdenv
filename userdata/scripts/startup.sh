//192.168.0.13/Media /mnt/nas/media cifs credentials=/home/tomtiv/.smbcredentials,ver=3.0,iocharset=utf8,sec=ntlm 0 0
//192.168.0.13/V1 /mnt/nas/v1 cifs credentials=/home/tomtiv/.smbcredentials,ver=3.0,iocharset=utf8,sec=ntlm 0 0
//192.168.0.13/Software /mnt/nas/software cifs credentials=/home/tomtiv/.smbcredentials,ver=3.0,iocharset=utf8,sec=ntlm 0 0

//192.168.0.13/Media /mnt/nas/media cifs credentials=/home/tomtiv/.smbcredentials,vers=3.0,file_mode=0755,dir_mode=0755 0
//192.168.0.13/Software  /mnt/nas/software  cifs  credentials=/home/tomtiv/.smbcredentials,vers=3.0,file_mode=0755,dir_mode=0755 0
//192.168.0.13/Software  /mnt/nas/software  cifs  credentials=/home/tomtiv/.smbcredentials,vers=3.0,file_mode=0755,dir_mode=0755 0       0
//192.168.0.13/Media /mnt/nas/media cifs credentials=/home/tomtiv/.smbcredentials,ver=3.0,iocharset=utf8,sec=ntlm 0 0

sudo mount -t cifs -o username=tomtiv password=myponyFr33d011 //192.168.0.13/Media /media

//192.168.0.13/Media/tv /media cifs credentials=/home/tomtiv/.smbcredentials,vers=3.0,file_mode=0755,dir_mode=0755 0
//192.168.0.13/Media/disc /media cifs credentials=/home/tomtiv/.smbcredentials,vers=3.0,file_mode=0755,dir_mode=0755 0
//192.168.0.13/Media/dvd /media cifs credentials=/home/tomtiv/.smbcredentials,vers=3.0,file_mode=0755,dir_mode=0755 0
//192.168.0.13/Media/other /media cifs credentials=/home/tomtiv/.smbcredentials,vers=3.0,file_mode=0755,dir_mode=0755 0
//192.168.0.13/Media/disney /media cifs credentials=/home/tomtiv/.smbcredentials,vers=3.0,file_mode=0755,dir_mode=0755 0


StartUp Script
*******************
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi

xset s off
xset -dpms
xset s noblank
unclutter -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences
chromium-browser --alsa-output-device=default --noerrordialogs --disable-infobars --app=http://10.0.0.2:8999


Another thing I did was turn off the swap partition. Chrome will take up all the ram it can get, and more! I found that after 24 hours, my swap partition was 100% full. Disabling the swap partition didn't negativly affect this already slow machine. Chrome works just fine without having access to ALL THE RAM!!

sudo dphys-swapfile swapoff
sudo systemctl disable dphys-swapfile
Lastly, I set the alsamixer to a good volume, and set it to restore on boot.

alsamixer
sudo alsactl store


scp ~/Downloads/client_secret_*.json <username>@<device-ip-address>:</path/to/assistant-sdk/project>
password: password-for-device
******************


#BK Magic MIrror Dri 
sudo rsync -a MagicMirror MagicMirror-bk

# Upload Config
sudo scp D:\dev\MagicMirror\config\config.js  192.168.0.8:/home/tomtiv/MagicMirror/config/config.js

#Upload to ubu
sudo scp D:\dev\MagicMirror  192.168.0.17:/home/docker/MagicMirror/

# change owner
sudo chown -R tomtiv ~/MagicMirror/config

git clone https://github.com/Bee-Mar/mmpm.git && cd mmpm && make && echo "export PATH=$PATH:$HOME/.local/bin" $HOME/.bashrc && source ~/.bashrc
 
 sudo git clone https://github.com/huashengdun/webssh.git
 
 docker run -d --publish 8181:8080 --restart=always --volume /home/docker/magic_mirror/css/custom.css:/opt/magic_mirror/css/custom.css --volume /home/docker/magic_mirror/config:/opt/magic_mirror/config --volume /home/docker/magic_mirror/modules:/opt/magic_mirror/modules --name magic_mirror bastilimbach/docker-magicmirror
 
 sudo systemctl enable plexmediaserver.service
runsudo systemctl start plexmediaserver.service

docker run  d publish 8181:8080 --restart always --volume ~/magic_mirror/config:/opt/magic_mirror/config --volume ~/magic_mirror/modules:/opt/magic_mirror/modules \
    --volume /etc/localtime:/etc/localtime:ro \
    --name magic_mirror
    bastilimbach/docker-magicmirrordocker run  -d \
    --publish 80:8080 \
    --restart always \
    --volume ~/magic_mirror/config:/opt/magic_mirror/config \
    --volume ~/magic_mirror/modules:/opt/magic_mirror/modules \
    --volume /etc/localtime:/etc/localtime:ro \
    --name magic_mirror \
    bastilimbach/docker-magicmirror

DISPLAY=:0 nohup  & node clientonly --address 192.168.0.17 --port 8181 

sudo ufw allow proto tcp from 192.168.0.1/24 to any port 80,443,8080,8181,8282

sudo scp D:\dev\MagicMirror  192.168.0.17:/home/docker/MagicMirror/