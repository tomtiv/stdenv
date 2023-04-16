# SED Cheat-Sheet

**sed** ("stream editor") is a **Linux ([[linux]])**, and Unix utility that parses and transforms text, using a simple, compact programming language.

TMP
replace pattern:
```
sed -i 's/Steven/Kate/' file
```

EXTRACT FILE NAME FROM FILE PATH:
```
$(find $i -type f -name \*.css | sed 's:.*/::')

## Commands

cat
tee

## SYNTAX

sed 's/<search_pattern>/<replacement>/g' <stream>

### replace 'the' with 'da' in demo.txt

cat demo.txt | sed 's/the/da/g' | tee demo.txt

### in-place example - remove need for cat

sed --in-place -e 's/the/da/g' demo.txt

### multiple replacements

sed -e 's/the/hello/g' -e 's/lazy/tired/' test.txt

### multiple replacements with ;

 sed -e 's/the/hello/g;s/lazy/tired/' test.txt
```