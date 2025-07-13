#! /bash
find .git/objects -type f | awk -F '/' '{print $(NF-1)$NF}' | \
while read hash
do
echo ""
echo "=> value against $hash"
git cat-file -p $hash | while read line; 
do 
 echo "<="$line
done
done

