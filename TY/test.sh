#!/bin/bash

date=`date +%F`

subject='听云接口数据报告'
mailto='zhangqiang@lvmama.com'
text='<html><head></head><body><h1>听云APP接口半月数据</h1><p>为避免邮件无法展示HTML格式，请下载附件打开查看或点击下面链接直接公司内网打开</p><p>Send By Test Team</p><br ><a href="http://10.113.1.35/" target=_blank></a></body></html>'

echo $text | mutt $mailto -s $subject  -e 'set content_type="text/html"'  -a "TYreport_${date}.html"

exit 0
