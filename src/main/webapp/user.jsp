<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
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
    <style type="text/css">
        div{
            align-content: center;
            margin: 50px;
        }
    </style>
</head>
<body background="img/background.jpg" style=" background-repeat:no-repeat ;background-size:100% 100%;
background-attachment: fixed;">
    <form id="frm" name="frm" style="" >
        <div>
            用户名：<input type="text" name="username" placeholder="<%=session.getAttribute("username") %>" style="width: 40%" >
            <button type="button"  id="changename" style="background-color: #0c7cd5;color: white">修改</button>
        </div>
        <div>
            电&nbsp;&nbsp;&nbsp;话：<input type="text" name="phone" placeholder= "<%=session.getAttribute("phone") %>" style="width: 40%" >
            <button type="button"  id="changephone" style="background-color: #0c7cd5;color: white">修改</button>
        </div>
        <div>
            邮&nbsp;&nbsp;&nbsp;箱：<input type="text" name="email" placeholder="<%=session.getAttribute("email") %>" style="width: 40%" >
            <button type="button"  id="changeemail" style="background-color: #0c7cd5;color: white">修改</button>
        </div>
        <div>
            地&nbsp;&nbsp;&nbsp;址：<input type="text" name="address" placeholder="<%=session.getAttribute("address") %>" style="width: 40%" >
            <button type="button"  id="changeaddress" style="background-color: #0c7cd5;color: white">修改</button>
        </div>
        <div>
            密&nbsp;&nbsp;&nbsp;码：<input type="text" name="password" style="width: 40%">
            <button type="button"  id="changepassword" style="background-color: #0c7cd5;color: white">修改</button>
        </div>
    </form>
</body>
    <script>

        $('#changename').click(function(){
            var username = document.forms["frm"]["username"].value;
            if(username==null||username==""){
                mui.toast("请输入要修改的用户名");
            }else{
                $.ajax({
                    url:"changeServlet?name="+username,
                    type:"post",
                    success:function(data){
                        //alert(data);
                        var message = eval("(" +data+ ")").message;
                        //alert(message);
                        if(message=="success"){
                            console.info("修改成功");
                            alert("修改成功");
                        }else if(message=="fail"){
                            mui.toast("修改失败");
                        }
                    }
                });
            }
        });
        $('#changephone').click(function(){
            var phone = document.forms["frm"]["phone"].value;
            if(phone==null||phone==""){
                mui.toast("请输入要修改的电话号");
            }else{
                $.ajax({
                    url:"changeServlet?phone="+phone,
                    type:"post",
                    success:function(data){
                        //alert(data);
                        var message = eval("(" +data+ ")").message;
                        //alert(message);
                        if(message=="success"){
                            console.info("修改成功");
                            alert("修改成功");
                        }else if(message=="fail"){
                            mui.toast("修改失败");
                        }
                    }
                });
            }
        });
        $('#changeemail').click(function(){
            var email = document.forms["frm"]["email"].value;
            if(email==null||email==""){
                mui.toast("请输入要修改的邮箱");
            }else{
                $.ajax({
                    url:"changeServlet?email="+email,
                    type:"post",
                    success:function(data){
                        //alert(data);
                        var message = eval("(" +data+ ")").message;
                        //alert(message);
                        if(message=="success"){
                            console.info("修改成功");
                            alert("修改成功");
                        }else if(message=="fail"){
                            mui.toast("修改失败");
                        }
                    }
                });
            }
        });
        $('#changeaddress').click(function(){
            var address = document.forms["frm"]["address"].value;
            if(address==null||address==""){
                mui.toast("请输入要修改的地址");
            }else{
                $.ajax({
                    url:"changeServlet?address="+address,
                    type:"post",
                    success:function(data){
                        //alert(data);
                        var message = eval("(" +data+ ")").message;
                        //alert(message);
                        if(message=="success"){
                            console.info("修改成功");
                            alert("修改成功");
                        }else if(message=="fail"){
                            mui.toast("修改失败");
                        }
                    }
                });
            }
        });
        $('#changepassword').click(function(){
            var password = document.forms["frm"]["password"].value;
            if(password==null||password==""){
                mui.toast("请输入要修改的密码");
            }else{
                $.ajax({
                    url:"changeServlet?password="+password,
                    type:"post",
                    success:function(data){
                        //alert(data);
                        var message = eval("(" +data+ ")").message;
                        //alert(message);
                        if(message=="success"){
                            console.info("修改成功");
                            alert("修改成功");
                        }else if(message=="fail"){
                            mui.toast("修改失败");
                        }
                    }
                });
            }
        });
    </script>
</html>
