# NEOVIM BINDINGS

## BASIC

```vim

i: for insert mode
a: append text after cursor
A: append text at end of current line
I: insert text at beginning of current line
Esc: command mode

- Navigation happens on the home row of your QWERTY keyboard

h: cursor left
j: cursor down (j looks trivially like a down arrow)
k: cursor up
l: cursor right
b: cursor to beginning of current word
e: cursor to end of current word
$: go to end of line
0: go to beginning of line
gg: go to first line of file
G: go to last line of file
9G: go to line 9 of file

- Select

v: select text
V: select line

- Copy and paste
  
y: copy ("yank") selection
yy: copy ("yank") the entire line
p: paste

- Delete

x: delete character
dw: delete word
d$: delete from current position to end of line
d0: delete from current position to beginning of line
dG: delete to last line of file

- Save

u: undo
:w: save
:wq or :ZZ: save and quit
:q!: force quit without saving

```

## ADVANCED

```vim

1. Work with multiple files

:tabe <filename>
gt — Switch to the tab on the right
gT — Switch to the tab on the left


2. Switch case

gUw     - Single word
gU2w    - $ of words
gU$     - Whole line


You can use any of the Vim movement commands for these tasks. For example, use b for the previous word and {, }, (, ) for sentences and paragraphs, and so forth.

To reference Vim movement commands, use
:help motions.txt


3. Use block mode

Have you ever heard the sound a keyboard makes as someone bashes out comments one line at a time? Here's a quick and easy way to comment a whole block. Given the sample file below:

>1 this is a test
2 this is a test
3 this is a test
4 this is a test
5 this is a test
6 this is a test
7 this is a test

Position the cursor at the start of line 1 and press CTRL+V. At the bottom of the window, you will see the words VISUAL BLOCK appear.
Now use either the Down arrow or the j key to move to the beginning of the last line. The first character of each line is highlighted.
Now press I#.
Finally, select ESC.

Voila! The entire block is now commented out. You can also perform other common operations on text blocks similarly, such as removing leading whitespace or trailing garbage.

The reverse operation to uncomment the block works similarly.

Position the cursor at the start of line 1 (you can start it wherever you like and use the movement keys as needed, but for this example, I'll keep it consistent).
Hit CTRL+V. Again, the words VISUAL BLOCK appear at the bottom of the window.
Repeat the operation from before, using the Down arrow or j to move the cursor to the beginning of the last line.
Now use the Right arrow or l movement keys to highlight the hash signs and the one space preceding the start of the text.
Hit D.

Comments are now removed from the block!

4. Increment or decrement numbers

CTRL+A to increment the number
CTRL+X to decrement the number
  
5. Useful

ga — Print the ASCII value of the character under the cursor (also shows in octal and hex).
gi — Move to the last insert you did and enter Insert mode.
gv — Start visual mode and use the previous selection made.
gI — Start inserting at the beginning of the line no matter what the first characters are.


6. Generate a list of numbers with a simple macro

First, create a file with a single line containing line 1.
The cursor should be on the 1 as it should have nowhere else to go.
Select 
qayyp then 
CTRL+A - which will increment line 2.

You should now have two lines, as follows:

>line 1
line 2


Now, leaving the cursor where it is, type q, ESC, and then 18a.

You should now see the following:

>line 1
line 2
line 3
line 4
line 5
line 6
line 7
line 8
line 9
line 10
line 11
line 12
line 13
line 14
line 15
line 16
line 17
line 18
line 19
line 20 


```