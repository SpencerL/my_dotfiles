export CLICOLOR="true"
source ~/.git-completion.bash

# terminal git prompt 
function git_branch {
   branch="`git branch 2>/dev/null | grep "^\*" | sed -e "s/^\*\ //"`"
   if [ "${branch}" != "" ];then
       if [ "${branch}" = "(no branch)" ];then
           branch="(`git rev-parse --short HEAD`...)"
       fi
       echo " ($branch)"
   fi
}

export PS1='\u@\h \[\033[01;36m\]\W\[\033[01;32m\]$(git_branch)\[\033[00m\] \$ '
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/texlive/2018basic/bin/x86_64-darwin:$PATH"

# alias
alias book="cd ~/code/django_book"
alias noob="cd ~/code/django_noob"
alias leet="cd ~/code/OJ/leetcode"


alias sftp="rlwrap sftp"
alias jdb="rlwrap jdb"
