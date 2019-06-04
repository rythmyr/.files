#!/bin/zsh
echo "sourcing programs.zsh"

# load Node Version Manager
[ -s "/usr/share/nvm/init-nvm.sh" ] && \. /usr/share/nvm/init-nvm.sh

local SSH_CMD="ssh-agent -s -t 30m"

function start_agent() {
    ${=SSH_CMD} | sed 's/^echo/#echo/' >| $SSH_ENV
    chmod 600 $SSH_ENV
    . $SSH_ENV > /dev/null

    echo "started ssh-agent"
}

if [ -f "$SSH_ENV" ]; then
    . $SSH_ENV > /dev/null
    # if that process is running, and it's an ssh agent, then don't start another one
    ps $SSH_AGENT_PID | grep "$SSH_CMD" >/dev/null && {
        echo "ssh agent already started"
    } || {
        start_agent;
    }
else
    start_agent;
fi