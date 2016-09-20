#!/usr/bin/env python
#coding: utf-8  
import smtplib
import string
import time
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
from email.header import Header
from email.utils import parseaddr, formataddr
#TimeFormat='%Y-%m-%d %X'
#ReportTime=time.strftime(TimeFormat, time.localtime())
mth = time.localtime()[1]
day = time.localtime()[2]

def _format_addr(s):
    name, addr = parseaddr(s)
    return formataddr((Header(name, 'utf-8').encode(), addr))

from_addr = 'zhangqiang@lvmama.com'
to_addr = 'zhangqiang@lvmama.com'
#password = ''
smtp_server = 'smtp.exmail.qq.com'
port = 25
msg = MIMEMultipart()
msg['From'] = _format_addr('Mr.Z <%s>' % from_addr)
msg['To'] = _format_addr('ALL <%s>' % to_addr)
msg['Subject']= Header('听云<%s>月<%s>日接口数据报告' % mth % day).encode()

msg.attach(MIMEText('<html><head></head><body><h1>听云APP接口半月数据</h1><p>为避免邮件无法展示HTML格式，请下载附件打开查看或点击下面链接直接公司内网打开</p><p>Send By Test Team</p></body></html>','html','utf-8'))
with open('TYreport.html', 'rb') as f:
    mine = MIMEBase('file','file',filename='TYreport.html')
    mine.add_header('Content-Disposition', 'attachment', filename='TYreport.html')
    mine.add_header('Content-ID', '<0>')
    mine.add_header('X-Attachment-Id', '0')
    mine.set_payload(f.read())
    encoders.encode_base64(mine)
    msg.attach(mine)

smtp = smtplib.SMTP(smtp_server, port)
#smtp.starttls()
#smtp.set_debuglevel(1)
smtp.login(from_addr, password)
smtp.sendmail(from_addr, [to_addr], msg.as_string())
smtp.quit()
