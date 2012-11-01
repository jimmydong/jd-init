# location /etc/profile.d/jimmy.sh
# Shortcut alias by jimmy 20070329
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -&#62; Prevents accidentally clobbering files.
alias mkdir='mkdir -p'
alias ps='ps -axf --cols=200'
#alias pstree='pstree -A'
alias h='history'
alias j='jobs -l'
alias which='type -all'
alias ..='cd ..'
alias path='echo -e ${PATH//:/\\n}'
alias du='du -kh'
alias df='df -kTh'
alias p="echo -e \`pstree | sed 's/\\\\(.*\\\\)/\\\\1\\\\\\\\n/' | sed 's/-httpd/-\\\\\\\\E\\\\[31;1mhttpd\\\\\\\\E\\[0m/' | sed 's/-mysqld/-\\\\\\\\E\\\\[32;1mmysqld\\\\\\\\E\\[0m/'\`"
alias psall='ps -axf --width 600'
