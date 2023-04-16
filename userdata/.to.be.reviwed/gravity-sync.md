Preparing the Pi-hole servers
To begin with, ensure all dependencies are installed. Most will already be installed but if not, we can catch them by running:

apt update && apt install sqlite3 sudo git rsync ssh
On both servers, we will need a service account with sudo privileges. Create this account by running the following command on each server:

sudo useradd -G sudo -m pi
sudo passwd pi
On some distros (e.g. CentOS), the privileged group is called wheel instead of sudo so you may need to adjust this command.

Install Gravity-Sync on the primary Pi-hole
Pick one of the servers to act as the primary and log in to it as the pi user account. Run the installer script:

export GS_INSTALL=primary && curl -sSL https://gravity.vmstan.com | bash
Install Gravity-Sync on the secondary Pi-hole
Log in to the other server as the pi account and run:

export GS_INSTALL=secondary && curl -sSL https://gravity.vmstan.com | bash
While the installer on the primary just verifies pre-requisites, the secondary needs additional configuration as it performs the active role of replication. When prompted, provide the name of the service account on the primary, the IP address of the primary and configure password-less SSH login.

Verify connectivity and enable synchronisation
On the secondary Pi-hole, navigate in to the gravity-sync directory and run:

./gravity-sync.sh compare
This should give you output similar to the below. It will not actually perform a sync but will verify connectivity and detect if a sync is required.

$ ./gravity-sync.sh compare
[∞] Initalizing Gravity Sync (3.4.5)
[✓] Loading gravity-sync.conf
[✓] Evaluating arguments: COMPARE
[i] Remote Pi-hole: pi@10.100.4.53
[✓] Connecting to 10.100.4.53of Pi-hole
[✓] Hashing the primary Domain Database
[✓] Comparing to the secondary Domain Database
[✓] Hashing the primary Local DNS Records
[✓] Comparing to the secondary Local DNS Records
[i] No replication is required at this time
[✓] Purging redundant backups on secondary Pi-hole instance
[i] 3 days of backups remain (11M)
[∞] Gravity Sync COMPARE aborted after 0 seconds
If the primary already has configuration but the secondary is a fresh install you will want to ensure that the first sync is a one-way sync from the primary to the secondary. If you don’t do this, the script may detect the configuration on the secondary as newer and overwrite the primary. To force a one way sync, run:

./gravity-sync.sh pull
Finally, enable automatic synchronisation by running:

./gravity-sync.sh automate
Set an update frequency from the available options. Setting a lower frequency will increase the risk of changes not syncing but will result in reduced server load so may be more appropriate on busy servers.

Synchronisation should now be working, if you do not want to configure IP failover the setup is now complete. If you have additional servers you want to keep in sync, use the steps for adding a secondary server.

Configure IP failover
Now our Pi-hole instances are in sync, we can configure IP failover to direct traffic towards the primary when it is available and switch over to the secondary if the primary ever fails. On both servers, install the required packages:

sudo apt install keepalived libipset13 -y
Next, we need to download a script on both servers to monitor the status of the pihole-FTL service so we can fail over if it ever stops running:

sudo mkdir /etc/scripts
sudo sh -c "curl https://pastebin.com/raw/npw6tcuk | tr -d '\r' > /etc/scripts/chk_ftl"
sudo chmod +x /etc/scripts/chk_ftl
Now, we need to add our keepalived configuration. On the primary, run:

sudo curl https://pastebin.com/raw/nsBnkShi -o /etc/keepalived/keepalived.conf
and on the secondary:

sudo curl https://pastebin.com/raw/HbdsUc07 -o /etc/keepalived/keepalived.conf
We now need to edit the configuration on both servers. On each server, set the following properties:

Property	Description	Example Server 1	Example Server 2
interface	The LAN network interface name. Run ip list to view available interfaces if you are unsure.	eth0	eth0
unicast_src_ip	The IP address of the server you are currently configuring.	192.168.1.21	192.168.1.22
unicast_peer	The IP address of the other server.	192.168.1.22	192.168.1.21
virtual_ipaddress	The virtual IP address shared between the 2 servers, provided in CIDR notation. This must be the same on both servers.	192.168.1.20/24	192.168.1.20/24
auth_pass	A shared password (max 8 characters). This must be the same on both servers	P@$$w05d	P@$$w05d
We are now ready to start and enable keepalived. On both servers, run:

systemctl enable --now keepalived.service
systemctl status keepalived.service



Open the /etc/sudoers file with the visudo command:

sudo visudo
Copy
When making changes to the sudoers file always use visudo. This command checks the file after editing, and if there is a syntax error it will not save the changes. If you open the file with a text editor, a syntax error will result in losing the sudo access.

On most systems, the visudo command opens the /etc/sudoers file with the vim text editor. If you don’t have experience with vim you can use another text editor. For example, to change the editor to GNU nano you would run:

sudo EDITOR=nano visudo
Copy
Scroll down to the end of the file and add the following line that will allow the user “linuxize” to run any command with sudo without being asked for a password:

/etc/sudoers
linuxize  ALL=(ALL) NOPASSWD:ALL
Copy
Do not forget to change “linuxize” with the username you want to grant access to.
If you want to allow the user to run only specific commands without entering password specify the commands after the NOPASSWD keyword.
For example, to allow only the mkdir and mv commands you would use:
/etc/sudoers
linuxize ALL=(ALL) NOPASSWD:/bin/mkdir,/bin/mv
Copy
Once done, save the file and exit the editor .

Using /etc/sudoers.d
Instead of editing the sudoers file you can create a new file with the authorization rules in the /etc/sudoers.d directory. This approach makes the management of the sudo privileges more maintainable.

Open your text editor and create the file:
sudo nano /etc/sudoers.d/linuxize
Copy
You can name the file as you want, but usually, it is a good idea to use the user name as the name of the file.

/etc/sudoers.d/linuxize
Add the same rule as you would add to the sudoers file:

linuxize  ALL=(ALL) NOPASSWD:ALL