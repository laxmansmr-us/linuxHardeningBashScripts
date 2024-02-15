echo "PROMPT_COMMAND='history -a >(logger -p local1.notice -t "[bash] $USER")'" >> /etc/bashrc

printf "
# command line audit logging
local1.* -/var/log/commands.log"  >> /etc/rsyslog.conf

systemctl restart --now rsyslog

printf "
/var/log/commands.log {
    rotate 4
    weekly
    missingok
    notifempty
    compress
    delaycompress
    sharedscripts
    postrotate
        /usr/lib/rsyslog/rsyslog-rotate
    endscript
}
" >> /etc/logrotate.d/file
