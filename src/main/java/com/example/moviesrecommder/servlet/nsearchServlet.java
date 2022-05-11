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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "nsearchServlet", value = "/nsearchServlet")
public class nsearchServlet extends HttpServlet {
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
        String name = request.getParameter("name");

        List<Map<String,Object>> list = null;
        list = dbdao.queryForList("select * from movies where name like '%"+name+"%'");
        List<Movie> movieList = new ArrayList<>();
        HashMap<Integer,Movie> moviesmap = new HashMap<>();
        for(Map<String,Object> map:list){
            int id = (int) map.get("id");
            String _name = (String) map.get("name");
            String year = (String) map.get("published_year");
            String[] t = ((String) map.get("type")).split(",");
            List<String> type = new ArrayList<String>();
            for(String s:t) type.add(s);
            Movie movie = new Movie(id,_name,year,type);
            movieList.add(movie);
            moviesmap.put(id,movie);
        }
        HttpSession session = request.getSession(true);
        session.setAttribute("searchlist",movieList);
        session.setAttribute("searchvalue",name);
        session.setAttribute("searchmoivesmap",moviesmap);
    }
}
