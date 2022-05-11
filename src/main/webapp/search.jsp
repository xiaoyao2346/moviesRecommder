<%@ page import="com.example.moviesrecommder.javabean.Movie" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 22485
  Date: 2022/4/14
  Time: 18:11
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
    <style>
        .navbar-brand>img {
            display: inline;
        }

    </style>
    <style>
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
                <img src="../static/base/images/logo.png" style="height:30px;">&nbsp;搜索结果
            </a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
            <form class="navbar-form navbar-left" role="search" style="margin-top:18px;" id="frm" name="frm">
                <div class="form-group input-group">
                    <input type="text" class="form-control" placeholder="请输入电影名！" name="search" onclick="search()">
                    <span class="input-group-btn"  onclick="search()">
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
<%
    List<Movie> searchlist = (List<Movie>) session.getAttribute("searchlist");
    for(Movie movie:searchlist){
        System.out.println(movie.getName());
    }
%>
<div class="container" style="margin-top:76px">
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb" style="margin-top:6px;">
                <li>与"<%=session.getAttribute("searchvalue")%>"有关的电影，共<%=searchlist.size()%>部</li>
            </ol>
        </div>
        <div class="col-md-12">
            <%
                for(Movie movie:searchlist){
            %>
            <div class="media">
                <div class="media-left">
                    <a href="#">
                        <img class="media-object" src="img/<%=(movie.getId())%30%>.jpg" alt="<%=movie.getName()%>" style="width: 131px;height: 83px">
                    </a>
                </div>
                <div class="media-body">
                    <h4 class="media-heading"><%=movie.getName()%><a class="label label-primary pull-right" id="<%=movie.getId()%>" onclick="givemark()"><span class="glyphicon glyphicon-play"></span>播放影片</a></h4>
                    类型：<%=movie.getType()%>&nbsp;&nbsp;&nbsp;&nbsp;
                    上映时间：<%=movie.getYear()%>
                </div>
            </div>
            <%}%>

        </div>
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
    function search(){
        var name = document.forms["frm"]["search"].value;
        $.ajax({
            url:"nsearchServlet?name="+name,
            type:"post"
        })
        //$.post("nsearchServlet?name="+name,{},function(data){})
    }
    function givemark(){
        var movieID = event.target.id;
        // $.ajax({
        //     url:"play.jsp?movieID="+movieID,
        //     type:"post"
        // })
        location.href="play.jsp?movieID2="+movieID;
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

