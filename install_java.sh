#/bin/bash
# KERNEL here
KERNEL=`uname`

# HOME_DIR
HOME_DIR=`echo $HOME`

# LOG INFO
LOG_DIR="/opt/auto_shell"
LOG_NAME="AutoInstallJava.log"
TIMESTAMP=`date +"%Y-%m-%d"`
JAVA_DIST_PATH=""

## log rotation
if [ ! -d ${LOG_DIR} ]; then
    echo "LOG_DIR: ${LOG_DIR} not exist "
else
    echo "LOG_DIR: ${LOG_DIR} exist "
    if [ -f ${LOG_DIR}/${LOG_NAME} ]; then
    echo "LOG: ${LOG_DIR}/${LOG_NAME} exists"
    else
    echo "LOG: ${LOG_DIR}/${LOG_NAME} NOT exists"
    fi
fi

## initialize install path for tar.gz
if [ ! -d "${HOME_DIR}/java_install" ]; then
    echo "Java Install Path: ${HOME_DIR}/java_install not exist"
    exit 1
fi


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


