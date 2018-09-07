#!/bin/sh
DATE=$(date +%F_%H-%M)
Path1=/u01/app/oracle/admin/XE/dpdump

export NLS_LANG ORACLE_HOME ORACLE_SID
NLS_LANG=american_russia.cl8mswin1251
ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
ORACLE_SID=XE

rm -rf /tmp/pos_*
#. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh

/u01/app/oracle/product/11.2.0/xe/bin/exp \'sys/sys as sysdba\' owner=pos file=/tmp/pos_$DATE.dmp log=/tmp/pos_$DATE.log

GZIP=-9 /bin/tar cvzf /backups/pos_$DATE.tgz /tmp/pos_*
