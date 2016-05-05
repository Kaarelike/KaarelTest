#!/bin/sh

# echo * file list

echo -e "\e[1mTeleplan Testplans downloader"

## WORKING_DIR - LOCATION WHERE TESTPLANS MUST BE LOCATED
    WORKING_DIR="C:/Users/kaarel.antonov/Desktop/Git Test/"
    REPO_NAME="Testplans/.git"
    REPO_FOLDER="Testplans"
## WHAT GIT FILE TO DOWNLOAD
    TESTPLANS_GIT="https://github.com/Kaarelike/Testplans.git"
    COMMIT_TIMESTAMP=`date +'%Y-%m-%d %H:%M:%S %Z'`
##
##
##

echo --------------------------------------


## 3. #### CHECK TESTPLANS STATUS AND CLONE REPO IF NEEDED #####

if [ "$#" -lt 1 ]
  then
  echo "Lets check Git status first... Press OK"
  read a
else
  a=$1
fi
if [ "$#" -eq 2 ]
  then
  b=$2
else
  b="master"
fi

echo Checking TestPlans status..
echo --------------------------------------
cd "$WORKING_DIR"
cd "$REPO_FOLDER"
git status

    if [ "$?" = "128" ]; then
        echo --------------------------------------
        echo -n "Git repo not available. Do you want to clone repo from GitHub? (y/n)? "
            old_stty_cfg=$(stty -g)
            stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Care playing with stty
                if echo "$answer" | grep -iq "^y" ;then
                        echo Yes
                        echo
                        echo Press OK to start cloning repo from GitHub!
                        read
                            cd ..
                        git clone "$TESTPLANS_GIT"
                        echo
                        echo --------------------------------------
                        echo Congratulations you have cloned repo from GitHub!
                        echo
                        echo Press OK to exit
                        read
                        exit 1
                else
                    echo No
                    echo Is repo already available? Aborting...
                    read
                    exit 1
                fi
else
        echo --------------------------------------
        echo 
fi


## 3.1 #### ALL TESTPLANS ARE UP TO DATE #####
GIT_STATUS=$(git status)

    if [[ $GIT_STATUS == *"nothing to commit"* ]]; then 
        echo Congratulations all testplans are up to date!
        echo Press OK to exit
        read
        exit 1
        
    fi


## 4. #### PUSH CHANGES TO GITHUB #####

echo -n "Do you want to push changes to GitHub (y/n)? "
            old_stty_cfg=$(stty -g)
            stty raw -echo ; answer=$(head -c 1) ; stty $old_stty_cfg # Care playing with stty
                if echo "$answer" | grep -iq "^y" ;then
                        echo Yes
                        echo Yes
  read
else
    echo No
    echo Aborting pushing changes to GitHub...
    read
    exit 1
fi

echo lTHE END
read



exit 1



    read
    git add -A;
    read
    git commit -m "Auto commit by _ $(COMMIT_TIMESTAMP)";
    read
    git pull origin $b;
    git push origin $b;
    break;;
