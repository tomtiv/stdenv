# Using Secure Copy

Secure Copy (scp) is a command for sending files over SSH.

## Copying Files to a remote machine

Copy the local file myfile.txt  to IP address 192.168.1.3

```shell
scp myfile.txt pi@192.168.1.3:
```

Copy the file to the /home/pi/project/ directory
***NOTE: the project folder must already exist***

```shell
scp myfile.txt pi@192.168.1.3:project/
```

## Copying Files from a remote machine

Copy file myfile.txt from 192.168.3 to the current directory on your other computer:

```shell
scp pi@192.168.0.3:myfile.txt .
```

## Copying Multiple Files

Copy multiple files by separating them with spaces:

```shell
scp myfile.txt myfile2.txt pi@192.168.1.3:
```

Alternatively, use a wildcard to copy all files matching a particular search with:

```shell
scp *.txt pi@192.168.1.3:
```
(all files ending in .txt)

```shell
scp m* pi@192.168.1.3:
```
(all files starting with m)

```shell
scp m*.txt pi@192.168.1.3:
```
(all files starting with m and ending in .txt)

***NOTE
Some of the examples above will not work for file names containing spaces. Names like this need to be enclosed in quotes:***

scp "my file.txt" pi@192.168.1.3:

## Copying a Whole Directory

Copy the local directory project/ to the remote  user’s home folder

```shell
scp -r project/ pi@192.168.1.3:
```
