# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
#antigen bundle npm
#antigen bundle yarn
#antigen bundle nvm
antigen bundle command-not-found
# antigen bundle ajeetdsouza/zoxide
# antigen bundle junegunn/fzf

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme robbyrussell
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# ALIASES

alias path='tr ":" "\n" <<< "$PATH"'
alias doco=docker-compose
alias docstop='f() { docker stop $(docker ps -aq) }; f'
alias docbash='f() { docker run -it --privileged $1 /bin/bash }; f'
alias docip='f() { docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}" $1 }; f'
alias docps="docker ps --format '{{.ID}} - {{.Names}} - {{.Status}} - {{.Image}}'

eval "$(rbenv init -)"
export PATH="/usr/local/opt/curl/bin:$PATH"
