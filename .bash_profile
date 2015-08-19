################
#   Startup
################

# echo '---------------------
# ..::| Hey  Kelly |::..
# ---------------------';

#export PATH=/usr/local/bin:$PATH

################
#   Aliases
################

# open sublime
# alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# management
alias cds='cd /Applications/MAMP/htdocs/sites/'
alias cl='clear'
alias wpcon='subl wp-config.php'
function wpth() { subl wp-content/themes/"$1"; }
alias newweb='bash /Applications/MAMP/htdocs/new-website.lib/create.sh'

# server
alias sshzen='ssh devzenadmin@dev1.zenman.com'
source /Applications/MAMP/htdocs/zen-deploy/modules/init.sh;

# database
# alias lmysql='/Applications/MAMP/Library/bin/mysql -hlocalhost -uroot -proot'
# alias lmysqldump='/Applications/MAMP/Library/bin/mysqldump -hlocalhost -uroot -proot'
# alias mysql='/Applications/MAMP/Library/bin/mysql'
# alias mysqldump='/Applications/MAMP/Library/bin/mysqldump'
alias far='php /Applications/MAMP/htdocs/_far.php localhost root root'
function lfar() { php /Applications/MAMP/htdocs/_far.php localhost root root "$1" 10.0.1.253:8888 localhost:8888; }
function rfar() { php /Applications/MAMP/htdocs/_far.php localhost root root "$1" localhost:8888 10.0.1.253:8888; }

# git helpers
alias ga='git add'
alias gaa='git add --all .'
alias gpu='git push'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gc='git checkout'
alias gpu='git pull'
alias gcl='git clone'
alias gme='git merge'
alias glg='git lg'
alias gp='git push'
# git special helpers
alias gpod='git push'
alias gpot='git push origin test'
alias gpos='git push origin stage'
alias gpom='git push origin master'
alias gdb='grunt dbexp && git add --all `git rev-parse --show-toplevel` && git commit --amend -m "`git log -1 --pretty=%B`"'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# ability move stylesheet
alias am='bash ~/dev/whydata/ability2/web/movestyles.sh'


################
#   Coloring
################

#enables color in the terminal bash shell export
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'

################
#   Prompt
################

function git_info() {
    # check if we're in a git repo
    git rev-parse --is-inside-work-tree &>/dev/null || return

    # quickest check for what branch we're on
    branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

    # check if it's dirty (via github.com/sindresorhus/pure)
    dirty=$(git diff --quiet --ignore-submodules HEAD &>/dev/null; [ $? -eq 1 ]&& echo -e "*")

    echo ' ['$branch$dirty']'
}
PS1="\w\$(git_info)\n\[\e[0;30m\]\[\e[46m\]::\[\e[m\]\[\e[m\] ";

################
#   Autocomplete
################
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

complete -o default -o nospace -F _git_branch gb
complete -o default -o nospace -F _git_checkout gc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
