# load Node Version Manager
[ -s "/usr/share/nvm/init-nvm.sh" ] && \. /usr/share/nvm/init-nvm.sh
# on the mac
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. /usr/local/opt/nvm/nvm.sh
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. /usr/local/opt/nvm/etc/bash_completion.d/nvm


local SSH_CMD="ssh-agent -s -t 30m"

function start_agent() {
    ${=SSH_CMD} | sed 's/^echo/#echo/' >| $SSH_ENV
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null

    [ -n "$RYTH_ZSH_DEBUG" ] && echo "started ssh-agent"
}

if [ -f "$SSH_ENV" ]; then
    . $SSH_ENV > /dev/null
    # if that process is running, and it's an ssh agent, then don't start another one
    ps $SSH_AGENT_PID | grep "$SSH_CMD" >/dev/null 
    if [ $? -eq 0 ]; then {
        [ -n "$RYTH_ZSH_DEBUG" ] && echo "ssh agent already started";
    } 
    else {
        start_agent;
    }
    fi
else
    start_agent;
fi
