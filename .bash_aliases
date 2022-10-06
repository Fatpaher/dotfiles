#Generate ctags for rais project
alias ctag-r='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias cb='pbcopy'

alias cn_db_rebuild='git checkout develop db/structure.sql; rails db:drop db:create db:structure:load db:migrate'

