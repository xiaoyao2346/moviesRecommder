<%@ page import="com.example.moviesrecommder.javabean.Movie" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 22485
  Date: 2022/4/14
  Time: 16:16
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
                <img src="../static/base/images/logo.png" style="height:30px;">&nbsp;电影推荐
            </a>
        </div>
        <!--小屏幕导航按钮和logo-->
        <!--导航-->
        <div class="navbar-collapse collapse">
            <form class="navbar-form navbar-left" style="margin-top:18px;" id="frm" name="frm">
                <div class="form-group input-group">
                    <input type="text" class="form-control" placeholder="请输入电影名！" name="search" >
                    <span class="input-group-btn" onclick="search()">
                        <a class="btn btn-default" href="search.jsp" ><span class="glyphicon glyphicon-search"></span>&nbsp;搜索</a>
<%--                        <button class="btn btn-default" onclick="search()"><span class="glyphicon glyphicon-search"></span>&nbsp;搜索</button>--%>
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
<!--内容-->
<!--热门电影-->
<section id="hotmovie" style="margin-top:76px">
    <div class="container">
        <div class="row wow fadeInRight" data-wow-delay="0.6s">
            <div class="row">
                <iframe class="wow fadeIn" width="100%" height="375px" frameborder=0 scrolling=no src="/1-index-animation/animation.html"></iframe>
            </div>
        </div>
    </div>
</section>
<!--热门电影-->
<!--电影列表-->
<section id="movielist">
    <div class="container">
        <div class="row wow fadeIn" data-wow-delay="0.6s">
            <div class="col-md-12 table-responsive">
                <table class="table text-left table-bordered" id="movietags">
                    <tr>
                        <td style="width:10%;">电影标签</td>
                        <td style="width:90%;">
                            <a class="label label-info"><span class="glyphicon glyphicon-tag"></span>&nbsp;标签一</a>
                            &nbsp;
                            <a class="label label-info"><span class="glyphicon glyphicon-tag"></span>&nbsp;标签一</a>
                            &nbsp;
                            <a class="label label-info"><span class="glyphicon glyphicon-tag"></span>&nbsp;标签一</a>
                            &nbsp;
                            <a class="label label-info"><span class="glyphicon glyphicon-tag"></span>&nbsp;标签一</a>
                            &nbsp;
                            <a class="label label-info"><span class="glyphicon glyphicon-tag"></span>&nbsp;标签一</a>
                    </tr>
                    <tr>
                        <td>电影星级</td>
                        <td>
                            <a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;一星</a>
                            &nbsp;
                            <a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;二星</a>
                            &nbsp;
                            <a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;三星</a>
                            &nbsp;
                            <a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;四星</a>
                            &nbsp;
                            <a class="label label-warning"><span class="glyphicon glyphicon-star"></span>&nbsp;五星</a>
                        </td>
                    </tr>
                    <tr>
                        <td>上映时间</td>
                        <td>
                            <a class="label label-default"><span class="glyphicon glyphicon-time">&nbsp;最近</span></a>
                            &nbsp;
                            <a class="label label-default"><span class="glyphicon glyphicon-time">&nbsp;2017</span></a>
                            &nbsp;
                            <a class="label label-default"><span class="glyphicon glyphicon-time">&nbsp;2016</span></a>
                            &nbsp;
                            <a class="label label-default"><span class="glyphicon glyphicon-time">&nbsp;2015</span></a>
                            &nbsp;
                            <a class="label label-default"><span class="glyphicon glyphicon-time">&nbsp;更早</span></a>
                        </td>
                    </tr>
                    <tr>
                        <td>播放数量</td>
                        <td>
                            <a class="label label-success"><span class="glyphicon glyphicon-arrow-down">&nbsp;从高到底</span></a>
                            &nbsp;
                            <a class="label label-danger"><span class="glyphicon glyphicon-arrow-up">&nbsp;从低到高</span></a>
                        </td>
                    </tr>
                    <tr>
                        <td>评论数量</td>
                        <td>
                            <a class="label label-success"><span class="glyphicon glyphicon-arrow-down">&nbsp;从高到底</span></a>
                            &nbsp;
                            <a class="label label-danger"><span class="glyphicon glyphicon-arrow-up">&nbsp;从低到高</span></a>
                        </td>
                    </tr>
                </table>
            </div>
            <%
                List<Movie> movieList = (List<Movie>) session.getAttribute("movieList");
                for(Movie movie:movieList){
                    System.out.println("main.jsp中推荐电影："+movie.getName());
            %>
            <div class="col-md-3" >
                <script>var movieID = <%=movie.getId()%>></script>
                <div class="movielist text-center">
                    <!--<img data-original="holder.js/262x166"
                             class="img-responsive lazy center-block" alt="">-->
                    <img src="img/<%=(movie.getId())%30%>.jpg" class="img-responsive center-block" alt="" style="height: 166px;width: 262px">
                    <div class="text-left" style="margin-left:auto;margin-right:auto;width:210px;">
                        <span style="color:#999;font-style: italic;"><%= movie.getName()%></span><br>
                        <div>
                            <span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
                            <span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
                            <span class="glyphicon glyphicon-star" style="color:#FFD119"></span>
                            <span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
                            <span class="glyphicon glyphicon-star-empty" style="color:#FFD119"></span>
                        </div>
                    </div>
                    <a class="btn btn-primary" target="_blank" role="button" id="<%=movie.getId()%>" onclick="givemark()"><span class="glyphicon glyphicon-play"></span>&nbsp;播放</a>

                </div>
            </div>
            <% }%>

            <div class="col-md-12">
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
</section>
<!--电影列表-->
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
        //alert("hwofjajkdfa");
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
        location.href="play.jsp?movieID="+movieID;
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
