#!/bin/bash
set -e
function attachOrSwitch(){
  if [[ $TMUX ]];then
    tmux switch-client -t my-remix-app$1
  else
    tmux attach -t my-remix-app$1
  fi
}

# Attach to the session if it already exists
if tmux has-session -t=my-remix-app 2> /dev/null; then
  attachOrSwitch; exit
fi

# Create a new session with the first window being called vim
tmux new-session -d -s my-remix-app -n vim -x 86 -y 44

# 1. Main window: vim, server, shell.
tmux send-keys -t my-remix-app:vim "nvim -c Files" Enter
tmux split-window -t my-remix-app:vim -h
# You could send commands to this window like
# tmux send-keys -t my-remix-app:vim.right "git status" Enter
tmux split-window -t my-remix-app:vim.2
# You could send commands to this window like
# tmux send-keys -t my-remix-app:vim.bottom-right "git status" Enter

# 2. Create a second window you could create splits etc in the same way as the
# above section
tmux new-window -t my-remix-app -c $PWD -n window-2

# Attach to the newly created session
attachOrSwitch :vim.left

