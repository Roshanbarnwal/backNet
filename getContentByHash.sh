#!/bin/bash

git cat-file -p $1 | \
								while read line
								do 
																if echo $line | grep -q author
																then
																							timestamp=$( echo $line | awk '{print $(NF-1)}')
																							time=$(date -d @$timestamp)
																							line1="${line/$timestamp/$time}"
																							echo $line1
															else
																							echo $line
																fi
								done

