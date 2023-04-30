Chmod command in Linux
What is chmod? chmod stands for change mode. This command is used for changing the mode of access.

But wait! Is it not meant for changing the permission? Actually, in early Unix days, permissions were called mode of access. This is why this particular command was named chmod.

chmod command has the following syntax:

chmod [option] mode file
Before you see how to use chmod, you should know its options.

-v : output a diagnostic for every file processed
-c : like verbose but report only when a change is made
–reference=FILE : use FILE’s mode instead of MODE values
–R : change permissions recursively
Note that using -v option report if change were made or if nothing needed to be done. When combined with -R option, -v can produce a lot of output. –reference=FILE let you use the current permission mode of FILE as the permissions to set on the target file. Note this option requires a double-dash prefix (–) not (-).

Chmod command examples
Using chmod command is very easy if you know what permissions you have to set on a file.

For example, if you want the owner to have all the permissions and no permissions for the group and public, you need to set the permission 700 in absolute mode:

chmod 700 filename
You can do the same in symbolic mode.

chmod u=rwx filename
If you want an easy way to know the Linux file permission in numeric or symbolic mode, you can use this chmod calculator. Just select the appropriate permissions and it will tell you the permissions in both absolute and symbolic mode.

Change permission on all the files in a directory recursively
chmod has the recursive option that allows you to change the permissions on all the files in a directory and its sub-directories.

chmod -R 755 directory
chmod 777: Everything for everyone
You might have heard of chmod 777. This command will give read, write and execute permission to the owner, group and public.

If you want to change the mode to 777, you can use the command like this:

chmod 777 filename
chmod 777 is considered potentially dangerous because you are giving read, write and execute permission on a file/directory to everyone (who is on your system). You should totally avoid it.

chmod +x or chmod a+x: Execution for everyone
Probably one of the most used case of chmod is to give a file the execution bit. Often after downloading an executable file you will need to add this permission before using it. To give owner, group and everyone else permission to execute file:

chmod +x /path/to/file
chmod 755: Only owner can write, read and execute for everyone
This next command will set the following permission on file: rwxr-xr-x. Only the owner will be allowed to write to the file. Owner, group members and everyone else will have read and execute permission.

chmod 755 /path/to/file
chmod 700: Everything for owner only
This command will give read, write and execute permission to the owner. Group and others will have no permissions, not even read.

chmod 700 /path/to/file
chmod 666: No one executes
To give owner, group and everyone else read and write permission on file.

chmod -c 666 /path/to/file
chmod 644: Everyone can read, only owner can write
With this next one, owner will have read and write while group and everyone else have read permission.

chmod 644 /path/to/file
chmod 600: Owner can read and write, nothing else for anyone
With this next one, owner will have read and write while group and everyone else will have no permissions whatsoever.

chmod 600 /path/to/file
chmod command examples in symbolic mode
In the above examples, I use bitmask to set the new MODE. Those are easy to calculate. Simple addition is required. Consider the following:

X = 1
W = 2
R = 4
You can now easily see where I got the 755, 666, 640 from. You don’t have to use bitmask to set new permission. A more human readable way is available. This second format looks like this:

chmod OPTIONS {u,g,o}{+,-,=}{r,w,x} /path/to/file
While this may seem complicated, it is quite simple. You first start with typing chmod and the OPTIONS that you want. Then, ask yourself: Who am I changing permissions for? User, Group, Others. This will give you the first section of the command:

chmod OPTIONS {u,g,o}
The next step to complete the command, you either decide to add permissions bits (+), remove permissions (-), or set permission (=). This last one will add or remove permissions as needed to set permission as you requested.

chmod -v u+
The next section is where you decide the permission MODE to apply(+), remove (-) or match (=). You can specify any combination of rwx.

chmod -v u+rw
This next example will apply read/write permission to file for the owner. The verbose option will cause chmod to report on the action.

chmod -v u+rw /path/to/file
This next one will set the group’s write permission on directory and all its content recursively. It will report only on changes.

chmod -cR g+w /path/to/directory
You can combine multiple operation to be done on permission like this next example. It will make sure owner has read/write/execute, also add write permission for group and remove execution for everyone else:

chmod u=rwx,g+w,o-x /path/to/file
This last one will use rFile as a reference to set permission on file. When completed, the permission of file will be exactly as they are for rFile

chmod --reference=/path/to/rFile /path/to/file
There are more options and MODE that can be used with chmod that are not covered or mentioned here. I wanted to keep this to basic and hopefully help a few new Linux user.