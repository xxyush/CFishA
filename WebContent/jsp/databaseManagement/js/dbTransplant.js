function getBackups(){
	dojo.xhrGet({
		url : "/CFA/dbTransplant",
		load : function(response){
			var backuplist = eval('(' + response + ')');
			var backups = dojo.byId("backups");
			backups.innerHTML = "";
			for (var backup in backuplist){
				var option = document.createElement("option");
				option.value = option.text = backup;
				backups.add(option,null);
			}
		},
		
		headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
        encoding: 'UTF-8',
        content: {
        	method : "getBackups"
        },
        sync : true
	});
}

function dbExport(){
	if (!confirm("确认导出当前数据库？")) return;
	dojo.xhrGet({
		url : "/CFA/dbTransplant",
		load : function(response){
			if (response == "ok") {
				alert("成功导出数据库！");
				getBackups();
			}
			else {
				alert(response);
				getBackups();
			}
		},
		headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
        encoding: 'UTF-8',
        content: {
        	method : "export",
        	exportFileName : dojo.byId("exportFileName").value
        }
	});
}

function dbImport(){
	if (!confirm("确认导入此数据库？")) return;
	dojo.xhrGet({
		url : "/CFA/dbTransplant",
		load : function(response){
			if (response == "ok")
				alert("成功导入数据库！");
			else alert(response);
			getBackups();
		},
		headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
        encoding: 'UTF-8',
        content: {
        	method : "import",
        	importFileName : dojo.byId("backups").value
        }
	});
}