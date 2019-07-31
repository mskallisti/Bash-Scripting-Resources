#!/bin/bash
echo "--------------------------------"
echo "Hi there, user!"
firstline=$(head -1 /home/ccuser/workspace/learn-bash-scripting-project/source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are using version $version."
echo "--------------------------------"
echo "Do you want to continue? Please enter '1' for yes or '2' for no."
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "OK ✅"
  files="/home/ccuser/workspace/learn-bash-scripting-project/source/*"
  for filename in $files
  do
    if [ $filename == /home/ccuser/workspace/learn-bash-scripting-project/source/secretinfo.md ]
    then
      echo "Copying scrubbed $filename"
      secretcontent=$(cat source/secretinfo.md)
      read -a secretarray <<< $secretcontent
      secretarray=("${secretarray[@]/42/XX}")
      echo ${secretarray[@]} > build/secretinfo.md
    else
      echo "Copying $filename"
      cp $filename /home/ccuser/workspace/learn-bash-scripting-project/build/
    fi
  done
  cd build/
  echo "--------------------"
  echo "🗄 Files now in /build, version $version:"
  ls
  cd ..
  zip -r buildArchive.zip /home/ccuser/workspace/learn-bash-scripting-project/build/
else
  echo "Please come back when you are ready"
fi