<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
    <title>微电影</title>
    <link rel="shortcut icon" href="../static/base/images/logo.png">
    <link rel="stylesheet" href="../static/base/css/bootstrap.min.css">
    <link rel="stylesheet" href="../static/base/css/bootstrap-movie.css">
    <link rel="stylesheet" href="../static/base/css/animate.css">
    <link rel="stylesheet" type="text/css" href="coolLogin/common/css/mui.min.css"/>
    <script src="coolLogin/common/js/mui.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="jquery-easyui-1.9.14/jquery.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.9.14/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="jquery-easyui-1.9.14/locale/easyui-lang-zh_CN.js"></script>
    <style>
        .navbar-brand>img {
            display: inline;
        }
        .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9{
            padding-right: 3px;
            padding-left: 3px;
        }
        .media{
            padding:3px;
            border:1px solid #ccc
        }
    </style>
</head>

<body>
<!--导航-->
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <!--小屏幕导航按钮和logo-->
        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="index.html" class="navbar-brand" style="width:250px;">
                <img src="../static/base/images/logo.png" style="height:30px;">&nbsp;微电影
            </a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
            <form class="navbar-form navbar-left" role="search" style="margin-top:18px;">
                <div class="form-group input-group">
                    <input type="text" class="form-control" placeholder="请输入电影名！">
                    <span class="input-group-btn">
                        <a class="btn btn-default" href="search.jsp"><span class="glyphicon glyphicon-search"></span>&nbsp;搜索</a>
                    </span>
                </div>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="curlink" href="main.jsp"><span class="glyphicon glyphicon-film"></span>&nbsp;电影</a>
                </li>
                <li>
                    <a class="curlink" href="userlogin.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a>
                </li>
                <li>
                    <a class="curlink" href="logout.html"><span class="glyphicon glyphicon-log-out"></span>&nbsp;退出</a>
                </li>
                <li>
                    <a class="curlink" href="user.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;用户</a>
                </li>
            </ul>
        </div>
        <!--导航-->

    </div>
</nav>
<!--导航-->
<!--内容-->
<div class="container" style="margin-top:76px">
    <div class="col-md-3">
        <div class="list-group">
            <a href="user.jsp" class="list-group-item active">
                <span class="glyphicon glyphicon-user"></span>&nbsp;用户中心
            </a>
<%--            <a href="2-movie/pwd.html" class="list-group-item">--%>
<%--                <span class="glyphicon glyphicon-lock"></span>&nbsp;修改密码--%>
<%--            </a>--%>
            <a href="comments.html" class="list-group-item">
                <span class="glyphicon glyphicon-comment"></span>&nbsp;评论记录
            </a>
            <a href="loginlog.html" class="list-group-item">
                <span class="glyphicon glyphicon-calendar"></span>&nbsp;登录日志
            </a>
            <a href="moviecol.html" class="list-group-item">
                <span class="glyphicon glyphicon-heart"></span>&nbsp;收藏电影
            </a>
        </div>
    </div>
    <div class="col-md-9">
        <div class="panel panel-warning">
            <div class="panel-heading">
                <h3 class="panel-title"><span class="glyphicon glyphicon-map-marker"></span>&nbsp;用户中心</h3>
            </div>
            <div class="panel-body">

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

                <form role="form">
                    <fieldset>
                        <div class="form-group">
                            <label for="input_face"><span class="glyphicon glyphicon-picture"></span>&nbsp;头像</label>
                            <img src="holder.js/100x100" class="img-responsive img-rounded">
                            <a class="btn btn-primary" style="margin-top:6px;"><span class="glyphicon glyphicon-open"></span>&nbsp;上传头像</a>
                            <input id="input_face" class="form-control" name="face" type="hidden" autofocus>
                        </div>
                        <div class="col-md-12" id="error_face"></div>
                        <div class="form-group">
                            <label for="input_info"><span class="glyphicon glyphicon-edit"></span>&nbsp;简介</label>
                            <textarea class="form-control" rows="10" id="input_info">十年窗下无人问，一举成名天下知</textarea>
                        </div>
                        <div class="col-md-12" id="error_info"></div>
                        <a href="user.html" class="btn btn-success"><span class="glyphicon glyphicon-saved"></span>&nbsp;保存修改</a>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<!--内容-->
<!--底部-->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p>
                    ©&nbsp;2017&nbsp;flaskmovie.imooc.com&nbsp;京ICP备 13046642号-2
                </p>
            </div>
        </div>
    </div>
</footer>
<!--底部-->
<script src="../static/base/js/jquery.min.js"></script>
<script src="../static/base/js/bootstrap.min.js"></script>
<script src="../static/base/js/jquery.singlePageNav.min.js"></script>
<script src="../static/base/js/wow.min.js"></script>
<script src="../static/lazyload/jquery.lazyload.min.js"></script>
<script src="//cdn.bootcss.com/holder/2.9.4/holder.min.js"></script>
<script>
    $(function() {
        new WOW().init();
    })

</script>
<script>
    $(document).ready(function() {
        $("img.lazy").lazyload({
            effect: "fadeIn"
        });
    });

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
                    }else {
                        alert("修改失败");
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
                    }else {
                        mui.toast("修改失败");
                        alert("修改失败");
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
                    }else {
                        mui.toast("修改失败");
                        alert("修改失败");
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
                    }else {
                        alert("修改失败");
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
                    }else {
                        alert("修改失败");
                    }
                }
            });
        }
    });


</script>
</body>
</html>
