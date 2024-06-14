#!/bin/bash


shopt -s nullglob

function is_in_array {
  array=$2
  for i in ${array[@]}
  do
    if [[ "${i}" == "$1" ]]
    then
      return 0
    fi
  done
  return 1
}

if [[ "$#" -eq "0" ]]
then
  script_name=$(basename "$0")
  echo "Usage: ${script_name} <username1> ... <usernameN>"
  echo "Example: ${script_name} userOne"
  echo "Example: ${script_name} userOne userTwo"
  echo ""
	until [[ $REVOKE_ALL_CLIENT_CERTIFICATES =~ ^(Y|n)$ ]]; do
    read -p "You've supplied no username. This will REVOKE ALL CLIENT CERTIFICATES! Are you sure? [Y/n]" -n 1 -r REVOKE_ALL_CLIENT_CERTIFICATES
    echo ""
  done
  if [[ $REVOKE_ALL_CLIENT_CERTIFICATES =~ ^[Y]$ ]]
  then
    echo "Alright. REVOKING ALL CLIENT CERTIFICATES then..."
  else
    echo "Aborting."
    exit -1
  fi
fi

USERNAMES="$@"


declare -a ovpn_users
for ovpn_filename in *.ovpn
do
  ovpn_users=("${ovpn_users[@]}" "${ovpn_filename%.*}")
done

for ovpn_user in ${ovpn_users[@]}
do
  if is_in_array "${ovpn_user}" "${USERNAMES}"
  then
    echo "Keeping certificate for user ${ovpn_user}."
  else
    echo "Revoking certificate for user ${ovpn_user}!"

    export MENU_OPTION="2"
    export CLIENT="${ovpn_user}"
    ./openvpn-install.sh
  fi
done


for username in ${USERNAMES}
do
  ovpn_filename="${username}.ovpn"
  if [ -f "${ovpn_filename}" ]
  then
      echo "File '${ovpn_filename}' already exists. Skipping."
      continue
  fi

  export MENU_OPTION="1"
  export CLIENT="${username}"
  export PASS="1"
  ./openvpn-install.sh
done
