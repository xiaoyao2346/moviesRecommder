<%@ page import="java.util.HashMap" %>
<%@ page import="com.example.moviesrecommder.javabean.Movie" %><%--
  Created by IntelliJ IDEA.
  User: 22485
  Date: 2022/4/19
  Time: 13:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <title>电影</title>
  <link rel="shortcut icon" href="static/base/images/logo.png">
  <link rel="stylesheet" href="static/base/css/bootstrap.min.css">
  <link rel="stylesheet" href="static/base/css/bootstrap-movie.css">
  <link rel="stylesheet" href="static/base/css/animate.css">
  <!--播放页面-->
  <link rel="stylesheet" type="text/css" href="static/jwplayer/skins/stormtrooper.css">
  <script type="text/javascript" src="static/ueditor/ueditor.config.js"></script>
  <script type="text/javascript" src="static/ueditor/ueditor.all.js"></script>
  <script type="text/javascript" src="static/ueditor/lang/zh-cn/zh-cn.js"></script>

  <script>
    SyntaxHighlighter.all();
  </script>
  <!--播放页面-->
  <style>
    .navbar-brand>img {
      display: inline;
    }
    .media{
      padding:3px;
      border:1px solid #ccc
    }
    .col-lg-1, .col-lg-10, .col-lg-11, .col-lg-12, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-md-1, .col-md-10, .col-md-11, .col-md-12, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-sm-1, .col-sm-10, .col-sm-11, .col-sm-12, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-xs-1, .col-xs-10, .col-xs-11, .col-xs-12, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9{
      padding-right: 3px;
      padding-left: 3px;
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
        <img src="static/base/images/logo.png" style="height:30px;">&nbsp;看电影
      </a>
    </div>
    <!--小屏幕导航按钮和logo-->
    <!--导航-->
    <div class="navbar-collapse collapse">
      <form class="navbar-form navbar-left" role="search" style="margin-top:18px;">
        <div class="form-group input-group">
          <input type="text" class="form-control" placeholder="请输入电影名！">
          <span class="input-group-btn" onclick="search()">
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
          <a class="curlink" href="user.jsp"><span class="glyphicon glyphicon-user"></span>&nbsp;用户：<%=session.getAttribute("username")%></a>
        </li>
      </ul>
    </div>
    <!--导航-->

  </div>
</nav>
<!--导航-->
<!--内容-->
<div class="container" style="margin-top:76px">
  <div class="row">
    <div class="col-md-8">
      <div id="moviecontainer"></div>
    </div>
    <%
      //System.out.println("当前map"+map);
      String movieID = request.getParameter("movieID");
      String movieID2 = request.getParameter("movieID2");
      HashMap<Integer, Movie> map;
      Movie movie;
      if(movieID==null||movieID.equals("")) {
        map = (HashMap<Integer, Movie>) session.getAttribute("searchmoivesmap");
        movie = map.get(Integer.parseInt(movieID2));
      }
      else{
        map = (HashMap<Integer, Movie>) session.getAttribute("moviesmap");
        movie = map.get(Integer.parseInt(movieID));
      }
      HashMap<Integer,Integer> scoresmap = (HashMap<Integer, Integer>) session.getAttribute("scoresmap");
      HashMap<Integer,Integer> playtimes = (HashMap<Integer, Integer>) session.getAttribute("playtimes");
      //System.out.println("当前电影ID"+movieID);

      //System.out.println("当前电影"+movie);
      session.setAttribute("movie",movie);
    %>
    <div class="col-md-4" style="height:500px;">
      <div class="panel panel-info">
        <div class="panel-heading">
          <h3 class="panel-title"><span class="glyphicon glyphicon-facetime-video"></span>&nbsp;电影介绍</h3>
        </div>
        <div class="panel-body" style="height:459px;">
          <table class="table">
            <tr>
              <td style="width:30%;color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-film"></span>&nbsp;片名
              </td>
              <td><%=movie.getName()%></td>
            </tr>
            <tr>
              <td style="color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-tag"></span>&nbsp;标签
              </td>
              <td><%=movie.getType()%></td>
            </tr>
            <tr>
              <td style="color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-time"></span>&nbsp;片长
              </td>
              <td>05:04</td>
            </tr>
            <tr>
              <td style="color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-map-marker"></span>&nbsp;地区
              </td>
              <td>中国</td>
            </tr>
            <tr>
              <td style="color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-star"></span>&nbsp;评分
              </td>
              <td>
                <div>
                  <%
                    Integer score = scoresmap.get(movie.getId());
                    Integer playtime = playtimes.get(movie.getId());
                    if(score!=null){
                    for(int i=0;i<score;i++){
                  %>
                  <span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
                  <%}}else{%>
                  <span  style="color:#FFD119">暂无评分</span>
                  <%}%>
<%--                  <span class="glyphicon glyphicon-star" style="color:#FFD119"></span>--%>
<%--                  <span class="glyphicon glyphicon-star" style="color:#FFD119"></span>--%>
<%--                  <span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>--%>
<%--                  <span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>--%>
                </div>
              </td>
            </tr>
            <tr>
              <td style="color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-calendar"></span>&nbsp;上映时间
              </td>
              <td><%=movie.getYear()%></td>
            </tr>
            <tr>
              <td style="color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-play"></span>&nbsp;播放数量
              </td>
              <td>1000</td>
            </tr>
            <tr>
              <td style="color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-comment"></span>&nbsp;评分数量
              </td>
              <td><%=playtime==null?0:playtime%></td>
            </tr>
            <tr>
              <td style="color:#ccc;font-weight:bold;font-style:italic;">
                <span class="glyphicon glyphicon-picture"></span>&nbsp;影片介绍
              </td>
              <td>
                该片主要讲述了人类为了抵抗怪兽的进攻，研制出了高大的机器战士与来犯怪兽进行对抗的故事。
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>

    <div class="col-md-12" style="margin-top:6px;">
      <div class="panel panel-danger">
        <div class="panel-heading">
          <h3 class="panel-title"><span class="glyphicon glyphicon-comment"></span>&nbsp;电影评论</h3>

        </div>
        <div class="panel-body">

          <a class="btn btn-success" id="btn mark" onclick="givemark()"><span class="glyphicon glyphicon-edit"></span>&nbsp;给电影打个分吧！</a>

          <div class="alert alert-danger alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert">
              <span aria-hidden="true">×</span>
              <span class="sr-only">Close</span>
            </button>
            <strong>请先<a href="login.html" target="_blank" class="text-info">登录</a>，才可参与评论！</strong>
          </div>
          <ol class="breadcrumb" style="margin-top:6px;">
            <li>全部评论(5)</li>
          </ol>
          <form role="form" style="margin-bottom:6px;">
            <div class="form-group">
              <div>
                <label for="input_content">内容</label>
                <textarea id="input_content"></textarea>
              </div>
              <div class="col-xs-12" id="error_content"></div>
            </div>
            <a class="btn btn-success" id="btn-sub"><span class="glyphicon glyphicon-edit"></span>&nbsp;提交评论</a>
            &nbsp;
            <a class="btn btn-danger" id="btn-col"><span class="glyphicon glyphicon-heart"></span>&nbsp;收藏电影</a>
          </form>
          <ul class="commentList">
            <li class="item cl">
              <a href="user.html">
                <i class="avatar size-L radius">
                  <img alt="50x50" src="holder.js/50x50" class="img-circle" style="border:1px solid #abcdef;">
                </i>
              </a>
              <div class="comment-main">
                <header class="comment-header">
                  <div class="comment-meta">
                    <a class="comment-author" href="user.html">xiaoli</a>
                    评论于
                    <time title="2016-12-07 09:12:51" datetime="2016-12-07 09:12:51">2017-03-01 09:12:51</time>
                  </div>
                </header>
                <div class="comment-body">
                  <p>这电影真好看！</p>
                </div>
              </div>
            </li>
            <li class="item cl">
              <a href="user.html">
                <i class="avatar size-L radius">
                  <img alt="50x50" src="holder.js/50x50" class="img-circle" style="border:1px solid #abcdef;">
                </i>
              </a>
              <div class="comment-main">
                <header class="comment-header">
                  <div class="comment-meta">
                    <a class="comment-author" href="user.html">xiaoli</a>
                    评论于
                    <time title="2016-12-07 09:12:51" datetime="2016-12-07 09:12:51">2017-03-01 09:12:51</time>
                  </div>
                </header>
                <div class="comment-body">
                  <p>这电影真好看！</p>
                </div>
              </div>
            </li>
            <li class="item cl">
              <a href="user.html">
                <i class="avatar size-L radius">
                  <img alt="50x50" src="holder.js/50x50" class="img-circle" style="border:1px solid #abcdef;">
                </i>
              </a>
              <div class="comment-main">
                <header class="comment-header">
                  <div class="comment-meta">
                    <a class="comment-author" href="user.html">xiaoli</a>
                    评论于
                    <time title="2016-12-07 09:12:51" datetime="2016-12-07 09:12:51">2017-03-01 09:12:51</time>
                  </div>
                </header>
                <div class="comment-body">
                  <p>这电影真好看！</p>
                </div>
              </div>
            </li>
            <li class="item cl">
              <a href="user.html">
                <i class="avatar size-L radius">
                  <img alt="50x50" src="holder.js/50x50" class="img-circle" style="border:1px solid #abcdef;">
                </i>
              </a>
              <div class="comment-main">
                <header class="comment-header">
                  <div class="comment-meta">
                    <a class="comment-author" href="user.html">xiaoli</a>
                    评论于
                    <time title="2016-12-07 09:12:51" datetime="2016-12-07 09:12:51">2017-03-01 09:12:51</time>
                  </div>
                </header>
                <div class="comment-body">
                  <p>这电影真好看！</p>
                </div>
              </div>
            </li>
            <li class="item cl">
              <a href="user.html">
                <i class="avatar size-L radius">
                  <img alt="50x50" src="holder.js/50x50" class="img-circle" style="border:1px solid #abcdef;">
                </i>
              </a>
              <div class="comment-main">
                <header class="comment-header">
                  <div class="comment-meta">
                    <a class="comment-author" href="user.html">xiaoli</a>
                    评论于
                    <time title="2016-12-07 09:12:51" datetime="2016-12-07 09:12:51">2017-03-01 09:12:51</time>
                  </div>
                </header>
                <div class="comment-body">
                  <p>这电影真好看！</p>
                </div>
              </div>
            </li>
          </ul>
          <div class="col-md-12 text-center">
            <nav aria-label="Page navigation">
              <ul class="pagination">
                <li>
                  <a href="#" aria-label="First">
                    <span aria-hidden="true">首页</span>
                  </a>
                </li>
                <li>
                  <a href="#" aria-label="Previous">
                    <span aria-hidden="true">上一页</span>
                  </a>
                </li>
                <li><a href="#">1&nbsp;/&nbsp;10</a></li>
                <li>
                  <a href="#" aria-label="Next">
                    <span aria-hidden="true">下一页</span>
                  </a>
                </li>
                <li>
                  <a href="#" aria-label="Last">
                    <span aria-hidden="true">尾页</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
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
<!--播放页面-->
<script src="../static/jwplayer/jwplayer.js"></script>
<script>
  var ue = UE.getEditor('input_content',{
    toolbars: [
      ['fullscreen', 'emotion', 'preview', 'link']
    ],
    initialFrameWidth:"100%",
    initialFrameHeight:"100",
  });
</script>
<script type="text/javascript">
  jwplayer.key = "P9VTqT/X6TSP4gi/hy1wy23BivBhjdzVjMeOaQ==";
</script>
<script type="text/javascript">
  jwplayer("moviecontainer").setup({
    flashplayer: "../static/jwplayer/jwplayer.flash.swf",
    playlist: [{
      file: "../static/video/htpy.mp4",
      title: "环太平洋"
    }],
    modes: [{
      type: "html5"
    }, {
      type: "flash",
      src: "../static/jwplayer/jwplayer.flash.swf"
    }, {
      type: "download"
    }],
    skin: {
      name: "vapor"
    },
    "playlist.position": "left",
    "playlist.size": 400,
    height: 500,
    width: 774,
  });
</script>
<!--播放页面-->
<script>
  $(function() {
    new WOW().init();
  })
  function search(){
    //alert("hwofjajkdfa");
    var name = document.forms["frm"]["search"].value;
    $.ajax({
      url:"nsearchServlet?name="+name,
      type:"post"
    })
    //$.post("nsearchServlet?name="+name,{},function(data){})
  }
  function givemark(){
    location.href="mark.jsp";
  }
</script>
<script>
  $(document).ready(function() {
    $("img.lazy").lazyload({
      effect: "fadeIn"
    });
  });
</script>
</body>
</html>

