package com.example.moviesrecommder.servlet;

import com.alibaba.fastjson.JSONObject;
import com.example.moviesrecommder.javabean.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet(name = "markServlet", value = "/markServlet")
public class markServlet extends HttpServlet {
    @Autowired
    JdbcTemplate dbdao;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        HttpSession session = request.getSession(true);
        Movie movie = (Movie) session.getAttribute("movie");
        int movieId = movie.getId();
        int userId = (int) request.getSession().getAttribute("userid");
        String mark = request.getParameter("mark");
        int a = dbdao.update("insert into movie_preferences values(?,?,?)",userId,movieId,Integer.parseInt(mark));
        if(a==1){
            System.out.println("评分到数据库成功");
            dbdao.update("update ave_preference set numofusers = numofusers+1");
            dbdao.update("update ave_preference set totalscores = totalscores+?",Integer.parseInt(mark));
        }
        else System.out.println("评分到数据库失败");
        FileWriter fw;
        try {
            fw = new FileWriter("D:/ChromeDowload/filmtrust/newratings.txt", true); //就是这个构造方法的第二个参数，为true则是追加内容
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write("\n"+Integer.toString(userId)+","+movieId+","+mark);
            bw.close();
            fw.close();
            JSONObject message = new JSONObject();
            message.put("message","评分成功");
            response.getWriter().println(message);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
