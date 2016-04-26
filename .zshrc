#-------------------------- PATH Settings ------------------------------
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# brew cask alias, ~/Applications --> /Applications (Added on 12/25,2015)
# export HOMEBREW_CASK_OPTS="--appdir=/Applications"

#zsh-completions 
fpath=(/usr/local/share/zsh-completions $fpath)
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# export MANPATH="/usr/local/man:$MANPATH"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#anyenv (12/25, 2015) 

if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
    #path to shims
    for env in `ls $HOME/.anyenv/envs`
    do
        export PATH="$HOME/.anyenv/envs/$env/shims:$PATH"
        for ver in `ls $HOME/.anyenv/envs/$env/versions`
            do
                export PATH="$HOME/.anyenv/envs/$env/versions/$ver/bin:$PATH"
            done
    done
    
fi

#anaconda
#export PATH="$HOME/anaconda/bin:$PATH"

# gnu gcc
export PATH="/usr/local/gcc-5.3.0/bin:$PATH"
alias gcc='gcc-5.3.0'
alias cc='gcc-5.3.0'
alias g++='g++-5.3.0'
alias c++='c++-5.3.0'
alias cpp='cpp-5.3.0'

export C_INCLUDE_PATH="/usr/local/gcc-5.3.0/include:$C_INCLUDE_PATH"
export CPLUS_INCLUDE_PATH="/usr/local/gcc-5.3.0/include:$CPLUS_INCLUDE_PATH" 
export LIBRARY_PATH="/usr/local/lib:/usr/lib/:$LD_LIBRARY_PATH"
#export LD_LIBRARY_PATH="/usr/local/gcc-5.3.0/lib" 

#LATEX
PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-darwin/
#------------------------- /PATH Settings ------------------------------

#-------------------------- alias -----------------------------------
alias ls='ls -aF'
alias ll='ls -l'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias latexmk='latexmk -pvc'

# 現在 mongodb と redisを自動起動する設定にしている 
#mongo server起動
alias mongodrun='mongod --fork --config /usr/local/etc/mongod.conf &'
#alias mongodon='mongod --dbpath /usr/local/var/db/mongo --journal'
alias mongodrepair='mongod --dbpath /usr/local/var/db/mongo --repair'

#meetpid用に mongo
#alias mongodmprun='mongod --fork --logpath $HOME/Work/meetpid/meetpid-web/db/logs/log.txt --nojournal --noprealloc --dbpath $HOME/Work/meetpid/meetpid-web/db'
#alias mongodrepair='mongod --dbpath $HOME/Work/meetpid/meetpid-web/db/mongo --repair'
#mongo 起動確認
#ps -ef | grep mongod

#redis 停止
#alias redisoff='launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.redis.plist'

#-------------------------- /alias -----------------------------------

# -------------------  zsh (12/25, 2015) ----------------------------------

setopt no_beep           # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt auto_pushd        # cd時にディレクトリスタックにpushdする
setopt correct           # コマンドのスペルを訂正する
setopt magic_equal_subst # =以降も補完する(--prefix=/usrなど)
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt equals            # =commandを`which command`と同じ処理にする

### Complement ###
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない

# ---------------------- /zsh --------------------------------------------

# ------------------ oh-my-zsh setting (12/25, 2015)-----------------------

# Set the theme: -->  ~/.oh-my-zsh/themes/
# Theme:==> https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="random" <-- change everytime
#ZSH_THEME="robbyrussell"
#ZSH_THEME="blinks"
ZSH_THEME="af-magic"

# Time stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

#plugins ->  ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx bundler brew)

# User configuration
source $ZSH/oh-my-zsh.sh

# manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
# ------------------ /oh-my-zsh setting ------------------------------
