#!/bin/bash

date=`date +%F`

subject='测试邮件'
mailto='305820049@qq.com,qincui@lvmama.com'
chaosong='zhangqiang@lvmama.com,tianqingyang@lvmama.com'
text='<html><head></head><body><h1>听云APP接口半月数据</h1><p>由于邮件无法完整展示HTML样式，请下载附件打开 或 点下面链接公司内网打开</p><br ><a href="http://10.113.1.35:8000/tyreport/" target=_blank>点我点我</a><br><hr id="FMSigSeperator" style="width: 210px; height: 1px;" color="#b5c4df" size="1" align="left"> <div><span id="_FoxFROMNAME"><div style="MARGIN: 10px; FONT-FAMILY: verdana; FONT-SIZE: 10pt"><div>Send By Test Team</div></div></span></div></body></html>'

echo $text | mutt $mailto -c $chaosong -s $subject  -e 'set content_type="text/html"'  -a files/TopNew

exit 0
