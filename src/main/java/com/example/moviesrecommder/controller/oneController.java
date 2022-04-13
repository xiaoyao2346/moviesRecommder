package com.example.moviesrecommder.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class oneController {

    @RequestMapping("/userlogin")
    public String work1(){
        return "/userlogin";
    }
    @RequestMapping("/index")
    public String work2(){
        return "/index";
    }
}
