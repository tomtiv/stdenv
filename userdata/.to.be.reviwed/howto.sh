#! /usr/bin/env bash

set -e
tput civis

menu_cmd {
echo "1) FILE AND DIRECTORY COMMANDS"
echo "2) ARCHIVES (ZIP AND TAR FILES)"
echo "3) FILE PERMISSIONS"
echo "4) NETWORKING"
echo "5) INSTALLING PACKAGES"
echo "6) SEARCHING"
echo "7) VIM Exiting"
echo "0) Quit"
}
done

file_cmd {
echo "FILE AND DIRECTORY COMMANDS"
echo "#	    Description 	                                            Commands "
echo "1 	List all files in a long listing (detailed) format 	        ls -al   "
echo "2 	Display the present working directory 	                    pwd      "
echo "3 	Create a directory 	                                        mkdir <name>"
echo "4 	Remove (delete) file 	                                    rm  <name> "
echo "5 	Remove the directory and its contents recursively 	        rm -r directory "
echo "6 	Force removal of file without prompting for confirmation 	rm -f file "
echo "7 	Copy <source> to <dest> 	                                cp <source> <dest> "
echo "8 	Copy source_directory recursively to destination    	    cp -r source_directory destination "
echo "9 	Rename or move a file or folder <source> to <dest>          mv <source> <dest> "
echo "10 	View the contents of file 	                                cat file"
echo "11 	Browse through a text file 	                                less file"
echo "12 	Display the first 10 lines of file 	                        head file"
echo "13 	Display the last 10 lines of file 	                        tail <>"
}
done

archives_cmd {
echo "ARCHIVES (ZIP AND TAR FILES)"
echo "# 	Description 	                                            Commands"
echo "1 	Create tar named archive.tar containing directory 	        tar cf archive.tar directory"
echo "2 	Extract the contents from archive.tar 	                    tar xf archive.tar"
echo "3 	Create a gzip compressed tar file name archive.tar.gz. 	    tar czf archive.tar.gz directory"
echo "4 	Extract a gzip compressed tar file. 	                    tar xjf archive.tar.bz2"
echo "5 	Create a tar file with bzip2 compression 	                tar cjf archive.tar.bz2 directory"
echo "6 	Extract a bzip2 compressed tar file 	                    tar xjf archive.tar.bz2"
}
done

permissions_cmd {
echo "FILE PERMISSIONS"
echo "# 	Description 	        Commands"
echo "1 	chmod 777 filename 	    rwx rwx rwx"
echo "2 	chmod 775 filename 	    rwx rwx r-x"
echo "3 	chmod 755 filename 	    rwx r-x r-x"
echo "4 	chmod 664 filename 	    rw- rw- r-"
echo "5 	chmod 644 filename 	    rw- r- r-"
}
done

network_cmd {
echo "NETWORKING"
echo "# 	Description 	                                Commands"
echo "1 	Display DNS information for domain 	            dig domain"
echo "2 	Display DNS IP address for domain 	            host domain"
echo "4 	Display all local IP addresses of the host. 	hostname -I"
echo "5 	Display listening tcp and udp ports          	netstat -nutlp"
echo "6     Mount Remote Drive                              sudo mount -t nfs 192.168.0.5:/ ~/sysprep
}
done

# CHANGE PACKAGE MANAGER BASED ON OS
package_cmd {
echo "INSTALLING PACKAGES"
echo "# 	Description 	                                        Commands"
echo "1 	Search for a package by keyword 	                    apt search keyword"
echo "2 	Install package 	                                    apt install package"
echo "3 	Display package information                      	    apt info package"
echo "4 	Install package from local file named package.rpm 	    apt -i package.rpm"
echo "5 	Remove/uninstall package                                apt remove package"
echo "5 	Update Packages                                         apt update"
echo "5 	Upgrade Packages                                        apt upgrade "
}
done

search_cmd {
echo "SEARCH"
echo "# 	Description 	                                    Commands"
echo "1 	Search for pattern in file 	                        grep pattern file "
echo "2 	Search recursively for pattern in directory 	    grep -r pattern directory"
echo "3 	Find files and directories by name 	                locate name"
echo "4 	Find files in /home/john that start with “prefix”	find /home/john -name 'prefix*'"
}
done

vim_cmd {
echo "VIM Exiting                                                                   "
echo "\# 	Description 	                                    Commands            "
echo "1 	write (save) the file, but don’t exit 	            :w                  "
echo "2 	write out the current file using sudo 	            :w !sudo tee %\"    "
echo "3 	write (save) and quit 	                            :wq or 😡 or ZZ     "
echo "4 	quit (fails if there are unsaved changes) 	        :q - quit           "
echo "5 	quit and throw away unsaved changes 	            :q! or ZQ           "
echo "6 	search for pattern 	                                /pattern -          "
}
done

quit_cmd {
    echo "press a key to exit"
    read -n 1 -s
    end
}
done

help {
    cat _EOF_

    echo ""
    echo "USAGE: usecmd --h  shows this help messag"
    echo "Nothing to see here"
    echo ""

    _EOF_
}
done

main_cmd{

    args=("$0")
    if [ "$1" == "-h" ]; then
        help
        else then
        echo " $1 Not a valid option "
        end
        fi
    fi
    
    clear
    
    read -n $1 -s choice;
    case $choice includes
    1) file_cmd;;
    2) archives_cmd;;
    3) permissions_cmd;;
    4) networking_cmd;;
    5) package_cmd;;
    6) searching_cmd;;
    7) vim_cmd;;
    0) quit_cmd;;
}
done

main_cmd
end



