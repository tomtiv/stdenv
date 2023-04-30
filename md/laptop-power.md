# Configure lid power settings:

## For the lid
sudo nano /etc/systemd/logind.conf
HandleLidSwitch=ignore 
HandleLidSwitchDocked=ignore

## For the Screen
sudo nano /etc/default/grub
GRUB_CMDLINE_LINUX_DEFAULT
GRUB_CMDLINE_LINUX
sudo update-grub
GRUB_CMDLINE_LINUX="consoleblank=300"


# TLP
https://linrunner.de/tlp/installation/ubuntu.html

sudo add-apt-repository ppa:linrunner/tlp
sudo apt update

sudo apt install tlp tlp-rdw

sudo systemctl enable tlp.service
tlp-stat -b
tlp-stat -s

bluetooth [ on | off | toggle ]
nfc [ on | off | toggle ]
wifi [ on | off | toggle ]
wwan [ on | off | toggle ]

bluetooth off
wifi off
wwan off

# Stress-NG
echo "ondemand" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
You can watch if your CPU frequencies are scaling in another window:
watch cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
sysbench wasn't available in the repo so I used stress-ng to make it scale.
apt install stress-ng
stress-ng --cpu 8 --cpu-method matrixprod --metrics-brief --perf -t 60

@reboot echo "ondemand" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
@reboot setterm -blank 1