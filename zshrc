# Created by EMPEROR for 5.8

#
#  General
#
#
module_path+=( "/home/saikiran/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin 2>/dev/null
ZMOD=$?

setopt autocd  # Automatically Change Directory If A Directory Is Entered.
setopt notify  # Report Status Of Background Jobs Immediately.
unsetopt bg_nice  # Don't Run All Background Jobs At A Lower Priority.
setopt complete_in_word # Complete From Both Ends Of A Word.
setopt no_always_to_end # Don't Move Cursor To The End Of A Completed Word.
setopt path_dirs  # Perform Path Search Even On Command Names With Slashes.
setopt auto_menu  # Show Completion Menu On A Successive Tab Press.
setopt auto_list  # Automatically List Choices On Ambiguous Completion.
setopt auto_param_slash # If Completed Parameter Is A Directory, Add A Trailing Slash.

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=${HISTFILE:-$HOME/.zsh_history}
setopt bang_hist                # Treat The '!' Character Specially During Expansion.
setopt append_history #  zsh sessions will append their history list to the history file, rather than replace it.
setopt inc_append_history       # Write To The History File Immediately, Not When The Shell Exits.
setopt share_history            # Share History Between All Sessions.
setopt hist_expire_dups_first   # Expire A Duplicate Event First When Trimming History.
setopt hist_ignore_dups         # Do Not Record An Event That Was Just Recorded Again.
setopt hist_ignore_all_dups     # Delete An Old Recorded Event If A New Event Is A Duplicate.
setopt hist_find_no_dups        # Do Not Display A Previously Found Event.
setopt hist_ignore_space        # Do Not Record An Event Starting With A Space.
setopt hist_save_no_dups        # Do Not Write A Duplicate Event To The History File.
setopt hist_verify              # Do Not Execute Immediately Upon History Expansion.
setopt extended_history         # Show Timestamp In History.

setopt list_packed              # Try to make the completion list smaller.

setopt interactive_comments     # Allow comments even in interactive shells.

#
#   Aliases
#

alias ls='ls -h --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lal='ls -Al'
alias cs='setxkbmap -option caps:escape'
alias rm='rm -i'
alias yay='yay --color=always'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias mkdir='mkdir -pv'
alias reblue='sudo systemctl restart bluetooth.service'
D=$HOME/Downloads
alias -g ...=../..
alias -g ....=../../..
alias -g G="| grep"
alias -g H='sed 11q'
alias -g L="less -R"
alias -g T="tail"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null"

#
# Bind Keys
#
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

#
# Functions
#
mkcd() { mkdir -p "$@" && cd "$@"; }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "$HOME/.zcompcache"
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*' rehash true

export EDITOR=nvim
export DE=kde
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$PATH:/home/saikiran/tools/flutter/bin"
export PATH="$PATH:/home/saikiran/.cargo/bin"

export JAVA_HOME=/home/saikiran/.jdks/openjdk-15.0.2
export PATH="$PATH:/home/saikiran/.jdks/openjdk-15.0.2/bin"


if [[ ! -f ~/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p ~/.zinit && command chmod g-rwX ~/.zinit
    command git clone https://github.com/zdharma/zinit ~/.zinit/bin && \\
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \\
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

if [[ $ZMOD -ne 0 ]]
then
	zinit module build
fi
unset ZMOD

setopt promptsubst

zinit ice lucid as"command" from"gh-r" bpick"*x86_64-unknown-linux-gnu*" pick"starship"  src'/home/saikiran/tools/kingify/starship_prompt' 
zinit light starship/starship
#zinit ice lucid multisrc'/home/saikiran/tools/kingify/spaceship/*.zsh'
#zinit light denysdovhan/spaceship-prompt
# zinit ice pick'spacezsh.zsh' \
#    compile'{presets/^(*.zwc),lib/**/^(*.zwc),sections/^(*.zwc)}'
# zinit light laggardkernel/spacezsh-prompt

#zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
#    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
#    atload'zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"'
#zinit light trapd00r/LS_COLORS

zinit ice wait lucid atload'!_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242"

zinit ice wait blockf lucid atpull'zinit creinstall -q .' atload"zicompinit; zicdreplay"
zinit load zsh-users/zsh-completions

zinit ice wait lucid atinit'ZINIT[COMPINIT_OPTS]=-C;zicompinit; zicdreplay'
zinit light zdharma/fast-syntax-highlighting

zinit as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' pick"direnv" src"zhook.zsh" for \
        direnv/direnv

zinit ice wait"0b" lucid as"command" from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit ice wait"0b" blockf lucid
zinit light rupa/z

zinit ice wait"0a" lucid
zinit light changyuheng/fz

zinit ice wait"0b" lucid as"command" from"gh-r" mv"ripgrep* -> rg" pick"rg/rg"
zinit light BurntSushi/ripgrep

# Add `git dsf` command to git
zplugin ice wait lucid as"program" pick"bin/git-dsf"
zplugin light zdharma/zsh-diff-so-fancy

# Run `fg` command to return to foregrounded (Ctrl+Z'd) vim
zinit ice wait"0b" lucid
zinit light mdumitru/fancy-ctrl-z

zinit ice wait lucid
zinit light lainiwa/gitcd
export GITCD_HOME=${HOME}/tools
export GITCD_TRIM=1

# Alias Tips
zinit ice wait"0b" lucid
zinit light djui/alias-tips

zinit ice depth'3' lucid trigger-load'!x'
zinit snippet OMZ::plugins/extract/extract.plugin.zsh

zinit ice lucid trigger-load'!ga;!gcf;!gclean;!gd;!glo;!grh;!gss'
zinit light wfxr/forgit

zinit ice wait"2" lucid trigger-load'!gi;!gii'
zinit load voronkovich/gitignore.plugin.zsh

# Don't bind these keys until ready
bindkey -r '^[[A'
bindkey -r '^[[B'
function __bind_history_keys() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}
# History substring searching
zinit ice wait lucid atload'__bind_history_keys'
zinit light zsh-users/zsh-history-substring-search

zplugin ice wait"0" lucid
zinit load zdharma/history-search-multi-word

zinit light zinit-zsh/z-a-readurl

zinit ice wait"0c" lucid
export NVM_LAZY_LOAD=true
zinit load lukechilds/zsh-nvm

nvim () {
    unset -f nvim
    _zsh_nvm_load
    nvim "$@"
}

zplugin ice as"completion"
zplugin snippet https://github.com/esc/conda-zsh-completion/blob/master/_conda
zstyle ":conda_zsh_completion:*" use-groups true

autoload -U compinit && compinit

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
 __conda_setup="$('/home/saikiran/tools/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/saikiran/tools/miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/saikiran/tools/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/saikiran/tools/miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

