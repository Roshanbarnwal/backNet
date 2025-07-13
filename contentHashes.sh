#! /bash
find .git/objects -type f | awk -F '/' '{print $(NF-1)$NF}' | \
while read hash
do
echo ""
echo "=> value against $hash"
git cat-file -p $hash | while read line; 
do 
								echo $line | grep  -q "author" 
if [ $? -eq 0 ]
then
#								echo $line |	awk '{print $(NF-1)}' | read timestamp
								timestamp=$(echo $line |	awk '{print $(NF-1)}')
								time=$(date -d @$timestamp)
								line="${line/$timestamp/$time}"
								echo $line
								echo "<=>"$timestamp; 
else 
								echo $line ;
fi ; 
done
done
	

#In shell scripting, when you use a pipeline (|), each command in the pipeline runs in a separate subshell. if timestamp is set as variable in pipeline, it
#won't be available in main shell.The value extracted by awk is passed to read timestamp, which sets timestamp only within its own subshell.
#The final echo $timestamp runs in yet another subshell, where timestamp is unset or empty, so nothing is printed.
#When you use a pipeline (|) in shell scripting, the output of the command on the left is sent as input to the command on the right. However, each command in 
#the pipeline runs in its own subshell.
