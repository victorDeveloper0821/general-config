#/bin/bash
# KERNEL here
KERNEL=`uname`

# HOME_DIR
HOME_DIR=`echo $HOME`

# LOG INFO
LOG_DIR="/opt/auto_shell"
LOG_NAME="AutoInstallJava.log"
TIMESTAMP=`date +"%Y-%m-%d"`
SHELL_LOG="${LOG_DIR}/${LOG_NAME}"
JAVA_TAR_PATH="${HOME_DIR}/java_install"
JAVA_DIST_PATH=""

JDK_STORED_PATH="${HOME_DIR}/jdks"

## log rotation
if [ ! -d ${LOG_DIR} ]; then
    mkdir -p "${LOG_DIR}"
else
    if [ -f ${SHELL_LOG} ]; then
        if [ "$(ls --full-time ${SHELL_LOG} | awk '{print $6}')" != "$(date +%Y-%m-%d)" ]; then
            mv ${SHELL_LOG} ${SHELL_LOG}.$(date --date='1 days ago' +%Y%m%d)
            touch ${SHELL_LOG}
        fi
    else
        touch ${SHELL_LOG}
    fi
fi

## initialize install path for tar.gz
if [ ! -d "${JAVA_TAR_PATH}" ]; then
    exit 1
else
    cd ${JAVA_TAR_PATH}
    tarballs=`ls *.tar.gz` # list all tar.gz files
    for tar in ${tarballs} do tar -zxvf ${tar} -C ${JDK_STORED_PATH} done # unzip files to dsetination
fi


## create symbolic links here

if [ "$KERNEL" == "Darwin" ];then
    echo "You are using MacOSX !"
    JAVA_DIST_PATH="/Library/Java/JavaVirtualMachines"
    echo $JAVA_DIST_PATH ;
else 
    echo "You are using Linux !"
## need to change permission for group developer
    `chgrp developer /opt/`
## change rwx permission 
    `chmod 775 /opt/`
# require change permission in opt first
    JAVA_DIST_PATH="/opt/java/"
    echo $JAVA_DIST_PATH ;
fi


