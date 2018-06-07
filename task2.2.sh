#!/bin/bash
# SHELL SCRIPTING:

# 1. From the given file containing web server logs, find the number of times each IP has made a request to the server. Sort it in descending order, and display the top 20 IPs, along with the count.
wget https://delta.nitt.edu/~shubham/web_logs.txt
touch ips.txt
<web_logs.txt awk '{h[$2]++} END { for(k in h) print k, h[k] }' | sort -n >> ips.txt
sort -r -g -k 2 ips.txt | head -n20

# 2. Create a shell script that takes a filename and a word as an input from the user interactively, and finds the number of time the word has occured in the given file.
echo Enter the filename:
read filename
echo Enter your word for searching:
read word
grep -o -i $word $filename | wc -l

# 3. Create a shell script that is used for search-and-replace purposes. It takes in three parameters, a filename, word to be replaced, and the new word for replacement. The parameters will be passed using command-line arguments.
echo Enter the filename:
read filename
echo Enter the word to be replaced:
read rword
echo Enter the new word:
read nword
sed -i 's/'$rword'/'$nword'/g' $filename

# 4. List the top 11 most frequent shell commands used by a user. 
history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n11

# 5. Given a directory, sort the files and directories inside it into descending order by their size.
ls -sh >> sort.txt
sort -nr sort.txt

# 6. Find empty files in a given directory, which haven't been accessed in the last 14 days, and delete them.
find -type f -empty -used 14 -delete
