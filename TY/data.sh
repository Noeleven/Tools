#!/bin/bash

#datee=`date +%F`
#datee="2016-09-01"

m=`date +%Y-%m`
d=`date +%d`
if [[ $d -le 14 ]] && [[ $d -ge 01 ]]
	then 
	datee="${m}-01"
else
	datee="${m}-15"
fi

curl "http://10.113.2.70:8080/htmlReport/tingyun/res_api3g2${datee}" 			> src/res_api3g2
Rsize=`ls -l /rd/shellstudy/Tools/TY/src/res_api3g2 |awk '{print $5}'`
if [[ $Rsize -le 2048 ]];then
	echo 'empty file'
	exit 2
fi
curl "http://10.113.2.70:8080/htmlReport/tingyun/res_api3g${datee}" 				> src/res_api3g
curl "http://10.113.2.70:8080/htmlReport/tingyun/res_mlvmama${datee}" 		> src/res_mlvmama
curl "http://10.113.2.70:8080/htmlReport/tingyun/rpm_api3g2_a${datee}" 		> src/rpm_api3g2_a
curl "http://10.113.2.70:8080/htmlReport/tingyun/rpm_api3g_a${datee}" 			> src/rpm_api3g_a
curl "http://10.113.2.70:8080/htmlReport/tingyun/rpm_mlvmama_a${datee}" 	> src/rpm_mlvmama_a
curl "http://10.113.2.70:8080/htmlReport/tingyun/rpm_api3g2_ios${datee}"		> src/rpm_api3g2_ios
curl "http://10.113.2.70:8080/htmlReport/tingyun/rpm_api3g_ios${datee}" 		> src/rpm_api3g_ios
curl "http://10.113.2.70:8080/htmlReport/tingyun/rpm_mlvmama_ios${datee}" 	> src/rpm_mlvmama_ios
exit 0
