

    Basics
    Tips
    Commands

SSH
Connect to host
$ ssh [user]@[host]
copy
Generate SSH key
$ ssh-keygen -b 4096
copy
Run a command and exit
$ ssh [user]@[host] [command]
copy
X11 Session Forwarding
$ ssh -X [user]@[host]
copy
TCP Port Forwarding
$ ssh -L [localPort]:[host]:[port] [user]@[host]
copy
SOCKS5 proxying
$ ssh -D 9999 [user]@[host]
copy
End session
$ exit
copy
$ logout
copy
$ (Ctrl-d)
copy
Push file
$ scp [localeFile] [user]@[host]:[remoteFile]
copy
Pull file
$ scp [remoteFile] [user]@[host]:.
copy
