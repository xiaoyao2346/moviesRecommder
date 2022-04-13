package com.example.moviesrecommder.servlet;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name = "logupServlet", value = "/logupServlet")
public class logupServlet extends HttpServlet {
    @Autowired
    public JdbcTemplate dbdao;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        PrintWriter out = response.getWriter();
        List<Map<String, Object>> list=dbdao.queryForList("select * from user where username=?",name);
        JSONObject result = null;
        if(list.size()>0){
            result = new JSONObject();
            result.put("insertinfo","false");
        }else{
            int id = dbdao.queryForObject("select max(userid) from user",java.lang.Integer.class);
            System.out.println("用户最大id为："+id);
            dbdao.update("insert into user values (?,?,?,?,?,?)",name,id+1,password,phone,email,address);
            result = new JSONObject();
            result.put("insertinfo","true");
        }
        out.write(result.toJSONString());
    }
}
