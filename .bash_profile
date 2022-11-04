# JAVA_HOME

#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_211.jdk/Contents/Home

#export PATH=$PATH:$JAVA_HOME/bin

jdk() {
      version=$1
      unset JAVA_HOME;
      export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
      java -version
}



#Maven home

export M2_HOME=/Users/victortsai/apache-maven-3.6.1

export PATH=$PATH:$M2_HOME/bin

# ant home

export ANT_HOME=/Applications/apache-ant-1.10.5

export PATH=$PATH:$ANT_HOME/bin

# Tomcat Home



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/victortsai/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/victortsai/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/victortsai/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/victortsai/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# kotlin home 
export Kotlin_Home=/usr/local/Cellar/kotlin/1.3.41
export PATH=$PATH:$Kotlin_Home/bin

#GOPATH
export GOPATH=~/Desktop/work/go
#GOBIN
export GOBIN=$PATH:$GOPATH/bin

export PATH=/usr/local/mysql/bin:$PATH

#PATH
export PATH=$PATH:$GOBIN

[[ -s "/Users/victortsai/.gvm/scripts/gvm" ]] && source "/Users/victortsai/.gvm/scripts/gvm"

export PATH=/usr/local/mongodb/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/victortsai/google-cloud-sdk/path.bash.inc' ]; then . '/Users/victortsai/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/victortsai/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/victortsai/google-cloud-sdk/completion.bash.inc'; fi
