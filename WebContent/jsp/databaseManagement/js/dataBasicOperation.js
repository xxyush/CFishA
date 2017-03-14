var _fields = {};
var _tbname = "";
var _startPage = 1;
var _perPageCount = 15;
var _totalPage = 0;
var _oriData;

function updateGrid(){
  dojo.byId("msg").innerHTML = "";
  dojo.xhrGet({
    url:"/CFA/getDBData",
    content : {
      _method : "total",
      _tbName : _tbName
    },
    load:function(response){
      var count = parseInt(response);
      _totalPage = parseInt(count/_perPageCount) + (count % _perPageCount ? 1 : 0);
      dojo.byId("totalPageCount").innerHTML = _totalPage;
    },
    error:function(error){
      alert(error);
    },
    sync : true,
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
    encoding: 'UTF-8'
  });
  if (_startPage > _totalPage) _startPage = _totalPage;
  if (_startPage <= 0) _startPage = 1;
  dojo.byId("pageIndex").value = _startPage;
  var content = dojo.clone(_fields);
  for (var key in content)
    content[key] = 1;
  content['_startIndex'] = (_startPage - 1)*_perPageCount;
  content['_count'] = _perPageCount;
  content['_tbName'] = _tbName;  
  
  dojo.xhrGet({
    url:"/CFA/getDBData",
    load:function(response){
      _oriData = eval('(' + response + ')');
      var newStore = new dojo.data.ItemFileWriteStore({        
        data : _oriData
      });
      _oriData = dojo.clone(_oriData);
      dijit.byId("grid").setStore(newStore);
    },
    error: function(error){
      dojo.byId("msg").innerHTML = "<label style='color:red'>"+error+"</label>";
    },
    content: content,
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
    encoding: 'UTF-8'
  });
}

function createEditDialog(title, buttomTitle, clickFunc){
  var ul = document.createElement("ul");
  for (field in _fields){
    var li = document.createElement('li');
    var label = document.createElement('label');
    label.innerHTML = field + ' (' + _fields[field] + ')';
    
    var content = dijit.byId(field);
    if (content) content.destroyRecursive();
//    if (_fields[field] == "int" || _fields[field] == "decimal") content = new dijit.form.NumberTextBox({id : field, width:"400px"});
    if (_fields[field] == "date") content = new dijit.form.DateTextBox({id : field, value:"0000-00-00"});
    else content = new dijit.form.TextBox({id : field, width:"400px"});
      
    li.appendChild(label);
    li.appendChild(content.domNode);
    ul.appendChild(li);
  }
  
  var li = document.createElement('li');
  var submitButton = document.createElement("input");
  submitButton.type = "button";
  submitButton.value = buttomTitle;
  submitButton.onclick = clickFunc;
  li.appendChild(submitButton);
  ul.appendChild(li);
  
  var editContent = document.createElement('div');
  editContent.appendChild(ul);
  
  var dialog = new dijit.Dialog({
    class : "editBox",
    title : title,
    content : editContent
  });
  return dialog;
}

