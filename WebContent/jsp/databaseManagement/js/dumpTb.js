var content;

function dumpTB(){
	if (!confirm("确认转存此表？")) return;
	var keys = ['startDate', 'startTime', 'endDate', 'endTime'];
	for (var i = 0; i < keys.length; ++i){
		if (dijit.byId(keys[i]).isValid()) continue;
		alert("请检查输入数据格式是否正确");
		return;
	}
	dojo.xhrGet({
		url : '/CFA/tbDump',
		content : {
			tbName : dojo.byId("tbName").value,
			startDate : dojo.byId("startDate").value.replace(/-/g, '_'),
			startTime : dijit.byId("startTime").toString().replace(/[T:]/g, function(m,i){return i == 0 ? "" : "_";}),
			endDate : dojo.byId("endDate").value.replace(/-/g,'_'),
			endTime : dijit.byId("endTime").toString().replace(/[T:]/g, function(m,i){return i == 0 ? "" : "_";})
		},
	    load:function(response){
	    	if (response == "ok") alert("日志转存成功");
	    	else alert(response);
	    },
	    error: function(error){
	    	alert(error);
	    },
	    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
	    encoding: 'UTF-8'
	});
}