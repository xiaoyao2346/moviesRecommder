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

@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
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
        String password = request.getParameter("password");
        PrintWriter out = response.getWriter();
        List<Map<String, Object>> list=dbdao.queryForList("select * from user where username=?",name);
        String realpwd = "";
        if(list.size()>0){
            realpwd = (String)list.get(0).get("password");
        }
        JSONObject result = null;
        if(!realpwd.equals("")){
            //System.out.println(realpwd);
            if(password.equals(realpwd)){
                result = new JSONObject();
                result.put("message","success");
                HttpSession session = request.getSession(true);
                session.setAttribute("username",name);
                session.setAttribute("phone",(String) list.get(0).get("phone"));
                session.setAttribute("email",(String) list.get(0).get("email"));
                session.setAttribute("address",(String) list.get(0).get("address"));
                //request.getRequestDispatcher("").forward(request, response);
//                String id=(String) list.get(0).get("id");
//                session.setAttribute("userid",id);
            }
            else{
                result = new JSONObject();
                result.put("message","fail");
            }
        }else{
            result = new JSONObject();
            result.put("message","fail");
        }
        out.write(result.toJSONString());
    }
}
