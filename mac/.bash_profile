# Commands aliases
alias ls='ls -G'
alias ll='ls -laG'

# Servers aliases
alias webdev='ssh -A -t acucchieri@webdev.vm "cd /var/www ; bash"'

# bash completion
source ~/.bash_completion/git

# PHP : Scan this dir for additional .ini files
export PHP_INI_SCAN_DIR=/usr/local/etc/php.d php
