#!/bin/bash
chart_labels=`mysql -plvmama tingyun -e "select * from ty_rate" | tail -n +2 |sed "s/%//g" |awk '{print $2}'`
label_list=`echo $chart_labels|sed "s/ /\",\"/g;s/^/\"/g;s/$/\"/g"`
msDate=`mysql -plvmama tingyun -e "select * from ty_rate" | tail -n +2 |sed "s/%//g" |awk '{print $3}'`
oDate=`mysql -plvmama tingyun -e "select * from ty_rate" | tail -n +2 |sed "s/%//g" |awk '{print $4}'`
tDate=`mysql -plvmama tingyun -e "select * from ty_rate" | tail -n +2 |sed "s/%//g" |awk '{print $5}'`
ttDate=`mysql -plvmama tingyun -e "select * from ty_rate" | tail -n +2 |sed "s/%//g" |awk '{print $6}'`
fDate=`mysql -plvmama tingyun -e "select * from ty_rate" | tail -n +2 |sed "s/%//g" |awk '{print $7}'`
ffDate=`mysql -plvmama tingyun -e "select * from ty_rate" | tail -n +2 |sed "s/%//g" |awk '{print $8}'`
ms_list=`echo $msDate|sed "s/ /,/g"`
o_list=`echo $oDate|sed "s/ /,/g"`
t_list=`echo $tDate|sed "s/ /,/g"`
tt_list=`echo $ttDate|sed "s/ /,/g"`
f_list=`echo $fDate|sed "s/ /,/g"`
ff_list=`echo $ffDate|sed "s/ /,/g"`

(
cat << EOF
<script>
    var config = {
        type: 'line',
        data: {
            labels: [
EOF
) >> b
echo "$label_list," >>b
(
cat << EOF				
            ],
            datasets: [
		{
			label: "毫秒",
			borderColor : "rgba(102,204,255,0.5)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
EOF
) >> b			
echo "data:[$ms_list]," >>b
(
cat << EOF
			fill:false,
		},{
		label: "1~2秒",
			borderColor : "rgba(102,204,102,0.5)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
EOF
) >> b			
echo "data:[$o_list]," >>b
(
cat << EOF
			fill:false,
		},{
			label: "2~3秒",
			borderColor : "rgba(255,255,153,0.5)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
EOF
) >> b			
echo "data:[$t_list]," >>b
(
cat << EOF
			fill:false,
		},{
			label: "3~4秒",
			borderColor : "rgba(255,255,51,0.5)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
EOF
) >> b			
echo "data:[$tt_list]," >>b
(
cat << EOF
			fill:false,
		},{
			label: "4~5秒",
			borderColor : "rgba(255,204,102,0.5)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
EOF
) >> b			
echo "data:[$f_list]," >>b
(
cat << EOF
			fill:false,
		},{
			label: "5秒以上",
			borderColor : "rgba(255,102,51,0.5)",
			strokeColor : "rgba(220,220,220,1)",
			pointColor : "rgba(220,220,220,1)",
			pointStrokeColor : "#fff",
EOF
) >> b			
echo "data:[$ff_list]," >>b
(
cat << EOF
			fill:false,
		}
		]}
		};
    window.onload = function() {
        var ctx1 = document.getElementById("chart-area1").getContext("2d");
        window.myPie = new Chart(ctx1, config);
    };
</script>

EOF
) >> b




exit 0