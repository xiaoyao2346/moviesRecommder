<%--
  Created by IntelliJ IDEA.
  User: 22485
  Date: 2022/5/10
  Time: 17:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>评分</title>
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="coolLogin/common/css/mui.min.css"/>
    <script src="coolLogin/common/js/mui.min.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.14/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.14/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.9.14/demo/demo.css">
    <script type="text/javascript" src="jquery-easyui-1.9.14/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.9.14/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.9.14/locale/easyui-lang-zh_CN.js"></script>
    <link rel="stylesheet" type="text/css" href="coolLogin/models/login/css/login.css"/>
</head>
<body>
    <div id="add" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px" closed="false" buttons="#add-buttons">
        <%--        <div class="ftitle">用户评分</div>--%>
        <div>
            <form id="addfrm" name="addfrm">
                <div style="margin: 5px auto">给当前电影打分：<input type="number" id="addmark" name="addmark" required="required"></div>
            </form>
        </div>
    </div>
    <div id="add-buttons">
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" onclick="confirmadd()">评分</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#add').dialog('close')">取消</a>
    </div>
<script>
    function confirmadd(){
        var addmark = document.forms["addfrm"]["addmark"].value;
        if(addmark==null||addmark==""){
            $.messager.alert({
                title:"error",
                msg:"未输入评分"
            });
        }else if(addmark<=0||addmark>5){
            $.messager.alert({
                title:"error",
                msg:"评分在(0,5]之间"
            });
        }else{
            $.post("markServlet?mark="+addmark,function(data){
                var messa = eval("("+data+")");
                if(messa.message!=null){
                    alert(messa.message);
                    $.messager.alert({
                        title:"提示",
                        msg:messa.message
                    });
                    $.post("recommderServlet",{},function(data){})
                    location.href="main.jsp"
                    //$('#add').dialog('close');
                    //$("#dg").datagrid('clearSelections');
                }else{
                    $.messager.alert({
                        title:"提示",
                        msg:"传递消息为空"
                    });
                }
            });

        }
    }
</script>
</body>
</html>
