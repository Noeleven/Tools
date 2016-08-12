#!/bin/bash

rpm_api3g2_ios="src/rpm_api3g2_ios"
rpm_api3g2_a="src/rpm_api3g2_a"

rpm_api3g_ios="src/rpm_api3g_ios"
rpm_api3g_a="src/rpm_api3g_a"

rpm_mlvmama_ios="src/rpm_mlvmama_ios"
rpm_mlvmama_a="src/rpm_mlvmama_a"

dorpm="mysqldata/dorpm.sql"

username=root
password=lvmama

#rpm_api3g2_a & rpm_api3g2_ios 分析元数据过滤
#原始数据tmp0，拆分数据tmp00，数据合并为tmp000,
#原始数据tmp1，拆分数据tmp11，数据合并为tmp111
#2组数据合并为tmp111,压缩合并为tmp
grep name ${rpm_api3g2_a} | awk -F "\"" '{print $4}' > tmp0
grep name ${rpm_api3g2_ios} | awk -F "\"" '{print $4}' > tmp1
lines0=`wc -l tmp0 | awk -F " " '{print $1}'`
lines1=`wc -l tmp1 | awk -F " " '{print $1}'`

echo -n '' > tmp00
echo -n '' > tmp11
#android获取安卓数据
for i in `seq 1 ${lines0}`
do
	info=`sed -n ${i}p tmp0`
	if [[ $info =~ "method" ]];then
			method=`echo $info |sed 's/ /\&/g;s/\&/\n/g' |grep method | cut -d '=' -f 2`
			value_rpm=`grep value ${rpm_api3g2_a} | sed -n ${i}p | awk -F ":" '{print $2}'|sed "s/ //g;s/\r//g" `
			value=`awk 'BEGIN{printf("%d\n",'${value_rpm}'*1440+0.5)}'` 
			if [[ $info =~ "lvversion" ]];then lvversion=`echo $info | grep -o '7\.[0-9]\.[0-9]'|sed 's/\.//g'`;else lvversion=NO;fi
			if [[ $info =~ "&version" ]];then version=`echo $info | grep -o '[0-9]\.0\.0'`;else version=NO; fi
			echo "${method} ${lvversion} ${version} ${value}" >> tmp00
	else
	continue
	fi
done
#ios获取数据
for i in `seq 1 ${lines1}`
do
	info1=`sed -n ${i}p tmp1`
	if [[ $info1 =~ "method" ]];then
			method=`echo $info1 |sed 's/ /\&/g;s/\&/\n/g' |grep method | cut -d '=' -f 2`
			value_rpm=`grep value ${rpm_api3g2_ios} | sed -n ${i}p | awk -F ":" '{print $2}'|sed "s/ //g;s/\r//g" `
			value=`awk 'BEGIN{printf("%d\n",'${value_rpm}'*1440+0.5)}'` 
			if [[ $info1 =~ "lvversion" ]];then lvversion=`echo $info | grep -o '7\.[0-9]\.[0-9]'|sed 's/\.//g'`;else lvversion=NO;fi
			if [[ $info1 =~ "&version" ]];then version=`echo $info1 | grep -o '[0-9]\.0\.0'`;else version=NO; fi
			echo "${method} ${lvversion} ${version} ${value}" >> tmp11
	else
	continue
	fi
done
#先对各自数据做一次合并，安卓要求接口和lvversion一致，ios要求3项一致
awk '{a[$1" "$2]+=$4;}END{for(i in a){print i" "$3" "a[i];}}'   tmp00 >  tmp000
awk '{a[$1" "$2" "$3]+=$4;}END{for(i in a){print i" "a[i];}}' tmp11 > tmp111
#以ios为基准，给android填充version号
iosline=`wc -l tmp11 | awk '{print $1}'`
for i in `seq $iosline`
do
	info2="sed -n ${i}p tmp11"
	method=`$info2 |awk '{print $1}'`
	lvversion=`$info2 |awk '{print $2}'`
	version=`$info2 |awk '{print $3}'`
	grep -nw $method tmp000 > tmpp
	changeline=`awk '{if($2=="'$lvversion'"){gsub("NO","'$version'",$3);print $0}else{pass}}' tmpp | awk -F':' '{print$1}' `
	for i in $changeline
	do 
		sed -i ''${i}'s/\(.*\)NO/\1'$version'/g' tmp000
	done
done

cat tmp000 >> tmp111
awk '{a[$1" "$3]+=$4;}END{for(i in a){print i" "a[i];}}' tmp111 > tmp

#存入数据库
echo 'use tingyun' > $dorpm 
echo 'TRUNCATE ty_r;' >> $dorpm
echo 'insert into ty_r (`method`,`version`,`rpm`) VALUE' >> $dorpm
awk '{print "(\x27"$1"\x27,\x27"$2"\x27,\x27"$3"\x27),"}' tmp >> $dorpm
sed -i "\$s#),#);#g" $dorpm

rm -f tmp*

#处理api3g
grep name ${rpm_api3g_a} | awk -F "\"" '{print $4}' > tmp0
grep name ${rpm_api3g_ios} | awk -F "\"" '{print $4}' > tmp1
lines0=`wc -l tmp0 | awk -F " " '{print $1}'`
lines1=`wc -l tmp1 | awk -F " " '{print $1}'`
echo -n '' > tmp00
echo -n '' > tmp11

