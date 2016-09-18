#!/bin/bash

#老听云数据，未攻克自动登录
# datee=$1
# other="Pragma: no-cache;Accept-Encoding: gzip, deflate, sdch, br;Accept-Language: zh-CN,zh;q=0.8;Upgrade-Insecure-Requests: 1;User-Agent: Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1;Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8;Cache-Control: no-cache"
# cookie="NTKF_T2D_CLIENTID=guestE51C6555-B621-2E37-A852-926ECFD3EBD4; nTalk_CACHE_DATA={uid:kf_9212_ISME9754_guestE51C6555-B621-2E,tid:1471335550770881}; jsessionid-mobile=cc5fd323-a0c2-4576-a1a0-85b1c4e6a424; ty_app_uid=5b79e6a2426bafaa0d39426497fe38c2; ty_lb_uid=bf955400-1f3bd910; Hm_lvt_93daecc2db29efa5d83566cf580e84af=1471335549; Hm_lpvt_93daecc2db29efa5d83566cf580e84af=1471335566"
# last="Connection: keep-alive"

# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9568&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=1&searchKey=api3g2&reqType=2&pageNo=1&pageSize=2000&hostId=424892"  -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed    > src/res_api3g2
# if [ ! -s src/api3g2 ];then
	# echo 'empty file'
	# exit 2
# fi
# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9568&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=1&searchKey=api3g&reqType=2&pageNo=1&pageSize=1000&hostId=424891"   -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed   > src/res_api3g
# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9573&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=1&searchKey=lvmama&reqType=2&pageNo=1&pageSize=1000&hostId=41699"   -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed   > src/res_mlvmama
# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9573&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=3&searchKey=lvmama&reqType=2&pageNo=1&pageSize=2000&hostId=424892"    -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed  > src/rpm_api3g2_a
# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9573&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=3&searchKey=lvmama&reqType=2&pageNo=1&pageSize=1000&hostId=424891"   -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed   > src/rpm_api3g_a
# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9573&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=3&searchKey=lvmama&reqType=2&pageNo=1&pageSize=1000&hostId=41699"   -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed   > src/rpm_mlvmama_a
# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9568&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=3&searchKey=lvmama&reqType=2&pageNo=1&pageSize=2000&hostId=424892"   -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed   > src/rpm_api3g2_ios
# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9568&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=3&searchKey=lvmama&reqType=2&pageNo=1&pageSize=1000&hostId=424891"   -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed   > src/rpm_api3g_ios
# curl "https://report.tingyun.com/mobile/mobileApplication/selectFilter/http/host/uri.json?&mobileAppId=9568&mobileAppVersionFilterId=&timeType=2&timePeriod=20160&endTime=${datee}%2000%3A00&baseonId=3&searchKey=lvmama&reqType=2&pageNo=1&pageSize=1000&hostId=41699"  -H "${other}"  -H "Cookie: ${cookie}"  -H "${last}" --compressed   > src/rpm_mlvmama_ios

#新数据获取方式

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
