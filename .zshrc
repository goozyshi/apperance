export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#--------------------------------------------------#
  # 插件
  #1. brew install zsh-autosuggestions
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
  bindkey '^I^I' autosuggest-accept  # 键位绑定
  
  #2. brew install zsh-fast-syntax-highlighting
  source /usr/local/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 

  #3.主题 brew install powerlevel10k 
  source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme
  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  #4. Fix prompt at the bottom of the terminal window
  printf '\n%.0s' {1..100}
#--------------------------------------------------#
  
  
#--------------------------------------------------#
# 快捷方法
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

# 清空所有历史命令
function clearall () {
  sudo rm -f ~/.zsh_history
  echo "History cleared"
}
# 包别名
alias cat="bat"
alias ls="lsd"
alias gcb="git checkout -b"
alias gci="git checkout ."
#--------------------------------------------------#

# Git
# 修改 github 用户名和邮箱地址（防止造成用公司信息提交到 github 的尴尬）
if [[ -d .git ]]; then
  local githubName="goozyshi"   # github 用户名
  local githubEmail="goozyshi@gmail.com"  # github 邮箱地址
  local url=$(git remote get-url origin)
  local localName=$(git config user.name)
  local localEmail=$(git config user.email)
  # 只判断 github 仓库，根据需要修改（判断字符建议写长点）
  if [[ $url =~ "github.com/goozyshi" ]]; then
    # 提示当前为 github 项目（不需要就注释）
    echo -e "\033[34m当前为 github 项目\033[0m"
    if [[ $githubName && $githubName != $localName ]]; then
      $(git config user.name "$githubName")
      echo -e "已将当前仓库的 name 从\033[33m $localName \033[0m修改为\033[32m $githubName \033[0m"
    fi
    if [[ $githubEmail && $githubEmail != $localEmail ]]; then
      $(git config user.email "$githubEmail")
      echo -e "已将当前仓库的 email 从\033[33m $localEmail \033[0m修改为\033[32m $githubEmail \033[0m"
    fi
  fi
fi


