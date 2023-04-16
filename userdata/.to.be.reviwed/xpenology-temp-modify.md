 How to increase the shutdown temperature on Synology NAS
synology-shutdown-temperature.md
Synology: how to increase shutdown temperature

My Synology DS218+ runs with a single SSD disk that has an operating temperature range of 0–70 °C, which is common for SSDs. Synology, however, has a default shutdown temperature of 61 °C, probably due to HDDs and some lazy programming.

I'm a very light user of NAS – all I want is a network attached storage and silence. My DS218+ has one 2 TB SSD disk in it and I've changed the system fan for a quieter / slower one.

Everything runs fine but about once in a month, I get this notification:

    [Synology DS218+]Synology shut down due to disk overheating.

    Synology shut down automatically, because disk 1 was overheating and reached a temperature of 61°C.

That's really annoying as I have to attend the NAS and turn it on manually. BTW, it happens during longer I/O workloads where my disk usually operates between 58 and 60 °C, so very close to the shutdown threshold; a warmer day is enough to trigger it.

I've contacted Synology support to see if they have any solution for it, but they don't (except for purchasing an officially supported SSD from their compatibility list).

But it's possible to tweak the disk station to support higher shutdown temperatures. Here is how to do it (I wrote this for my specific user account, host name etc.):
1. Enable SSH, log in

    Log in to http://synology.local:5000/.
    In Control Center > Terminal & SNMP, tick Enable SSH service.
    Make sure the user is in the administrators group.
    From a local computer, log in with ssh borekb@synology.local and provide the password.

2. Update the scemd.xml file

I'm not that comfortable with vi / vim so I've copied the file to the local machine:

ssh borekb@synology.local 'cat /usr/syno/etc.defaults/scemd.xml' > scemd.xml

In the XML file, the first two <fan_config> sections marked DUAL_MODE_HIGH and DUAL_MODE_LOW are important:

    DUAL_MODE_HIGH is for the "cool mode" (i.e., when Synology keeps things cooler at the expense of noise)
    DUAL_MODE_LOW = "quiet mode"

I've updated the "low mode" only, like this:

<?xml version="1.0" encoding="UTF-8"?>
<scemd>
  <fan_config hibernation_speed="UNKNOWN" type="DUAL_MODE_LOW" threshold="6" period="20">
-   <disk_temperature action="NONE" fan_speed="20%40hz">0</disk_temperature>
-   <disk_temperature action="NONE" fan_speed="30%40hz">46</disk_temperature>
-   <disk_temperature action="NONE" fan_speed="50%40hz">50</disk_temperature>
-   <disk_temperature action="NONE" fan_speed="70%40hz">54</disk_temperature>
-   <disk_temperature action="NONE" fan_speed="99%40hz">58</disk_temperature>
-   <disk_temperature action="SHUTDOWN" fan_speed="99%40hz">61</disk_temperature>
+   <disk_temperature action="NONE" fan_speed="20%40hz">0</disk_temperature>
+   <disk_temperature action="NONE" fan_speed="30%40hz">50</disk_temperature>
+   <disk_temperature action="NONE" fan_speed="50%40hz">55</disk_temperature>
+   <disk_temperature action="NONE" fan_speed="70%40hz">62</disk_temperature>
+   <disk_temperature action="NONE" fan_speed="99%40hz">66</disk_temperature>
+   <disk_temperature action="SHUTDOWN" fan_speed="99%40hz">71</disk_temperature>

    <cpu_temperature action="NONE" fan_speed="20%40hz">0</cpu_temperature>
    <cpu_temperature action="NONE" fan_speed="50%40hz">65</cpu_temperature>
    <cpu_temperature action="NONE" fan_speed="99%40hz">80</cpu_temperature>
    <cpu_temperature action="SHUTDOWN" fan_speed="99%40hz">90</cpu_temperature>
  </fan_config>
  <!-- Etc. -->
</scemd>

📋 Copy-paste-friendly snippet

