function log
    set LOGFILE "$HOME/log.txt"
    date "+%y%m%d-%H%M" >>$LOGFILE
    echo $argv >>$LOGFILE
end
