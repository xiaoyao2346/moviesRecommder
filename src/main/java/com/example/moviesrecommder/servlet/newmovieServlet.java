package com.example.moviesrecommder.servlet;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "newmovieServlet", value = "/newmovieServlet")
public class newmovieServlet extends HttpServlet {
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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String year = request.getParameter("year");
        String type = request.getParameter("type");
        List<Map<String,Object>> list = dbdao.queryForList("select * from movies where id=?",Integer.parseInt(id));
        JSONObject message = new JSONObject();
        if(list.isEmpty()){
            int a = dbdao.update("insert into movies(id,name,published_year,type) values(?,?,?,?)",Integer.parseInt(id),name,year,type);
            if(a==1){
                message.put("message","success");
            }else message.put("message","fail");
        }else message.put("message","fail");
        response.getWriter().println(message);
    }
}
