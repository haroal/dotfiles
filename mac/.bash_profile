## Virtual environment (python)
export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

## Local web server
alias start_web_server='brew services start php71 && brew services start nginx'
alias restart_web_server='brew services restart php71 && brew services restart nginx'
alias stop_web_server='brew services stop nginx && brew services stop php71'

## Server
alias galileo='ssh <username>@<address> -p <port>'
alias ftpserver='ftp <server_name>@dedibackup-dc3.online.net'

send2galileo () {
    scp -P <port> $1 <username>@1<address>:/home/<username>
}

receiveFromgalileo () {
    scp -P <port> <username>@<address>:$1 ./
}

## Android
export ANDROID_HOME=$HOME/Library/Android/sdk

export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:/usr/local/opt/php71/bin/:/usr/local/opt/python/libexec/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Load RVM
# source $HOME/.profile
