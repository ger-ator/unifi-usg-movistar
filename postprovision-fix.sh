#!/bin/vbash

readonly logFile="/var/log/postprovision-fix.log"

source /opt/vyatta/etc/functions/script-template

configure > ${logFile}
delete system task-scheduler task postprovision >> ${logFile}
commit >> ${logFile}

delete service dns dynamic interface eth0.6  >> ${logFile}
delete vpn l2tp remote-access dhcp-interface eth0.6 >> ${logFile}
set vpn l2tp remote-access outside-address 0.0.0.0 >> ${logFile}

commit >> ${logFile}
save >> ${logFile}

exit
