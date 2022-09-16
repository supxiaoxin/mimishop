package com.mys.service;

import com.mys.pojo.Admin;

public interface AdminService {
    //完成登录判断
    Admin login(String name, String pwd);
 
}
