#!/bin/bash

rpm_api3g2_ios="src/rpm_api3g2_ios"
rpm_api3g2_a="src/rpm_api3g2_a"

rpm_api3g_ios="src/rpm_api3g_ios"
rpm_api3g_a="src/rpm_api3g_a"

rpm_mlvmama_ios="src/rpm_mlvmama_ios"
rpm_mlvmama_a="src/rpm_mlvmama_a"

dorpm="mysqldata/dorpm.sql"

username=root
password=lvmama#处理mlvmama

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