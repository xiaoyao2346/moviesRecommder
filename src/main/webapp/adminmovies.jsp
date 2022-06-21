<%--
  Created by IntelliJ IDEA.
  User: 22485
  Date: 2022/4/11
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影管理</title>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.14/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.14/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.14/demo/demo.css">
    <script type="text/javascript" src="jquery-easyui-1.9.14/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.9.14/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.9.14/locale/easyui-lang-zh_CN.js"></script>
</head>
<body background="img/background.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%;
background-attachment: fixed;">

    <h1 style="text-align:center">登陆成功</h1>
    <div class="container" >
        <div class="search" style="float: left;width: 60%;align-content: center" >
            <div style="float: right">
                <input id="ss" >

                <div id="box" style="width:100px;" >
                    <div data-options="name:'type' ">按类型搜索</div>
                    <div data-options="name:'name'" >按名称搜索</div>

                </div>
            </div>

        </div>
        <div class="user" style="float: right">
            <h2 style="text-align:right">管理员：<%=session.getAttribute("adminname")%></h2>
        </div>
    </div>

    <table id="dg" title="电影列表" class="easyui-datagrid" style="width:100%;height:100%" toolbar="#toolbar"
           rownumbers="false" fitColumns="true" singleSelect="true" >
        <thead>
        <tr>
            <th field="id" width="50">电影编号</th>
            <th field="name" width="50">电影名称</th>
            <th field="year" width="50">出版时间</th>
            <th field="type" width="50">类型</th>
        </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="newmovie()">增加电影</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="remove()">移除电影</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">修改电影信息</a>
    </div>
    <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px" closed="true" buttons="#dlg-buttons">
        <div class="ftitle">新增电影</div>
        <div>
            <form id="frm">
                <div style="margin: 5px auto">电影ID：<input  id="id" name="id" required="true"></div>
                <div style="margin: 5px auto">电影名称：<input  id="name" name="name" required="true"></div>
                <div style="margin: 5px auto">出版时间：<input  id="year" name="year" required="true"></div>
                <div style="margin: 5px auto">电影类型：<input  id="type" name="type" required="true"></div>
            </form>
        </div>
    </div>
    <div id="dlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="savemovie()">添加</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>
    </div>
    <div id="edlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px" closed="true" buttons="#edlg-buttons">
        <div class="ftitle">修改电影信息</div>
        <div>
            <form id="efrm">
                <div style="margin: 5px auto">电影名称：<input  id="ename" name="name" required="true"></div>
                <div style="margin: 5px auto">出版时间：<input  id="eyear" name="year" required="true"></div>
                <div style="margin: 5px auto">电影类型：<input  id="etype" name="type" required="true"></div>
            </form>
        </div>
    </div>
    <div id="edlg-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="editinfo()">修改</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#edlg').dialog('close')">取消</a>
    </div>
</body>
    <script>
        $('#dg').datagrid({
            url:"moviesServlet"
        });
        function newmovie(){
            $('#dlg').dialog('open').dialog('setTitle', '新增电影');
            $('#frm').form('clear');
        }
        function savemovie(){
            var id = document.forms["frm"]["id"].value;
            var name = document.forms["frm"]["name"].value;
            var year = document.forms["frm"]["year"].value;
            var type = document.forms["frm"]["type"].value;
            if(id==null||id==""){
                $.messager.alert({
                    title:'error',
                    msg:"电影ID未填"
                });
            }
            else if(name==null||name==""){
                $.messager.alert({
                    title:'error',
                    msg:"电影名称未填"
                });
            }
           else if(year==null||year==""){
                $.messager.alert({
                    title:'error',
                    msg:"电影发行时间未填"
                });
            }
           else if(type==null||type==""){
                $.messager.alert({
                    title:'error',
                    msg:"电影类型未填"
                });
            }
           else{
               $.ajax({
                   url:"newmovieServlet?id="+id+"&name="+name+"&year="+year+"&type="+type,
                   type:'post',
                   success:function(data){
                       var message = eval("("+data+")");
                       if(message.message=="success"){
                           $.messager.alert({
                               title:"提示",
                               msg:"添加成功"
                           });
                           $('#dlg').dialog('close');
                           $('#dg').datagrid('reload');
                       }
                       else{
                           $.messager.alert({
                               title:'error',
                               msg:"添加失败"
                           })
                       }
                   }
               })
            }
        }
        function remove(){
            var row = $('#dg').datagrid('getSelected');
            if(!row){
                $.messager.alert({
                    title:"error",
                    msg:"未选中要移除的电影"
                });
            }else{
                $.messager.confirm('Confirm','确定要移除该电影?',function(r){
                    if (r){
                        $.post('removeServlet',{id:row.id},function(result){
                            if (result.message=="success"){
                                $.messager.alert({
                                    title:"success",
                                    msg:"移除成功"
                                });
                                $('#dg').datagrid('reload');
                            } else {
                                $.messager.alert({    // show error message
                                    title: 'Error',
                                    msg: "移除失败"
                                });
                            }
                        },'json');
                    }
                });
                //$("#dg").datagrid('clearSelections');
            }
        }
        function edit(){
            var row = $('#dg').datagrid('getSelected');
            if(!row){
                $.messager.alert({
                    title:"error",
                    msg:"未选中要修改的电影"
                });
            }else{
                $('#edlg').dialog('open').dialog('setTitle', '修改电影信息');
                $('#efrm').form('clear');
            }
        }
        function editinfo(){
            var row = $('#dg').datagrid('getSelected');
            var name = document.forms["efrm"]["name"].value;
            var year = document.forms["efrm"]["year"].value;
            var type = document.forms["efrm"]["type"].value;
            if(row){
                $.messager.confirm('Confirm','确定要修改该电影?',function(r){
                    if (r){
                        $.post('editmovieServlet',{id:row.id,name:name,year:year,type:type},function(result){
                            if (result.message=="success"){
                                $.messager.alert({
                                    title:"success",
                                    msg:"修改成功"
                                });
                                $('#dg').datagrid('reload');
                            } else {
                                $.messager.alert({    // show error message
                                    title: 'Error',
                                    msg: "修改失败"
                                });
                            }
                        },'json');
                    }
                });
            }
        }

        $("#ss").searchbox({
            width:300,
            height:30,
            //输入框的提示信息
            prompt:'请输入关键字',
            menu:"#box",
            //值
            // value:'Hello',
            searcher:function (value,name) {
                //alert("value:"+value+", name:"+name);
                $('#dg').datagrid({
                    url:"searchServlet?option="+name+"&value="+value
                });
            },
            //是否禁用搜索框
            // disabled:true,
        });

        console.log($('#ss').searchbox('options'));
        console.log($('#ss').searchbox('menu'));
        console.log($('#ss').searchbox('textbox'));
        $(document).click(function () {
            //获得输入框的值
            // alert($('#ss').searchbox('getValue'));
            // $('#ss').searchbox('setValue','new value');
            // alert($('#ss').searchbox('getName')) ;
            // $('#ss').searchbox('selectName','sports');
            // $('#ss').searchbox('destroy');
            // $('#ss').searchbox('resize',300);
            // $('#ss').searchbox('disable');
            // $('#ss').searchbox('enable');
            // $('#ss').searchbox('clear');
            // $('#ss').searchbox('reset');
        });
    </script>
</html>
