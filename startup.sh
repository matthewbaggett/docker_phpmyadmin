#!/bin/bash
printenv
prefix="tcp://"
suffix=":3306"
HOSTNAME=${DB_PORT#$prefix}
HOSTNAME=${HOSTNAME%$suffix}
DELAY=20
echo "Waiting $DELAY seconds for MySQL to come up at $HOSTNAME"
sleep $DELAY;
echo "Importing phpmyadmin.sql"
mysql -u root -p$DB_ENV_MYSQL_ROOT_PASSWORD -h $HOSTNAME < phpmyadmin.sql
/apache-run.sh
