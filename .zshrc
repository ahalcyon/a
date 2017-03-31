# Customize to your needs...
# Set up the prompt

autoload -Uz promptinit
promptinit
#export ZSH_THEME="lime"

setopt histignorealldups sharehistory

setopt nonomatch

# Use vim keybindings even if our EDITOR is set to emacs
bindkey -v

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt hist_ignore_dups

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups
# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space
# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks
# 高機能なワイルドカード展開を使用する
setopt extended_glob
setopt hist_verify
setopt hist_save_no_dups
setopt auto_cd
cdpath=(.. ~ ~/src)
# コマンドミスを修正
setopt correct

# Use modern completion system

autoload -Uz compinit
compinit

#Use Colore
autoload -Uz colors
colors

#PROMPT='[%n%#]'
#RPROMPT='[%c]'

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# フローコントロールを無効にする
setopt no_flow_control
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
alias -g py='python3.6'
alias -g ls='ls -a'
alias -g c='| xsel --input --clipboard'
export GOPATH="$HOME/.go"
export PATH=$PATH:$HOME/.go/bin
alias sagyobgm='mpv --no-video --shuffle 'https://www.youtube.com/playlist?list=PLa1sGLggpmLBlGJwsWUQM-6AdUHKMepzu''

#zplug part
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "chrissicool/zsh-256color"
zplug "Tarrasch/zsh-colors"
zplug "mafredri/zsh-async", from:github
zplug "zsh-users/zsh-history-substring-search"
zplug 'yous/lime', as:theme
#zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
#
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose
#prompt <powerline.zsh>
export ZSH_THEME="lime"

