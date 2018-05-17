# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/charlie/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export PS1="%d >>> "
export PATH="$PATH:$(yarn global bin):$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
export VISUAL="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
eval $(opam config env)
