package com.example.moviesrecommder.servlet;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changeServlet", value = "/changeServlet")
public class changeServlet extends HttpServlet {
    @Autowired
    JdbcTemplate dao;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        int id = (int) request.getSession().getAttribute("userid");
        JSONObject message = new JSONObject();
        message.put("message","fail");
        if(name!=null&&!name.equals("")){
            int a = dao.update("update user set username=? where userid=?",name,id);
            if(a==1){
                HttpSession session = request.getSession(true);
                session.setAttribute("username",name);
                message = new JSONObject();
                message.put("message","success");
            }
        }
        if(phone!=null&&!phone.equals("")){
            int a = dao.update("update user set phone=? where userid=?",phone,id);
            if(a==1){
                HttpSession session = request.getSession(true);
                session.setAttribute("phone",phone);
                message = new JSONObject();
                message.put("message","success");
            }
        }
        if(email!=null&&!email.equals("")){
            int a = dao.update("update user set email=? where userid=?",email,id);
            if(a==1){
                HttpSession session = request.getSession(true);
                session.setAttribute("email",email);
                message = new JSONObject();
                message.put("message","success");
            }
        }
        if(address!=null&&!address.equals("")){
            int a = dao.update("update user set address=? where userid=?",address,id);
            if(a==1){
                HttpSession session = request.getSession(true);
                session.setAttribute("address",address);
                message = new JSONObject();
                message.put("message","success");
            }
        }
        if(password!=null&&!password.equals("")){
            int a = dao.update("update user set password=? where userid=?",password,id);
            if(a==1){
                message = new JSONObject();
                message.put("message","success");
            }
        }
        response.getWriter().println(message);
    }
}
