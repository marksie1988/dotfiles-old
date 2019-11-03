#!/bin/bash
do_version_check() {
  if [[ $1 == $2 ]]
  then
    return 0
  fi
  local IFS=.
  local i ver1=($1) ver2=($2)
  # fill empty fields in ver1 with zeros
  for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
  do
    ver1[i]=0
  done
  for ((i=0; i<${#ver1[@]}; i++))
  do
    if [[ -z ${ver2[i]} ]]
    then
      # fill empty fields in ver2 with zeros
      ver2[i]=0
    fi
    if ((10#${ver1[i]} > 10#${ver2[i]}))
    then
      return 1
    fi
    if ((10#${ver1[i]} < 10#${ver2[i]}))
    then
      return 2
    fi
  done
  return 0
}

for file in $(find . -maxdepth 1 -name ".*" -type f  -printf "%f\n" ); do
  if [ -e ~/$file ]; then
    installed_ver=$(grep -oP 'ver:\s*\K[\d.]+' ~/$file)
  else
    installed_ver=0
  fi
  latest_ver=$(grep -oP 'ver:\s*\K[\d.]+' $PWD/$file)
  do_version_check $installed_ver $latest_ver
  case $? in
    0) op='=';;
    1) op='>';;
    2) op='<';;
  esac
  if [[ $op == '<' ]]
  then
    echo "Time to install $latest_ver of $file you are running $installed_ver"
    if [ $installed_ver == 0 ]; then
      if [ -e ~/$file ]; then
        mkdir ~/dotfilebkp
        mv -f ~/dotfilebkp/$file{,.dtbak}
      fi
    fi
    ln -sfn $PWD/$file ~/$file
    echo "New version $latest_ver now installed!"
  else
    echo "$installed_ver is the latest Version of $file, Already Installed!"
  fi
done
