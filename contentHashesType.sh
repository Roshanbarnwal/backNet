find .git/objects -type f | awk -F '/' '{print $(NF-1)$NF}' | \
								while read hash
								do
																echo ""
																echo "type of SHA1 $hash"
																git cat-file -t $hash
								done
