#!/bin/sh

# fancy pants colored bash outputs
RESTORE=$(echo -en '\033[0m')
RED=$(echo -en '\033[00;31m')
GREEN=$(echo -en '\033[00;32m')
YELLOW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
LRED=$(echo -en '\033[01;31m')
LGREEN=$(echo -en '\033[01;32m')
LYELLOW=$(echo -en '\033[01;33m')
LBLUE=$(echo -en '\033[01;34m')

# symlink nf commands to $PATH
ln -s /data/nfsen/bin/nfsen /usr/local/bin/nfsen
ln -s /data/nfsen/bin/nfsend /usr/local/bin/nfsend
ln -s /data/flow-generator /usr/local/bin/flow-generator

# TODO add to supervisord
if [ -f /data/nfsen/bin/nfsen ]; then
    echo "Starting nfsen and apache.."
    /data/nfsen/bin/nfsen start
    sleep 3
else
    echo "nsfen binary not found in /data/nfsen/bin/"
fi

# Pre-built protocol filters. Add more to the definition by including them below
nfsen --add-profile zone1_profile
nfsen --add-channel zone1_profile/icmp filter='proto icmp' colour='#48C6FF'
nfsen --add-channel zone1_profile/chargen filter='port 19' colour='#ED62FF'
nfsen --add-channel zone1_profile/ftp filter='port 21' colour='#B0D02C'
nfsen --add-channel zone1_profile/ssh filter='port 22' colour='#8536FF'
nfsen --add-channel zone1_profile/telnet filter='port 23' colour='#4FFF10'
nfsen --add-channel zone1_profile/dns filter='port 53' colour='#305FFF'
nfsen --add-channel zone1_profile/http filter='port 80' colour='#AEFF20'
nfsen --add-channel zone1_profile/dns filter='port 110' colour='#BFFFFF'
nfsen --add-channel zone1_profile/ntp filter='port 123' colour='#FF6530'
nfsen --add-channel zone1_profile/loc-srv filter='port 135' colour='#6267FF'
nfsen --add-channel zone1_profile/netbios-ns filter='port 137' colour='#FF8662'
nfsen --add-channel zone1_profile/snmp filter='port 161' colour='#77FF62'
nfsen --add-channel zone1_profile/https filter='port 443' colour='#A787FF'
nfsen --add-channel zone1_profile/microsoft-ds filter='port 445' colour='#F0DE65'
nfsen --add-channel zone1_profile/http-alt filter='port 8080' colour='#209EFF'
nfsen --add-channel zone1_profile/ms-sql-s filter='port 1433' colour='#FF6CAC'
nfsen --add-channel zone1_profile/mysql filter='port 3306' colour='#FF3688'
nfsen --add-channel zone1_profile/rdp filter='port 3389' colour='#FFFD6C'
nfsen --add-channel zone1_profile/sip filter='port 5060' colour='#FFD962'
nfsen --add-channel zone1_profile/p2p filter='port 6681' colour='#369EFF'
nfsen --add-channel zone1_profile/bittorrent filter='port 6682' colour='#FF6B36'
nfsen --commit-profile zone1_profile

echo -e "${LYELLOW} *Note*:${RESTORE} Above errors ${LYELLOW}ERR Channel info file missing${RESTORE} are expected until flow data creates the files."
echo "${GREEN}### Done! ${RESTORE} point your browser at http://<ip_address>>/nfsen/nfsen.php and change"
echo -e "${GREEN}### ${RESTORE} the profile to ${RED}zone1_profile${RESTORE} to view the example predefined filters"
echo -e "${GREEN}### ${RESTORE} Run 'nfsen status' to view daemon status and details and 'netstat -lntu' to view listening ports."
echo -e "${BLUE}### ${RESTORE} If you want to generate some test flows, I wrote a quick flow generator app that is in the /data/ directory"
echo -e "${BLUE}### ${RESTORE} ${RED}flow-generator  -t 127.0.0.1 -p 9995${RESTORE}"
echo -e "If you let it run for around 15-20 minutes or so and you should see flows being generated in the web ui"
echo -e ''
echo -e "${BLUE}### ${RESTORE} 'You can also put any other collector target address you want to test against. The generated protocols match the nfsen sample filter above"
