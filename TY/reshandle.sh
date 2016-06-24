#!/bin/bash

res_api3g2="src/res_api3g2"
res_api3g="src/res_api3g"
res_mlvmama="src/res_mlvmama"

rpm_api3g2_ios="src/rpm_api3g2_ios"
rpm_api3g2_a="src/rpm_api3g2_a"

rpm_api3g_ios="src/rpm	_api3g_ios"
rpm_api3g_a="src/rpm_api3g_a"

rpm_mlvmama_ios="src/rpm_mlvmama_ios"
rpm_mlvmama_a="src/rpm_mlvmama_a"

dores="mysqldata/dores.sql"
dorpm="mysqldata/dorpm.sql"

username=root
password=lvmama


#handle res_api3g2，格式不一，需要分开处理 name 行数和 value行数一致
grep name ${res_api3g2} | awk -F "\"" '{print $4}' > tmp
lines=`wc -l tmp | awk -F " " '{print $1}'`
echo 'use tingyun;' > $dores
echo 'TRUNCATE ty_s;' > $dores
echo 'insert into ty_s (`method`,`version`,`lvversion`,`https`,`post`,`response`,`des`,`host_id`) VALUE' >> $dores

for i in `seq 1 ${lines}`
do
	info=`sed -n ${i}p tmp`
	if [[ $info =~ "method" ]];then
		if [[ $info =~ "productId" ]] || [[ $info =~ "keyword" ]];then continue;
		else
			method=`echo $info |sed 's/ /\&/g;s/\&/\n/g' |grep method | cut -d '=' -f 2`
			value=`grep value ${res_api3g2} | sed -n ${i}p | awk -F ":" '{print $2}'|sed "s/ //g;s/\r//g" `
			host_id=`grep host_id ${res_api3g2} | sed -n ${i}p | awk -F ":" '{print $2}'|sed "s/ //g;s/\r//g;s/\,//g" `
			des=`mysql -u$username -p$password tingyun -N -e "select des from api where method='${method}'"`
			if [[ $info =~ "POST" ]];then post=POST;else  post=NO;fi
			if [[ $info =~ "https" ]];then https=HTTPS;else https=NO; fi
			if [[ $info =~ "lvversion" ]];then lvversion=`echo $info | grep -o '7\.[0-9]\.[0-9]'`;else lvversion=NO;fi
			if [[ $info =~ "&version" ]];then version=`echo $info | grep -o '[0-9]\.0\.0'`;else version=NO; fi
			
			if [ $i -eq $lines ];then
			echo "('${method}','${version}','${lvversion}','${https}','${post}','${value}','${des}','${host_id}');" >> $dores
			else
			echo "('${method}','${version}','${lvversion}','${https}','${post}','${value}','${des}','${host_id}')," >> $dores
			fi
		fi
	else
	continue
	fi
done

#res_api3g
grep name ${res_api3g} | awk -F "\"" '{print $4}' > tmp1
lines1=`wc -l tmp1 | awk -F " " '{print $1}'`
echo 'insert into ty_s (`method`,`version`,`lvversion`,`https`,`post`,`response`,`des`,`host_id`) VALUE' >> $dores

for o in `seq 1 ${lines1}`
do
	info1=`sed -n ${o}p tmp1`
	if [[ $info1 =~ "POST" ]];then
		post=POST
		method=`echo $info1 | cut -d ' ' -f 2`
	else
		post=NO
		method=`echo $info1 | cut -d ' ' -f 1`
	fi
	value=`grep value ${res_api3g} | sed -n ${o}p | awk -F ":" '{print $2}'|sed "s/ //g;s/\r//g" `
	host_id=`grep host_id ${res_api3g} | sed -n ${o}p | awk -F ":" '{print $2}'|sed "s/ //g;s/\r//g;s/\,//g" `
	des=`mysql -u$username -p$password tingyun -N -e "select des from api where method='${method}'"`
	version=''
	lvversion=''
	if [[ $info1 =~ "https" ]];then https=HTTPS;else https=NO; fi
		
	if [ $o -eq $lines1 ];then
	echo "('${method}','${version}','${lvversion}','${https}','${post}','${value}','${des}','${host_id}');" >> $dores
	else
	echo "('${method}','${version}','${lvversion}','${https}','${post}','${value}','${des}','${host_id}')," >> $dores
	fi
done

#$res_mlvmama
#android 才有一些具体接口，包含大量的商品信息，需要过滤
mlvmamaapi=(
/new/api/router/rest.do
/api/router/rest.do
/trip/router/rest.do
/client-service/router/rest.do
/clutter/trainPay/toPay.do
/clutter/flightPay/toPay.do
/clutter/hotelPay/toPay.do
/activity/index.php
/bullet/index.php
/bullet/index.php?s=/Api/autoStation
/bullet/index.php?s=/Api/getBootAd
/bullet/index.php?s=Api/statusSwitch
/bullet/index.php?s=/HtmlLocalization/getAppImage
/bullet/index.php?s=/Api/getInfos
)

grep name ${res_mlvmama} | awk -F "\"" '{print $4}' > tmp2
echo 'insert into ty_s (`method`,`version`,`lvversion`,`https`,`post`,`response`,`des`,`host_id`) VALUE' >> $dores

for u in ${mlvmamaapi[@]}
do
	grep -nw ${u}$ tmp2 > info2
	#lines2=`grep -nw ${u}$ tmp2 | cut -d ":" -f1`
	
	cat info2 | while read line
	do
        linenum=`echo $line	| cut -d ":" -f1`
		if [[ $line =~ "https" ]];then https=HTTPS;else https=NO; fi
		if [[ $line =~ "POST" ]];then
			post=POST
			method=`sed -n ${linenum}p tmp2 |grep POST | cut -d ' ' -f 2`
		else
			post=NO
			method=`sed -n ${linenum}p tmp2 | cut -d ':' -f 2`
		fi
		value=`grep value ${res_mlvmama} | sed -n ${linenum}p | awk -F ":" '{print $2}'|sed -e "s/ //g;s/\r//g" `
		host_id=`grep host_id ${res_mlvmama} | sed -n ${linenum}p | awk -F ":" '{print $2}'|sed  -e "s/ //g;s/\r//g;s/\,//g" `
		des=`mysql -u$username -p$password tingyun -N -e "select des from api where method='${method}'"`
		version=''
		lvversion=''
			if [ "$u"x = "/bullet/index.php?s=/Api/getInfos"x ];then
			echo "('${method}','${version}','${lvversion}','${https}','${post}','${value}','${des}','${host_id}');" >> $dores
			else
			echo "('${method}','${version}','${lvversion}','${https}','${post}','${value}','${des}','${host_id}')," >> $dores
			fi
	done
	

done

rm -f tmp* info2

mysql -plvmama < /rd/shellstudy/Tools/TY/mysqldata/dores.sql

exit 0














