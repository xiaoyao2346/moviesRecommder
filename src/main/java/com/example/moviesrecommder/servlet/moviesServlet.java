package com.example.moviesrecommder.servlet;

import com.alibaba.fastjson.JSON;
import com.example.moviesrecommder.javabean.Movie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "moviesServlet", value = "/moviesServlet")
public class moviesServlet extends HttpServlet {
    @Autowired
    JdbcTemplate dbdao;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        List<Map<String, Object>> list=dbdao.queryForList("select * from movies");
        List<Movie> movieList = new ArrayList<>();
        for(Map<String,Object> map:list){
            int id = (int) map.get("id");
            String name = (String) map.get("name");
            String year = (String) map.get("published_year");
            String[] t = ((String) map.get("type")).split(",");
            List<String> type = new ArrayList<String>();
            for(String s:t) type.add(s);
            movieList.add(new Movie(id,name,year,type));
        }
        out.write(JSON.toJSONString(movieList));
    }
}
