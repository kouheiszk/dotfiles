if [ -d /opt/homebrew/opt/fzf/ ]; then
  FZF_PATH=/opt/homebrew/opt/fzf
else
  FZF_PATH=/usr/local/opt/fzf
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == *$FZF_PATH/bin* ]]; then
  export PATH="$PATH:$FZF_PATH/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$FZF_PATH/man* && -d "$FZF_PATH/man" ]]; then
  export MANPATH="$MANPATH:$FZF_PATH/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_PATH/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$FZF_PATH/shell/key-bindings.bash"
