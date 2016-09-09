# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export LANG=C

# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export LANG=C

composer () {
    COMPOSER="$(which composer)" || { echo "Could not find composer in path" >&2 ; return 1 ; }
    _php_no_xdebug $COMPOSER $@ ;
    return $? ;
}

_php_no_xdebug () {
    CMD=$@ ;
    EXT_PATH="/etc/php.d" ;
    DISABLED_EXT_PATH="/etc/php.disabled" ;
    XDEBUG_INI="15-xdebug.ini" ;
    sudo mv $EXT_PATH/$XDEBUG_INI $DISABLED_EXT_PATH ;
    `which php` -d "memory_limit=-1" $CMD ;
    STATUS=$? ;
    sudo mv $DISABLED_EXT_PATH/$XDEBUG_INI $EXT_PATH ;
    return $STATUS ;
}
