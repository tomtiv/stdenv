    asics
    Tips
    Commands

GIT
Clone an existing repository
$ git clone [url]
copy
Initialize new version-controlled project
$ git init
copy
Save changes to the repository
$ git add .
 git commit -m "first commit"
copy
Current state of the repository
$ git status
copy
Create a new branch
$ git branch [branchName]
copy
List all remote or local branches
$ git branch -a
copy
Delete a branch
$ git branch -d [branchName]
copy
Merge changes into current branch
$ git merge [branchName]
copy
Checkout an existing branch
$ git checkout [branchName]
copy
Checkout and create a new branch with that name
$ git checkout -b [newBranch]
copy
Create a tag
$ git tag [tagName]
copy
Delete the tag
$ git tag -d [tagName]
copy
Push tags
$ git push --tags
copy
Get the latest version of a repository
$ git pull [branchName] [remoteURL/remoteName]
copy
Add remote repository
$ git remote add origin [url]
copy
Define the author name to be used for all commits
$ git config --global user.name [name]
copy
Define the author email to be used for all commits
$ git config --global user.email [email]
copy
Helpful guides that come with Git
$ git help -g
copy
Undo the previous commit
$ git revert HEAD^
copy
Forget about files that were tracked but are now in .gitignore
$ git rm -r --cached . 
 git add .
 git commit -am "remove ignored files"
copy
Send local commits to the remote repository
$ git push [remoteURL/remoteName] [branch]
copy
Store current work with untracked files
$ git stash -u
copy
Bring stashed work back to the working directory
$ git stash pop
copy
Remove a file from the working index (cached)
$ git rm --cached [fileName]
copy
Delete a file (force)
$ git rm -f [fileName]
copy
Remove an entire directory from the working index (cached)
$ git rm -r --cached [directoryName]
copy
Delete an entire directory (force)
$ git rm -r -f [fileName]
copy
Delete a remote branch
$ git push origin :[branchName]
copy