function initGrid(tbName){
  _tbName = tbName;
  _startPage = 1;
  dojo.xhrGet({
    url:"/CFA/getDBField",
    encoding: 'UTF-8',
    headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
    load:function(response){
      _fields = eval('(' + response + ')');
      var layout = [];
      var colWidth = 900/((Object.keys(_fields)).length+2);
      for (field in _fields){
        layout.push({
          'name' : field,
          'field': field,
          'width': colWidth + 'px',
          'editable' : true
        });
      }
      
      layout.push({
        field : "编辑",
        type : dojox.grid.cells._Widget,
        editable : false,
        formatter : function(obj,rowIndex){
          return new dijit.form.Button({
            label:"编辑此项",
            onClick : function(){
              var dialog = createEditDialog('编辑行', '确认修改', function(){
                var content = {
                  _tbName : _tbName,
                  _method : "update"
                };
                
                var rowData = dijit.byId("grid").getItem(rowIndex);
                for (var field in _fields){
                  var value = dojo.byId(field).value;
                  if (value) content[field] = value;
                  content["__" + field] = rowData[field];
                }
                
                console.log(content);
                
                dojo.xhrPost({
                  url:"/CFA/getDBData",
                  load:function(response){
                    if (response == 'ok')
                      alert("修改数据成功!");
                    else alert(response);
                    updateGrid();
                  },
                  error: function(error){
                    alert(error);
                  },
                  encoding: 'UTF-8',
                  headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
                  content: content
                });
                dialog.hide();
              });
              dialog.show();
              var rowData = dijit.byId("grid").getItem(rowIndex);
              for (var field in _fields){
                if (_fields[field] == "date")
                  dijit.byId(field).set("value", new dojo.date.stamp.fromISOString(rowData[field]));
                else dijit.byId(field).set("value", rowData[field]);
              }
            }
          });
        }
      });
      
      layout.push({
        field : "删除",
        type : dojox.grid.cells._Widget,
        editable : false,
        formatter : function(obj,rowIndex){
          return new dijit.form.Button({
            label:"删除此项",
            onClick : function(){
              if (!confirm("确认删除此记录?")) return;
              var content = {};
              var rowData = dijit.byId("grid").getItem(rowIndex);
              for (var field in _fields)
                content[field] = rowData[field];
              content['_tbName'] = _tbName;
              content['_method'] = 'delete';
              dojo.xhrPost({
                url:"/CFA/getDBData",
                load:function(response){
                  updateGrid();
                  dojo.byId("msg").innerHTML = "<label style='color:green'>成功删除记录！</label>";
                },
                error: function(error){
                  dojo.byId("msg").innerHTML = "<label style='color:red'>"+error+"</label>";
                },
                headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
                encoding: 'UTF-8',
                content: content
              });
            }
          });
        } 
      });
            
      var grid = dijit.byId("grid");
      grid.setStructure(layout);
      updateGrid();
    },
    error:function(error){
      dojo.byId("msg").innerHTML = "<label style='color:red'>"+error+"</label>";
    },
    content:{
      _tbName: _tbName
    }
	});
}

function addNewItem(){
  var dialog = createEditDialog("添加新项", "确认添加", function(){
    var content = {
      _tbName : _tbName,
      _method : "insert"
    };
    
    for (var field in _fields){
      var value = dojo.byId(field).value;
      if (value) content[field] = dojo.byId(field).value;
    }
    dojo.xhrPost({
      url:"/CFA/getDBData",
      load:function(response){
        if (response == 'ok'){
          alert("插入数据成功");
          dialog.hide();
        }
        else alert(response);
        endPage();
      },
      error: function(error){
        alert(error);
      },
      headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
      encoding: 'UTF-8',
      content: content
    });
  });
  dialog.show();
}

function firstPage(){
  _startPage = 1;
  updateGrid();
}

function endPage(){
  _startPage = 100000000;
  updateGrid();
}

function nextPage(){
  _startPage += 1;
  updateGrid();
}

function lastPage(){
  _startPage -= 1;
  updateGrid();
}

function gotoPage(pageIndex){
  if (event.keyCode == '13'){
    _startPage = parseInt(pageIndex);
    updateGrid();
  }
}



function editAll(){
  if (!confirm("确认编辑所有记录?")) return;
  var newData = dijit.byId("grid").store._arrayOfAllItems;
  var oriData = _oriData.items;
  var isSucc = true;
  console.log(oriData);
  console.log(newData);

  for (var i = 0; i < oriData.length; ++i){
    var flag = true;
    for (var key in _fields)
      if (newData[i][key] != oriData[i][key])
        flag = false;
    if (flag) continue;

    var content = {
      _tbName : _tbName,
      _method : "update"
    };

    for (var field in _fields){
      var value = newData[i][field][0] + "";
      if (value != "null")
        content[field] = value;
      content["__" + field] = oriData[i][field];
    }
    
    console.log(content);
    
    dojo.xhrPost({
      url:"/CFA/getDBData",
      load:function(response){
        console.log(response);
        if (response != 'ok'){
          dojo.byId("msg").innerHTML = "<label style='color:red'>" + response + "</label>";
          isSucc = false;
        }
      },
      error: function(error){
        dojo.byId("msg").innerHTML = "<label> style='color:red'" + error + "</label>";
        isSucc = false;
      },
      encoding: 'UTF-8',
      headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"},
      content: content,
      sync : true
    });
  }
  
  updateGrid();
  if (isSucc) dojo.byId("msg").innerHTML = "<label style='color:green'>修改成功</label>";
}



