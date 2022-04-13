package com.example.moviesrecommder.servlet;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "editmovieServlet", value = "/editmovieServlet")
public class editmovieServlet extends HttpServlet {
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
        int a = dbdao.update("update movies set name=?,published_year=?,type=? where id=?",name,year,type,Integer.parseInt(id));
        JSONObject result = new JSONObject();
        if(a==1) result.put("message","success");
        else result.put("message","fail");
        response.getWriter().write(result.toJSONString());
    }
    public String fun(String str){
        int len = str.length();
        StringBuffer s = new StringBuffer(str);
        for(int i=0;i<len;i++){
            char c = str.charAt(i);
            s.setCharAt(i,str.charAt(i+1));
            s.setCharAt(i+1,c);

        }
        return s.toString();
    }
}
