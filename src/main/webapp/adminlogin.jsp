<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>管理员登录</title>
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
  <style>
    *{margin:0;padding:0;list-style-type:none;}
    body {
      background-color: #fff;
      margin: 0px;
      /*overflow: hidden;*/
      font-family:arial;
      color:#fff;
    }

    #canvas{
      width:100%;
      height:100%;
      overflow: hidden;
      top:0;
      left:0;
      background-color: #1a1724;
    }
    .canvas-wrap{ width:100%; height:100%; position:absolute; left:0; top:0;


    }
    div.canvas-content{
      position:relative;
      z-index:2000;
      color:#fff;
      text-align:center;
      padding-top:30px;
    }
  </style>
</head>
<body>


<div class="canvas-wrap">
  <div id="canvas" class="gradient"></div>
</div>

<form class="mui-input-group" id="frm" name="frm" style="" >
  <div class="mui-text-center">
    管理员登陆
  </div>
  <div class="mui-text-center">
    使用账号和密码
  </div>
  <div class="mui-input-row">
    <label>账号：</label>
    <input type="text" name="name" id="name" class="mui-input-clear" placeholder="请输入账号">
  </div>
  <div class="mui-input-row">
    <label>密码：</label>
    <input type="password" name="password" id="password" class="mui-input-clear" placeholder="请输入密码">
  </div>
  <button type="button" class="mui-btn-block" id="loginBtn" >登录</button>
<%--  <div class="myfooter">--%>
<%--    <p><button type="button" id="logup" >注册</button></p>--%>
<%--    <p><button type="submit">忘记密码？</button></p>--%>
<%--  </div>--%>
</form>


</body>
<script>

  $('#loginBtn').click(function(){
    var name = document.forms["frm"]["name"].value;
    var password = document.forms["frm"]["password"].value;

    if(confirm()){
      $.ajax({
        url:"adminloginServlet?name="+name+"&password="+password,
        type:"post",
        success:function(data){
          //alert(data);
          var message = eval("(" +data+ ")").message;
          //alert(message);
          if(message=="success"){
            console.info("登录成功");
            location.href="adminmovies.jsp";
          }else if(message=="fail"){
            mui.toast("用户名或密码错误");
          }
        }
      });
    }
  });

  function confirm(){
    mui.init();
    var name = document.forms["frm"]["name"].value;
    var pwd = document.forms["frm"]["password"].value;
    if(name==""){
      mui.toast("账户名不能为空");
      return false;
    }
    if(pwd=="" ){
      mui.toast("请输入密码");
      return false;
    }
    return true;
  }


</script>
<script src="coolLogin/models/login/js/three.min.js"></script>
<script src="coolLogin/models/login/js/projector.js"></script>
<script src="coolLogin/models/login/js/canvas-renderer.js"></script>
<script src="coolLogin/models/login/js/3d-lines-animation.js"></script>
<script src="coolLogin/models/login/js/color.js"></script>
</html>
