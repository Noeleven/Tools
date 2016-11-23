mport os.path
import json
import re
import datetime

"""
1.读取HAR文件
2.分析HAR文件
3.打印出结果
"""
root_dir = /rd/''
my_file = []
for root, dirs, files in os.walk(root_dir):
	for file in files:
		my_file.append(os.path.join(root, file))


def checkTime(s):
	if s < 0:
		s = 0
	return s


def time_handle(s):
	strr = s.replace('Z', '000Z')
	str_to_date = datetime.datetime.strptime(strr, "%Y-%m-%dT%H:%M:%S.%fZ")
	return str_to_date

for x in my_file:
	with open(x, 'r', encoding='utf-8', errors='ignore') as f:
		harDirct = json.loads(f.read())
		# 提取网络时间
		target_flow = harDirct['log']['entries'][0]
		file_name = target_flow['request']['url']
		print("HOST %s" % file_name)
		DNS_Time = checkTime(target_flow['timings']['dns'])
		print("DNS解析耗时    %s 毫秒" % DNS_Time)
		TCP_Time = checkTime(target_flow['timings']['connect'])
		print("TCP链接耗时    %s 毫秒" % TCP_Time)
		SSL_Time = checkTime(target_flow['timings']['ssl'])
		print("SSL链接耗时    %s 毫秒" % SSL_Time)
		# 计算白屏时间，分析head内容，计算head里最后一个资源加载完成的时间
		page_start_str = harDirct['log']['pages'][0]['startedDateTime']
		page_start_time = time_handle(page_start_str)
		# 分析头部外链
		html = target_flow['response']['content']['text'].split('<body>')[0]
		head_list = html.splitlines()
		for o in head_list[:]:
			if 'src=' in o or 'href=' in o:
				head_list.remove(o)
				href_name = re.findall(r"href=\".*/(.+)\"", o)
				if href_name:
					head_list.append(href_name)
			else:
				head_list.remove(o)
		# 分析结束时间
		requestList = harDirct['log']['entries']
		end_time_list = []
		for m in requestList:
			src_name = m['request']['url']
			for n in head_list:
				if n[0] in src_name:
					start_time = m['startedDateTime']
					start_time = time_handle(start_time)
					run_time = round(m['time'] / 1000, 3)
					end_time = start_time + datetime.timedelta(seconds=run_time)
					end_time_list.append(end_time)
		white_page = max(end_time_list) - page_start_time

		print("白屏等待耗时    %s 时:分:秒.微秒" % white_page)
		DOM_Time = round(checkTime(harDirct['log']['pages'][0]['pageTimings']['onContentLoad']) / 1000, 2)
		print("DOM构建完成    %s 秒" % DOM_Time)
		Load_Time = round(checkTime(harDirct['log']['pages'][0]['pageTimings']['onLoad']) / 1000, 2)
		xr_Time = datetime.timedelta(seconds=Load_Time) - white_page
		print("渲染过程耗时    %s" % xr_Time)
		print("渲染全部结束    %s 秒" % Load_Time)
		end_time_all = []
		for x in harDirct['log']['entries']:
			start_a = time_handle(x['startedDateTime'])
			end_a = start_a + datetime.timedelta(seconds=(x['time'] / 1000))
			end_time_all.append(end_a)

		Finish_Time = max(end_time_all) - page_start_time
		print("整页加载完成    %s" % Finish_Time)

		# 选最晚的完成时间
		request_num = len(requestList)
		request_size = round(
			sum([(x['response']['bodySize'] + x['response']['headersSize']) for x in requestList]) / 1024, 1)

		css_dict = {}
		js_dict = {}
		img_dict = {}
		xhr_dict = {}
		for i in requestList:
			my_url = i['request']['url']
			file_type = i['response']['content']['mimeType']
			if file_type:
				pass
			else:
				if '.jpg' in my_url:
					file_type = 'image/'
				else:
					file_type = 'nonono'
			if 'css' in file_type:
				css_dict[my_url] = {}
				css_dict[my_url]['res_time'] = round(i['time'], 2)
				css_dict[my_url]['res_size'] = round((i['response']['headersSize'] + i['response']['bodySize']), 2)
			elif 'javascript' in file_type:
				js_dict[my_url] = {}
				js_dict[my_url]['res_time'] = round(i['time'], 2)
				js_dict[my_url]['res_size'] = round((i['response']['headersSize'] + i['response']['bodySize']), 2)
			elif "image/" in file_type:
				img_dict[my_url] = {}
				img_dict[my_url]['res_time'] = round(i['time'], 2)
				img_dict[my_url]['res_size'] = round((i['response']['headersSize'] + i['response']['bodySize']), 2)
			elif "/json" in file_type:
				xhr_dict[my_url] = {}
				xhr_dict[my_url]['res_time'] = round(i['time'], 2)
				xhr_dict[my_url]['res_size'] = round((i['response']['headersSize'] + i['response']['bodySize']), 2)
		css_time = round(sum([x['res_time'] for x in css_dict.values()]) / 1000, 1)
		css_size = round(sum([x['res_size'] for x in css_dict.values()]) / 1024, 1)
		js_time = round(sum([x['res_time'] for x in js_dict.values()]) / 1000, 1)
		js_size = round(sum([x['res_size'] for x in js_dict.values()]) / 1024, 1)
		img_time = round(sum([x['res_time'] for x in img_dict.values()]) / 1000, 1)
		img_size = round(sum([x['res_size'] for x in img_dict.values()]) / 1024, 1)
		xhr_time = round(sum([x['res_time'] for x in xhr_dict.values()]) / 1000, 1)
		xhr_size = round(sum([x['res_size'] for x in xhr_dict.values()]) / 1024, 1)

		print('请求数|总大小|css数量|css大小|css耗时|js数量|js大小|js耗时|img数量|img大小|img耗时|接口数量|接口大小|接口耗时|')
		print('%s, %sKB, %s, %sKB, %sS, %s, %sKB, %sS, %s, %sKB, %sS, %s, %sKB, %sS' % (
			request_num, request_size,
			len(css_dict), css_size, css_time,
			len(js_dict), js_size, js_time,
			len(img_dict), img_size, img_time,
			len(xhr_dict), xhr_size, xhr_time))

