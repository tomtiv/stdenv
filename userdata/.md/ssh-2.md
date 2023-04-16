# SSH

## KEYS

```shell
tail -f /var/log/secure
```
 might return:
Nov 23 12:31:26 raspberrypi sshd[9146]: Authentication refused: bad ownership or modes for directory /home/pi

```shell
chmod g-w $HOME
chmod 700 $HOME/.ssh
chmod 600 $HOME/.ssh/authorized_keys
```
OR
```shell
sudo chmod g-w $HOME && sudo chmod 700 $HOME/.ssh && sudo chmod 600 $HOME/.ssh/authorized_keys
```