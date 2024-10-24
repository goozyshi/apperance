# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi
# nvm 设置
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

eval "$(lua $(brew --prefix z.lua)/share/z.lua/z.lua --init zsh)"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# 命令补全
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# 键位绑定
bindkey '^I^I' autosuggest-accept 
# 插件加载
plugins=(git z autojump vi-mode fast-syntax-highlighting)

# Fix prompt at the bottom of the terminal window
printf '\n%.0s' {1..100}

# 包别名
alias cat="bat"
alias ls="lsd"
alias gcb="git checkout -b"
alias gci="git checkout ."
# clash 代理，端口 7890:
# 开启代理： > proxy
# 关闭代理： > unproxy
#--------------------------------------------------#
function proxy() {
  local http="http://127.0.0.1:7890"
  local socks5="socks5://127.0.0.1:7890"

  export http_proxy=$http
  export HTTP_PROXY=$http

  export https_proxy=$http
  export HTTPS_PROXY=$http

  export all_proxy=$socks5
  export ALL_PROXY=$socks5

  echo "\033[32m已开启终端代理\033[0m"
}

function unproxy() {
  unset http_proxy HTTP_PROXY https_proxy HTTPS_PROXY all_proxy ALL_PROXY
  echo "\033[32m已关闭终端代理\033[0m"
}

#--------------------------------------------------#

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 清空所有历史命令
function clearall () {
  sudo rm -f ~/.zsh_history
  echo "History cleared"
}