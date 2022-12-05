#!/bin/bash
    #
    number=48
    #
    backup_dir=/var/db/backup
    #
    dd=$(TZ=UTC-8 date "+%Y-%m-%d-%H%M")
    operate_time=$(TZ=UTC-8 date "+%Y-%m-%d %H:%M:%S")
    #
    tool=/usr/bin/mysqldump
    #
    username=root
    #
    password=P@7hqacnCF\$y
    #
    $tool -u $username -p$password -hmysql-standalone-svc -P3306 --databases chjc_mes chjc_wms data_exchange_edge report_dw zhjc_component zhjc_lims > $backup_dir/bak-database-$dd.sql
    #
    echo "$operate_time [C] create $backup_dir/bak-database-$dd.sql" >> $backup_dir/log.txt
    #
    delfile=`ls -l -crt $backup_dir/*.sql | awk '{print $9}' | head -1`
    #
    count=`ls -l -crt $backup_dir/*.sql | awk '{print $9}' | wc -l`
    if [ $count -gt $number ]
    then
      rm $delfile
      #
      echo "$operate_time [D] DELETE $delfile" >> $backup_dir/log.txt
    fi