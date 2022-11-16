#!/bin/bash

# git bin path
git_path=`which git`

# git epositoy with agument
GIT_REPO=${1}

# poject name list with csv: contains java poject name and destination emote ul
NAME_LIST_CSV=${2}

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

if [ -f ${NAME_LIST_CSV} ]; then 
    echo "naming list not exist";
    exit 1
else
for line in `cat ${NAME_LIST_CSV}`
do
    subRepo=`echo "${line}" | cut -d ',' -f 1`
    mod_pefix=`echo "${line}" | cut -d ',' -f 2`
    emote_ul=`echo "${line}" | cut -d ',' -f 3`
    
    ## ceate emote epo ul
    git emote add ${subRepo} ${emote_ul}
    
    ## ceate submodule
    hash=`git subtee split --pefix ${mod_pefix}/${subRepo}`
    
    ## checkout as new banch 
    git checkout -b ${subRepo} ${hash}
    
    ## push to new epo
    git push -u ${subRepo} ${subRepo}:onGoing
    
    ## git checkout to main banch
    git checkout main
done

fi

fi


