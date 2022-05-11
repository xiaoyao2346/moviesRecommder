<%@ page import="com.example.moviesrecommder.javabean.MovieInfo" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.moviesrecommder.javabean.Movie" %><%--
  Created by IntelliJ IDEA.
  User: 22485
  Date: 2022/3/30
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>WelCome</title>
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

    <title>Welcome</title>
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
            <h2 style="text-align:right">用户：<a href="user.jsp"><%=session.getAttribute("username")%></a></h2>
        </div>
    </div>

    <table id="dg" title="电影推荐" class="easyui-datagrid" style="width:100%;height:100%" toolbar="#toolbar"
           rownumbers="true" fitColumns="true" singleSelect="true" >
        <thead>
        <tr>
            <th field="id" width="50">电影编号</th>
            <th align="center" data-options="field:'fdCreditInformation',formatter:imgCVC">海报</th>
            <th field="name" width="50">电影名称</th>
<%--            <th field="year" width="50">发行时间</th>--%>
            <th field="type" width="50">类型</th>
        </tr>
        </thead>
    </table>
    <div id="toolbar">
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="givemark()">评分</a>

    </div>
    <div id="add" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px" closed="true" buttons="#add-buttons">
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
</body>
    <script>
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

        $('#dg').datagrid({
            url:"recommderServlet"
        });

        function imgCVC(value, row, index) {
            var random = Math.floor(Math.random() * 1000);
            var img = "img/"+random%30+".jpg";
            return "<img src='"+img+"' style='width:300px; height: 200px;'>";

        }


        function givemark(){
            var row = $('#dg').datagrid('getSelected');
            if(!row){
                $.messager.alert({
                    title:"error",
                    msg:"未选中要评分的电影"
                });
            }else{
                $('#add').dialog('open').dialog('setTitle', '用户评分');
                $('#addfrm').form('clear');
            }
        }

        function confirmadd(){
            var addmark = document.forms["addfrm"]["addmark"].value;
            if(addmark==null){
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
                var row = $('#dg').datagrid('getSelected');
                $.post("markServlet?mark="+addmark,{movieid:row.id},function(data){
                    var messa = eval("("+data+")");
                    if(messa.message!=null){
                        $.messager.alert({
                            title:"提示",
                            msg:messa.message
                        });
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
        // $.ajax({
        //     url:"recommderServlet",
        //     type:"post",
        //     success:function(data){
        //
        //         //window.document.write(data);
        //         var arr = eval("("+data+")").movies;
        //         for(var i=0;i<arr.length;i++){
        //             window.document.write(arr[i].id);
        //         }
        //     }
        // })
    </script>
</html>
