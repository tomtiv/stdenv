


cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
powersave performance userspace 

grep "MHz" /proc/cpuinfo

/usr/local/etc/rc.d/cpu-power.sh





 

Attention:

If you have an Intel based CPU, make sure that the power setting options in your BIOS is set to ‘OS Controlled‘. In case of the HP Gen 8 micro server, save this setting as ‘User default‘ or else the bios reset bug will reset it at reboot.

 

 

Check power state

Before installing the script, let’s check your current CPU power state.

1-Start a SSH session to your NAS and login as ‘root‘.

2-Type the following command:

grep "MHz" /proc/cpuinfo

 

and press Enter.

3-Example output of an AMD 2 core processor (HP N54L):

cpu MHz         : 2196.380
cpu MHz         : 2196.380

 

4-What this shows is that your cores are running at max power and thus using max power consumption.

5-Now that we know this we can use the script to bring power state level down to save power. Once the script is enabled the power states are automatically toggled according to the load of the CPU.

 

 

Installation:

1-Download the script for AMD or Intel from the DSM software page, under the Scripts section.

S99PowersavingAMD.zip

http://uloz.to/xXvu2WX2/s99powersavingamd-zip

 

S99PowersavingINTEL.zip

http://uloz.to/xbdrT8xC/s99powersavingintel-zip

 

2-Download and install WinSCP and make a connection to your NAS. Start ‘WinSCP‘ and start a new connection with protocol ‘SCP‘. Enter the ip address or hostname of your NAS and login as ‘root‘. Click on ‘Login‘ and fill in your password.

winscp.png

3-Upload the script to the

/usr/local/etc/rc.d/

 

directory.

Win_SCP.jpg

4-Right click on the script and choose ‘Properties‘ and give it ‘Execution‘ rights for the owner. Octal : 0744

Win_SCP-2.jpg

5-Close WinSCP.

6-There is a possibility that after your disk are woken up from hibernation that the power state is overwritten. To fix this you can make an adjustment in crontab that runs the script say every 15 minutes.

7-Start a SSH session to your NAS and login as ‘root‘.

8-Type the following command:

vi /etc/crontab

 

9-Go to the end of the last line, press ‘Insert‘, press ‘Right arrow‘ and press ‘Enter‘. This will get you on the next line.

crontab1.jpg

10-Type the following command and use ‘Tab‘ for spacing and use the correct script name accordingly:

*/15 * * * * root /usr/local/etc/rc.d/S99PowersavingAMD.sh

 

crontab21.jpg

11-Press ‘Esc‘ and type ‘:wq‘.

12-Reboot your NAS.

 

 

Check power state again

1-After the reboot start a SSH session to your NAS and login as ‘root‘.

grep "MHz" /proc/cpuinfo


3-Example output of an AMD 2 core processor (HP N54L) after applying the script:
cpu MHz         : 800.000
cpu MHz         : 800.000

4-This result shows current power state under no load. When CPU load increases, the power states automatically toggle up so that your CPU runs at higher frequencies. When CPU load decreases, the power state is adjusted accordingly down, saving energy.

5-If you want to check if the power state has changed after waking up from hibernation type the following command in SSH:

cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

 

If the answer is ‘performance’ that means the governor has been changed. If you check again in a few more minutes (maximum 15) it should revert to ‘conservative‘ due to the crontab schedule.
