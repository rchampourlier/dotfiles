SCRIPT=$0

# Defines DEFAULT_DEV_DIR and DEFAULT_USER (for agnoster oh-my-zsh theme)
if [ -f $HOME/.profile_local ]; then source $HOME/.profile_local; fi

# Setting development dir (defaults on login, accessible with cdd)
DEV_DIR_FILE=$HOME/.dev_dir
if [ -f $HOME/.dev_dir ]
then
  export DEV_DIR=`cat $DEV_DIR_FILE`
else
  export DEV_DIR=$DEFAULT_DEV_DIR
fi

# Set the dev dir to the current dir by setting its path to the
# ~/.dev_dir file
dcd() { rm -f ~/.dev_dir && cd $1 && pwd > ~/.dev_dir }

# Navigate to projects (using some zsh autocompletion features)
alias cdd="cd `cat $DEV_DIR_FILE`"

if [ $PROJECTS_DIR ]
then
  autoload -U compinit
  autoload -U compdef
  compinit
  dcd()  { rm -f ~/.dev_dir && echo "$1" > ~/.dev_dir && source $SCRIPT; }
  _dcd() { _files -W $PROJECTS_DIR -/; }
  compdef _dcd dcd
fi

# Login actions
cdd