cat /sys/class/thermal/thermal_zone*/type 
cat /sys/class/thermal/thermal_zone*/temp 
drwxr-xr-x  2 root root 0 Aug  8 02:12 .
drwxr-xr-x 60 root root 0 Aug  8 02:12 ..
lrwxrwxrwx  1 root root 0 Aug  8 02:12 cooling_device0 -> ../../devices/virtual/thermal/cooling_device0
lrwxrwxrwx  1 root root 0 Aug  8 02:12 cooling_device1 -> ../../devices/virtual/thermal/cooling_device1
lrwxrwxrwx  1 root root 0 Aug  8 02:12 cooling_device2 -> ../../devices/virtual/thermal/cooling_device2
root@ds:/sys/class/thermal# cat cooling_device0


 cp /var/services/homes/cman/new-tt-scemd.xml /usr/syno/etc.defaults/new-tt-scemd.xml

# MY SECTION 
<fan_config period="20" threshold="6" type="DUAL_MODE_HIGH" hibernation_speed="UNKNOWN">
    <disk_temperature fan_speed="20%90hz" action="NONE">0</disk_temperature>
    <disk_temperature fan_speed="30%90hz" action="NONE">41</disk_temperature>
    <disk_temperature fan_speed="50%90hz" action="NONE">50</disk_temperature>
    <disk_temperature fan_speed="70%90hz" action="NONE">55</disk_temperature>
    <disk_temperature fan_speed="99%00hz" action="NONE">60</disk_temperature>
    <disk_temperature fan_speed="99%00hz" action="SHUTDOWN">71</disk_temperature>

# OTHERS SECTION
<disk_temperature action="NONE" fan_speed="20%40hz">0</disk_temperature>
<disk_temperature action="NONE" fan_speed="30%40hz">50</disk_temperature>
<disk_temperature action="NONE" fan_speed="50%40hz">55</disk_temperature>
<disk_temperature action="NONE" fan_speed="70%40hz">62</disk_temperature>
<disk_temperature action="NONE" fan_speed="99%40hz">66</disk_temperature>
<disk_temperature action="SHUTDOWN" fan_speed="99%40hz">71</disk_temperature>

My disk operates at around 45–50 °C normally (it can be seen in the Storage Manager) so I've only messed with temperatures above that. Full fan speed kicks in at 66 °C and the system shuts down at 71 °C.

With the file done, save it back to Synology – first upload it to some writable directory like ~:

cat scemd.xml | ssh your-user@synology.local 'cat -> ~/scemd.xml'

Then, from an SSH session:

# Become a root
borekb@Synology:~$ sudo -i
Password:

# Move file to its proper location
root@Synology:~# mv /var/services/homes/borekb/scemd.xml /usr/syno/etc.defaults/scemd.xml

Lastly, update the etc/scemd.xml file:

cp /usr/syno/etc.defaults/scemd.xml /usr/syno/etc/scemd.xml

3. Restart the scemd service

From the SSH session:

synoservice --restart scemd

Or just restart the whole NAS.
Useful resources

    https://community.synology.com/enu/forum/17/post/82880
    https://return2.net/how-to-make-synology-diskstation-fans-quieter/

@priiduneemre
priiduneemre commented on Jul 25, 2021 •

Nice, thanks for the useful info.

Used this for the reverse purpose, i.e. to make sure my drives don't die.

Some crazy temperatures hitting Europe (and elsewhere) for the past month or so.
@priiduneemre
priiduneemre commented on Nov 6, 2021 •

Note to self: these changes may need to be re-applied on every DSM system upgrade (which makes sense).
@bpatram
bpatram commented on Apr 30

I think the final step to restart the scemd service has changed in DSM 7. If the synoservice command doesn't exist, try: synosystemctl restart scemd
@egzakharovich
egzakharovich commented on Jun 3

There is lines for SSD cache temperatures also in /usr/syno/etc.defaults/scemd.xml. Which solved my problem with M.2 cache heating. Because I've placed a copper radiator on it and it can take up to 90 celsius by specification instead of default 70.
And also... It's summertime. It will overheat anyway.
Thank you.
