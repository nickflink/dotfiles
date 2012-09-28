#!/bin/bash

function set_LOCALHOST_GROUP_ARRAY() {
	LOCALHOST_GROUP_ARRAY=( $(cut -d ":" -f1,3 /etc/group) )
}

function set_LOCALHOST_USER_ARRAY() {
	LOCALHOST_USER_ARRAY=( $(cut -d ":" -f1,3 /etc/passwd) )
}
function set_LDAP_GROUP_ARRAY_for(){
	local user=$1
	local ldap_groupname_array=( $(ldapsearch -H ldap://ldap.tuenti.local -x -D "uid=serviceauth,ou=users,dc=tuenti,dc=com" -w BeshFakIf6  -b "ou=unixgroups,dc=tuenti,dc=com " "(|(&(objectClass=posixGroup)(memberUid=$user))(&(objectClass=posixGroup)(cn=$user)))" cn|egrep ^cn | cut -d " " -f2) )
	local ldap_groupid_array=( $(ldapsearch -H ldap://ldap.tuenti.local -x -D "uid=serviceauth,ou=users,dc=tuenti,dc=com" -w BeshFakIf6  -b "ou=unixgroups,dc=tuenti,dc=com " "(|(&(objectClass=posixGroup)(memberUid=$user))(&(objectClass=posixGroup)(cn=$user)))" gidNumber|egrep ^gidNumber | cut -d " " -f2) )
	ldap_groupname_count=${#ldap_groupname_array[@]}
	ldap_groupid_count=${#ldap_groupid_array[@]}
	if [ $ldap_groupname_count -ne $ldap_groupid_count ]; then
		echo "inconsistent group name and gids from ldap" >&2
		exit 1;
	fi
	for (( index=0; index<$ldap_groupid_count; index++ ));
	do
		LDAP_GROUP_ARRAY[$index]=${ldap_groupname_array[$index]}":"${ldap_groupid_array[$index]}
	done
	#echo ${LDAP_GROUP_ARRAY[@]}
}
function add_missing_groups_for() {
	local user=$1
	#echo -e "\nget_localhost_users:"
	#[ "$LOCALHOST_USER_ARRAY" ] || set_LOCALHOST_USER_ARRAY
	#echo ${LOCALHOST_USER_ARRAY[@]}
	#echo -e "\nget_localhost_groups:"
	#[ "$LOCALHOST_GROUP_ARRAY" ] || set_LOCALHOST_GROUP_ARRAY
	#echo ${LOCALHOST_USER_ARRAY[@]}
	#cho -e "\nget_ldap_groups_for_user($user):"
	[ "$LDAP_GROUP_ARRAY" ] || set_LDAP_GROUP_ARRAY_for $user
	local ldap_group_count=${#LDAP_GROUP_ARRAY[@]}
	local groupadd_command=""
	local usermod_command=""
	local ret_val=0
	for (( index=0; index<$ldap_group_count; index++ ));
	do
		groupadd_command=`echo "${LDAP_GROUP_ARRAY[$index]}"|awk '{sub(":", " ");print "groupadd -g " $2 " " $1}'`;
		usermod_command=`echo "${LDAP_GROUP_ARRAY[$index]}"|awk '{sub(":", " ");print "usermod -a -G " $1 " '$user'" }'`;
		echo "running $groupadd_command";
		$groupadd_command 2>/dev/null
		ret_val=$?
		if [ $ret_val == 0 ]; then
			echo "$groupadd_command finished with success"
		fi
		echo "running $usermod_command";
		$usermod_command 2>/dev/null
		#echo "add_group_command=$add_group_command";
		#echo "${LDAP_GROUP_ARRAY[$index]}"|awk '{sub(":", " ");print "groupadd -g " $2 " " $1}'
	done
}
function syncronize_with_ldap() {
	for user in `find /home/* -maxdepth 0 -type d|awk '{sub("/home/"," "); print}'`;
	do
		LDAP_GROUP_ARRAY=()
		#echo -e "\nget_ldap_groups_for_user($user):"
		#set_LDAP_GROUP_ARRAY_for $user
		add_missing_groups_for $user
	done
}
#echo -e "\nget_localhost_users:"
#get_localhost_users;
#echo -e "\nget_localhost_groups:"
#get_localhost_groups;
#echo -e "\nget_ldap_groups_for_user($USER):"
#set_LDAP_GROUP_ARRAY_for $USER;
syncronize_with_ldap
exit 0;
#echo -e "\nUSERS:\n======\n";
#ldapsearch -H ldap://ldap.tuenti.local -x -D "uid=serviceauth,ou=users,dc=tuenti,dc=com" -w BeshFakIf6  -b "ou=users,dc=tuenti,dc=com" "(&(objectClass=posixAccount)(uid=$User))" gidNumber uidNumber uid  
#| grep "gidNumber:\|uid:\|uidNumber:";
#echo -e "\nGROUPS:\n=======\n";
#ldapsearch -H ldap://ldap.tuenti.local -x -D "uid=serviceauth,ou=users,dc=tuenti,dc=com" -w BeshFakIf6  -b "ou=unixgroups,dc=tuenti,dc=com " "(|(&(objectClass=posixGroup)(memberUid=$User))(&(objectClass=posixGroup)(cn=$User)))" cn gidNumber
# | grep "gidNumber:\|cn:"

	ldapsearch -H ldap://ldap.tuenti.local -x -D "uid=serviceauth,ou=users,dc=tuenti,dc=com" -w BeshFakIf6  -b "ou=users,dc=tuenti,dc=com" "(&(objectClass=posixAccount)(uid=$User))" gidNumber uidNumber uid  | grep "gidNumber:\|uid:\|uidNumber:"  >users
	ldapsearch -H ldap://ldap.tuenti.local -x -D "uid=serviceauth,ou=users,dc=tuenti,dc=com" -w BeshFakIf6  -b "ou=unixgroups,dc=tuenti,dc=com " "(|(&(objectClass=posixGroup)(memberUid=$User))(&(objectClass=posixGroup)(cn=$User)))" cn gidNumber | grep "gidNumber:\|cn:"  >grouplist
	
	UserExist=`cat users | grep "$User$" | wc -l`
	if [ $UserExist -eq 0 ]; then 
		echo "Sorry, the user $User don't exist in LDAP"
		exit 1
	fi

	listGroups=""
	while read line
	do
		type=${line%:*}	
		case $type in	
			'gidNumber')
				gidNumber=${line##*:}
				gidNumber=${gidNumber/ /}
			;;
			'cn')
				cn=${line##*:}
				cn=${cn/ /}
				groupExist=`cat /etc/group | grep "$cn:"| wc -l`	
				if [ $groupExist -eq 0 ]; then
					echo "groupadd   $cn"
					#groupadd   $cn
				fi

			
				if [ $User != $cn ]; then
				
					if [ -z  "$listGroups" ]; then
						listGroups=$cn
				else
						listGroups=`echo "$listGroups,$cn"`
					fi
				fi
			;;
		esac
		
	done<grouplist


	while read line
	do	
		
		type=${line%:*}	
		case $type  in
			'uidNumber')
				uidNumber=${line##*:}
				uidNumber=${uidNumber/ /}
								
			;;
			'gidNumber')
				gidNumber=${line##*:}
				gidNumber=${gidNumber/ /}
			;;
			
			'uid')
				userName=${line##*:} 
				userName=${userName/ /}
								
						;;
		esac
		
	done<users
	
	echo "useradd -G $listGroups -g $userName -u $uidNumber  -m  $userName "
	#useradd -G $listGroups -g $userName -u $uidNumber  -m  $userName 
