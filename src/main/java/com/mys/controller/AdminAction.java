package com.mys.controller;

import com.mys.pojo.Admin;
import com.mys.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
public class AdminAction {
    //切记:在所有的界面层,一定会有业务逻辑层的对象
    @Autowired
    AdminService adminService;

    //实现登判断,并进行相应的跳转
    @RequestMapping("/login")
    public String login(String name , String pwd, HttpServletRequest request){

        Admin admin = adminService.login(name,pwd);
        if(admin != null){
            request.setAttribute("admin",admin);
            System.out.println("成功");
            //登录成功
            return "main";
        }else{
            //登录失败
            request.setAttribute("errmsg","用户名或密码不正确!");
            System.out.println("失败");
            return "login";
        }

    }

    //实现注册功能
    @RequestMapping("/regist")
    public String registAdmin(HttpServletRequest request){
        Admin admin=new Admin();
        admin.setaName((String) request.getParameter("name"));
        admin.setaPass((String) request.getParameter("password"));
        System.out.println(admin);
        request.setAttribute("errmsg", adminService.regist(admin));
        if(request.getAttribute("errmsg")=="注册成功！"){
            return "login";
        }
        return "regist";
    }
}
