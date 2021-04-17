# recieve a random number
var="Your number is:"
printf "%s\n" "$var"
echo $RANDOM % 10 + 1 | bc


# check the size
bash-3.2$ du -h your_directory