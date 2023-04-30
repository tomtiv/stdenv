 name
$ find / -iname "[query]"
copy
$ fd [query]
copy
Find all path names containing a phrase
$ locate [query]
copy
Find the path of an executable
$ which [command]
copy
Find location of binary/source/man files for a command
$ whereis [command]
copy
Search for pattern in output of command
$ history |  grep [phrase]
copy
Find files whose content was modified less than 60 minutes ago
$ find / -mmin -60
copy
Find files whose status was changed less than 60 minutes ago
$ find / -cmin -60
copy
FInd all files which are accessed 7 days back
$ find / -atime 7
copy
Search for pattern in file
$ grep [query] [file]
copy
Find all files which are greater than 10MB and less than 100MB
$ find / -size +10M -size -100M
copy
Find files by extension
$ fd -e [extension]
copy
$ find . -type f -name "*.[extension]"
copy
$ locate "*.[extension]"
copy
