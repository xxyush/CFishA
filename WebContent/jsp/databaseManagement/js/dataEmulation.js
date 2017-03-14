var idCount = 0;
var _fields = {};
var _pageId = parseInt(Math.random()*100000000);

function updatePregressBar(count){
  dijit.byId("progressBar").update({maximum:count});
  var progressInterval = setInterval(function(){
    console.log(_pageId);
    dojo.xhrGet({
      url : "/CFA/emulateData",
      content : {
        _pageId : _pageId,
        _method : "getState"
      },
      load : function(response){
        if (response >= 0){
          dijit.byId("progressBar").update({progress:response});
        }
        else {
          dijit.byId("progressBar").update({progress:count});
          clearInterval(progressInterval);
        }
      },
      headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
      encoding: 'UTF-8'
    });
  }, 1000);
}

function strFormat(src){    
  if (arguments.length == 0) return null;
  var args = Array.prototype.slice.call(arguments, 1);    
  return src.replace(/\{(\d+)\}/g, function(m, i){    
    return args[i];    
  });    
};  

function addParam(){
  var ul = document.getElementById("params");
  var li = document.createElement("li");
  li.id = "li" + idCount;
  li.innerHTML = strFormat("<select class='fieldName' id='key{0}' style='display:block;float:left;margin-right:10px;'></select>:&nbsp;&nbsp;<input type='text' id='value{0}' value='请输入此字段的取值' class='text' /><input type='button' value='删除此字段' onclick='delParam(\"li\" + {0})'/>", idCount);  
  ul.appendChild(li);
  updateSelect(dojo.byId("key" + idCount));
  idCount++;
}

function delParam(liid){
  var ul = document.getElementById("params");
  ul.removeChild(document.getElementById(liid));
}

function startEmulate(){
  var fields = {"tbName" : "表名","interval" : "数据生成周期","count" : "生成数据数量"};
  for (var field in fields){
    if (dojo.byId(field).value) continue;
    dojo.byId('msg').innerHTML = "<label>" + fields[field] + "不能为空</label>";
    return;
  }
  
  var content = {
    _tbName : dojo.byId("tbName").value,
    _interval : dojo.byId("interval").value,
    _count : dojo.byId("count").value
  };
  
  for (var i = 0; i < idCount; ++i){
    var key = dojo.byId("key" + i);
    var value = dojo.byId("value" + i);
    if (key != null && value != null)
      if (key.value != null && value.value != null)
        content[key.value] = value.value;
  }
  
  content["_pageId"] = _pageId;
  
  var flag1 = false;
  for (var i = 1; i <= 3; ++i){
    try{
      var params = {
        fieldName : dojo.byId("fieldName"+i).value,
        lowerBound : dojo.byId("lowerBound"+i).value,
        upperBound : dojo.byId("upperBound"+i).value,
        waveType : dojo.byId("waveType"+i).value,
        period : dojo.byId("period"+i).value
      };
      var flag = true;
      for (var key in params)
        if (!params[key]) flag = false;
    
      if (!flag) continue;
      flag1 = true;
      for (var key in params)
        content['_' + key + i] = params[key];
    }
    catch(e){
      console.log(i);
      console.log(e);
    }
  }
  
  if (!flag1){
    dojo.byId("msg").innerHTML = "<label style='color:red'>请填写仿真字段参数</label>";
    return;
  }
  
  dojo.xhrPost({
    url:"/CFA/emulateData",
    content:content,
    load:function(response){
      console.log(response);
      if (response == "ok"){
        dojo.byId("msg").innerHTML = "<label style='color:green'>成功提交请求</label>";
      }
      else {
        dojo.byId("msg").innerHTML = "<label style='color:red'>"+response+"</label>";
      }
    },
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
    encoding: 'UTF-8',
    error:function(error){
      dojo.byId("msg").innerHTML = "<label style='color:red'>"+error+"</label>";
    }
  });
  
  updatePregressBar(content["_count"]);
}

function stopEmulate(){
  dojo.xhrPost({
    url : "/CFA/emulateData",
    content : {
      _count : 0,
      _pageId : _pageId
    },
    encoding: 'UTF-8',
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
    load:function(response){
      if (response == "ok"){
        dojo.byId("msg").innerHTML = "<label style='color:green'>停止仿真</label>";
      }
      else {
        dojo.byId("msg").innerHTML = "<label style='color:red'>"+response+"</label>";
      }
    },
    error:function(error){
      dojo.byId("msg").innerHTML = "<label style='color:red'>"+error+"</label>";
    }
  });
}

function updateSelect(select){
  select.innerHTML = "";
  for (var field in _fields){
    var option = document.createElement("option");
    option.innerHTML = field;
    option.value = field;
    select.appendChild(option);
  }
}

function getFields(tbName){
  dojo.xhrGet({
    url : "/CFA/getDBField",
    load : function(response){
      _fields = eval('(' + response + ')');
    },
    error : function(error){
      alert(error);
    },
    sync : true,
    content : {
      _tbName : tbName
    },
    encoding: 'UTF-8',
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"}
  });
}

function updateAllSelect(tbName){
  getFields(tbName);
  dojo.query("select.fieldName").forEach(function(node,index,nodelist){
    updateSelect(node);
  });
}

function startEmulateWithClear(){
  var content = {
      _pageId : _pageId,
      _method : "clearDB",
      _tbName : dojo.byId("tbName").value
  };
  for (var i = 0; i < idCount; ++i){
    var key = dojo.byId("key" + i);
    var value = dojo.byId("value" + i);
    if (key != null && value != null)
      if (key.value != null && value.value != null)
        content[key.value] = value.value;
  }
  
  dojo.xhrGet({
    url : "/CFA/emulateData",
    content : content,
    sync : true,
    encoding: 'UTF-8',
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"}
  });
  startEmulate();
}

dojo.ready(function(){
  updateAllSelect(dojo.byId("tbName").value);
});