for i in `seq 1 ${lines0}`
do
	info=`sed -n ${i}p tmp0`
	method=`echo $info |sed 's/POST //g'`
	value_rpm=`grep value ${rpm_api3g_a} | sed -n ${i}p | awk -F ":" '{print $2}'|sed "s/ //g;s/\r//g" `
	value=`awk 'BEGIN{printf("%d\n",'${value_rpm}'*1440+0.5)}'`
	echo "${method} ${value}" >> tmp00
done
for i in `seq 1 ${lines1}`
do
	info1=`sed -n ${i}p tmp1`
	method=`echo $info |sed 's/POST //g'`
	value_rpm=`grep value ${rpm_api3g_ios} | sed -n ${i}p | awk -F ":" '{print $2}'|sed "s/ //g;s/\r//g" `
	value=`awk 'BEGIN{printf("%d\n",'${value_rpm}'*1440+0.5)}'`
	echo "${method} ${value}" >> tmp11
done
cat tmp00 >> tmp11
awk '{a[$1]+=$2;}END{for(i in a){print i" "a[i];}}' tmp11 > tmp

echo 'insert into ty_r (`method`,`rpm`) VALUE' >> $dorpm
awk '{print "(\x27"$1"\x27,\x27"$2"\x27),"}' tmp >> $dorpm
sed -i "\$s#),#);#g" $dorpm

rm -f tmp*

#处理mlvmama

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

grep name ${rpm_mlvmama_a} | awk -F "\"" '{print $4}' > tmp0
grep name ${rpm_mlvmama_ios} | awk -F "\"" '{print $4}' > tmp1
lines0=`wc -l tmp0 | awk -F " " '{print $1}'`
lines1=`wc -l tmp1 | awk -F " " '{print $1}'`
echo -n '' > tmp00
echo -n '' > tmp11

for u in ${mlvmamaapi[@]}
do
	grep -nw ${u}$ tmp0 > tmp00
	
	cat tmp00 | while read line
	do
        linenum=`echo $line	| cut -d ":" -f1`
		if [[ $line =~ "POST" ]];then
			post=POST
			method=`sed -n ${linenum}p tmp0  | cut -d ' ' -f 2`
		else
			post=NO
			method=`sed -n ${linenum}p tmp0 | cut -d ':' -f 2`
		fi
		value_rpm=`grep value ${rpm_mlvmama_a} | sed -n ${linenum}p | awk -F ":" '{print $2}'|sed -e "s/ //g;s/\r//g" `
		value=`awk 'BEGIN{printf("%d\n",'${value_rpm}'*1440+0.5)}'`
		echo "${method} ${post} ${value}" >> tmp000
	done
done
for u in ${mlvmamaapi[@]}
do
	grep -nw ${u}$ tmp1 > tmp11
	
	cat tmp11 | while read line
	do
        linenum=`echo $line	| cut -d ":" -f1`
		if [[ $line =~ "POST" ]];then
			post=POST
			method=`sed -n ${linenum}p tmp1 |grep POST | cut -d ' ' -f 2`
		else
			post=NO
			method=`sed -n ${linenum}p tmp1 | cut -d ':' -f 2`
		fi
		value_rpm=`grep value ${rpm_mlvmama_ios} | sed -n ${linenum}p | awk -F ":" '{print $2}'|sed -e "s/ //g;s/\r//g" `
		value=`awk 'BEGIN{printf("%d\n",'${value_rpm}'*1440+0.5)}'`
		echo "${method} ${post} ${value}" >> tmp111
	done
done

cat tmp000 >> tmp111
awk '{a[$1" "$2]+=$3;}END{for(i in a){print i" "a[i];}}' tmp111 > tmp

echo 'insert into ty_r (`method`,`post`,`rpm`) VALUE' >> $dorpm
awk '{print "(\x27"$1"\x27,\x27"$2"\x27,\x27"$3"\x27),"}' tmp >> $dorpm
sed -i "\$s#),#);#g" $dorpm

rm -f tmp*

mysql -plvmama < /rd/shellstudy/Tools/TY/mysqldata/dorpm.sql

#查询语句输出到文件中
mysql -u$username -p$password tingyun -N -e "SELECT T1.host_id,T1.des,T1.method,T1.version,T1.lvversion,T1.https,T1.post,T1.response,T2.rpm from ty_s as T1 left outer join ty_r as T2 on T1.method = T2.method and  T1.version = T2.version WHERE T1.host_id=424892  order by T1.method" > Report

mysql -u$username -p$password tingyun -N -e "SELECT T1.host_id,T1.des,T1.method,T1.version,T1.lvversion,T1.https,T1.post,T1.response,T2.rpm from ty_s as T1 left outer join ty_r as T2 on T1.method = T2.method  WHERE T1.host_id=424891  order by T1.method " >> Report 

mysql -u$username -p$password tingyun -N -e "SELECT T1.host_id,T1.des,T1.method,T1.version,T1.lvversion,T1.https,T1.post,T1.response,T2.rpm from ty_s as T1 left outer join ty_r as T2 on T1.method = T2.method and T1.post=T2.post WHERE T1.host_id=41699 order by T1.method" >> Report

exit 0














