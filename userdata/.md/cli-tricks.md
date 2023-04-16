

Search command history for query.
$ history | grep [query]

or press ctrl + r to search and execute commands from the history.
Close a frozen window/application
Execute the command and click on the frozen window.
$ xkill # x11 window

Or find the process id of an application and kill it.
$ ps ax |  grep firefox
[processID] ?? S 0:00.22 firefox
$ kill [processID]

Tab Completion
This might save you a lot of time. If you e.g. want to delete a file with a very long name you can type the first few characters of the name and press TAB to auto complete the name. If there are more then one possibilities and you press TAB twice you get a list of all possibilities.
Temporary aliases
Save yourself time and create aliases for your most used commands. Aliases are like custom shortcuts.
$ alias [name]="[command]"

Example: Find out your external ip.
$ alias publicip=" curl ifconfig.me"

Permanent aliases
Use aliases between sessions or even distros.
Bash	
$ vim ~/.bashrc

ZSH	
$ vim ~/.zshrc

Fish	
$ vim ~/.config/fish/config.fish

Find a place in the file, where you want to keep the aliases. Usually you find them at the end of the file.
# My shortcuts
$ alias h="history"

Chain commands
Automatically execute several commands in a row. Regardless of whether one of the commands fails:
$ command1 ; command2 ; command3

Separated by double ampersands, the next command is executed only if the previous one was executed successfully.
$ command1 && command2

Command syntax
To find out the syntax of a command, it is best to check the manual page:
$ man [command]

If there is no man page on your system, which hardly ever happens, you can check if the command has a help page in the most common way:
$ [command] --help

A very useful tool that gives you general examples of how to use commands is TLDR.
$ tldr [command]

Cursor navigation
ctrl + u = Clear everything before the cursor
ctrl + a = To beginning of line
ctrl + e = To end of line
ctrl + f = Forward one character
ctrl + b = Back one character
ctrl + w = Cut last word
ctrl + k = Clear everything after cursor
ctrl + _ = Undo
meta + f Forward one word
meta + b Back one one word
Redirection
You can redirect standard input, output and error by adding these sequences after a command.
>	send output to file (overwriting and destroying whatever is in the file already)
	
$ echo "Write output to file" > example.txt

>>	append output to file
	
$ echo "Append this to file" >> example.txt

<	take input from file
	
$ cowsay < example.txt

2>	send error messages to file (overwriting). (This means that errors can be directed separately from normal output.)
	
$ rm -vf folder1 file1 > out.txt 2> err.txt

Special characters in commands
Shell special characters are interpreted by the shell as soon as it is given the command. For example, if you type ls *.bak, the shell translates *.bak to the list of all files in the current folder whose names end in .bak. The ls command never sees the asterisk. So if you want to search for files which actually have an asterisk in their names, you have to escape the asterisk to stop the shell from interpreting it.
\	escapes itself and other specials
*	stands for anything (including nothing)
	
$ find ex*.txt

?	stands for any single character
	
$ find ex?mple.txt

[]	encloses patterns for matching a single character
	
$ find ex[abc]mple.txt

()	runs the contents of the parentheses in a sub-shell
	
$ pwd && ( cd /etc) &&  pwd
/home/simon
/home/simon

;	terminates a command pipeline - use it to separate commands on a single line
	
$ echo Hi ;  uname
Hi
Linux

' '	The contents of the single quotes are passed to the command without any interpretation.
	
$ find '(echo abc)'*
(echo abc).txt

` `	The contents of the backquotes are run as a command and its output is used as part of this command
	
$ echo ` uname` Linux

""	The contents of the quotes are treated as one argument; any specials inside the quotes, except for $ and ``, are left uninterpreted.
	
$ cd "untitled folder"

|	Pipes allow you to send the output of a command to another command.
	
$ fortune |  cowsay

&	Run a command in the background.
	
$ cowsay &

&&	Only execute the second command if the first one was successful.
	
$ ping localhost -c 1 &&  cowsay great

||	Only execute the second command if the first one was unsuccessful.
	
$ ping "not.reachable" -c 1 ||  cowsay sorry

>>	These symbols are used for redirection.
!!	Repeat the last command
	
$ sudo !!

!*	Change command keep all arguments
	
$ head  history |  grep query
$ !*  tail
 tail  history |  grep query

^	Quick history substitution, changing one string to another.
	
$ ls *.png
toast.png
$ ^png^xcf^
 ls *.xcf
bread.xcf

#	Turns the line into a comment; the line is not processed in any way.
	
$ whatis  xdotool # hint: has sth todo with X11

Don't confuse shell special characters with special characters in regular expressions. Regular expressions must be protected from the shell by enclosing them in single quotes.
View file permissions
$ ls -l [file]

1 = File type: \'-\' for a regular file, \'d\' for a directory, \'l\' for a symbolic link.
2 = Owner permission
3 = Group permission
4 = Other permission
In the shown example the user has read, write and execute permission but the group and other has only read permissions.
Modify file permissions
$ chmod [modification] [file]

Example: Give the group read and write access to the test.txt file.
$ chmod g+rw test.txt

Permission groups:
u = Owner
g = Group
o = Other
Permission types:
r = Read
w = Write
x = Execute
Operators for the modification command are + (plus) and – (minus).
Set file permissions via binary references
Example: Give the owner read and write permission, the group read permission and no permission to other.
$ chmod 640 test.txt

The first number represents the owner permission, the second the group permissions and the last number for all other users. The numbers are a binary representation of the rwx string.
r = 4
w = 2
x = 1