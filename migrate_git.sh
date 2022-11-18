#!/bin/bash

# git epositoy with agument
GIT_REPO=${1}

# poject name list with csv: contains java poject name and destination emote ul
NAME_LIST_CSV=${2}

which git
which=$?
if [ $which -ne 0 ]; then
    echo "Git is not installed ; exit"
    exit 1
fi

if [[ -z "${GIT_REPO}"  || -z "${NAME_LIST_CSV}" ]] ; then
    echo "Git repositoy path and csv list colud not be empty !"
    exit 1
else
    cd ${GIT_REPO}

path_exist=$?

if [ ${path_exist} -ne 0 ]; then
    echo "REPOSITORY NOT EXIST IN GIVEN PATH"
	exit 1
fi 

if [ ! -f ${NAME_LIST_CSV} ]; then 
    echo "naming list not exist";
    exit 1
else
for line in `cat ${NAME_LIST_CSV}`
do
    subRepo=`echo "${line}" | cut -d ',' -f 1`
    mod_pefix=`echo "${line}" | cut -d ',' -f 2`
    remote_url=`echo "${line}" | cut -d ',' -f 3`
    
    ## ceate emote epo ul
    git remote add ${subRepo} ${remote_url}
    
    ## ceate submodule
    hash=`git subtree split --prefix ${mod_pefix}/${subRepo}`
    
    ## checkout as new banch 
    git checkout -b ${subRepo} ${hash}

    git pull ${subRepo} migration --allow-unrelated-histories
    
    ## push to new epo
    git push -u ${subRepo} ${subRepo}:migration
    
    ## git checkout to main banch
    git checkout main
done

fi

fi


