#!/bin/bash
for i in `echo "stable release integration hotfix"`; 
do 
	hg pull $i; 
	hg bookmark -f -r `hg id $i` b$i; 
done
