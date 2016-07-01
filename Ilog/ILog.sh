#!/bin/bash
#1. curl the url & save it to a file（以接口命名）.
#2. anaylse to get debugMsg
#3. 执行多次的结果保存到一个文件
#4. count avg min max && print
#5. 
#usage

if [ "$#" != 2 ]; then
	echo "usage: nohup ILog.sh 执行次数 执行间隔时间秒 &"
	echo "具体的接口URL需要在脚本中配" 
	exit 2
fi
set -x
#URL="http://m.lvmama.com/api/router/rest.do?method=api.com.ticket.quickorder.inputTicketQuickOrder&version=1.0.0&lvversion=7.6.1&IS_DEBUG=1&productId=622407&goodsIds=2777050&lvkey=37cc1b191999a8f49c82255b33ac9e80"
URL="http://m.lvmama.com/api/router/rest.do?method=api.com.ticket.quickorder.inputTicketQuickOrder&version=1.0.0&lvversion=7.6.1&IS_DEBUG=1&productId=622407&goodsIds=2777050&visitDate=2016-08-06&lvkey=131b060073f1578dce6ac8a03e8520a"
NAME=`echo $URL | cut -d = -f 2 | awk -F "&" '{print $1}'`
CYCLE=$1
SLEEPTIME=$2
#name file
SFILE=src_$NAME
LFILE=log_$NAME
TFILE=tmp_$NAME
RFILE=end_$NAME

#获取到接口的完整数据日志

function getLog(){
now=`date +%Y-%m-%d_%H:%M`
curl --limit-rate 500k "$URL" > $SFILE
echo $now >> $LFILE
sed 's/,/\n/g' $SFILE |grep debugMsg| awk -F '\"' '{ print $4 }' | sed 's/ms/ms\n/g' >> $LFILE
}

for i in `seq ${CYCLE}`
do
getLog
if [ $i != $CYCLE ];then
sleep ${SLEEPTIME}
fi
done
#根据输出次数和行数的关系，计算最终结果行数（计算次数）
lines=`wc -l $LFILE | awk '{print $1}' `
Flines=`expr $lines / $CYCLE`
Rlines=`expr $Flines - 1`

#根据行数，计算avg min max的函数

cp $LFILE $RFILE
for i in `seq 2 $Rlines`
do
    lineinfo=`sed -n ${i}p $LFILE | grep -o '\[.*\]'`
    passinfo=`sed -n ${i}p $LFILE | awk -F ":" '{print $2}'`
#获取每次测试每个步骤的costtime
    #tmpinfo=`echo $lineinfo | cut -d '[' -f2|cut -d ']' -f1`
    tmpinfo=`echo $lineinfo | sed "s/\[//g;s/\]//g" `
    cat $LFILE | grep "${tmpinfo}" | awk -F "costTime:" '{print $2}'|awk '{ print int($0) }'  > $TFILE
#计算
    passavgTime=`cat $TFILE | awk '{sum+=$1}END{print sum/NR}'`
    passMaxTime=`cat $TFILE | sort | tail -n 1`
    passminTime=`cat $TFILE | sort | head -n 1`
    passrangeTime="TimeRange: ${passminTime} ~ ${passMaxTime}"
    echo "${lineinfo} avgCostTime: ${passavgTime}ms ${passrangeTime}ms " >> $RFILE
done

#rm -f $SFILE $LFILE $TFILE

#发邮件方法
#echo "" | mutt -s "" -t someone

cat $RFILE | mutt -s "${NAME}_LOG" zhangqiang@lvmama.com

exit 0
