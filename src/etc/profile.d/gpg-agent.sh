#!/bin/sh

# ignore "/" initial root $HOME
if (( "${#HOME} <= 1" )); then
	return 0
fi

gpg_agent_info="${HOME}/.gpg-agent-info"

if pgrep -x -u "${USER}" gpg-agent >/dev/null 2>&1; then
	eval `cat $gpg_agent_info`
	eval `cut -d= -f1 $gpg_agent_info | xargs echo export`
else
	eval `gpg-agent -s --enable-ssh-support --daemon --write-env-file "$gpg_agent_info"`
fi
