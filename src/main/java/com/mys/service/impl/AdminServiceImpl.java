package com.mys.service.impl;

import com.mys.mapper.AdminMapper;
import com.mys.pojo.Admin;
import com.mys.pojo.AdminExample;
import com.mys.service.AdminService;
import com.mys.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    //在业务逻辑层中,一定会有数据访问层的对象
    @Autowired
    AdminMapper adminMapper;

    @Override
    public Admin login(String name, String pwd) {

        //根据传入的用户或到DB中查询相应用户对象
        //如果有条件 ,则一定要创建AdminExample的对象,用来封装条件
        AdminExample example = new AdminExample();
        /**如何添加条件
         * select * from admin where a_name ='admin'
         */
        //添加用户名a_name条件
        example.createCriteria().andANameEqualTo(name);

        List<Admin> list = adminMapper.selectByExample(example);
        if(list.size() > 0 ){
            Admin admin = list.get(0);
            //如果查询到用户对象,再进行密码的比对,注意密码是密文
            /**
             * 分析:
             * admin.getApass==>c984aed014aec7623a54f0591da07a85fd4b762d
             * pwd===>000000
             * 在进行密码对比时,要将传入的pwd进行md5加密,再与数据库中查到的对象的密码进行对比
             */
            String miPwd = MD5Util.getMD5(pwd);
            if(miPwd.equals(admin.getaPass())){
                return admin;
            }
        }
        return null;
    }

    @Override
    public String regist(Admin admin) {
        AdminExample example = new AdminExample();
        /**如何添加条件
         * select * from admin where a_name ='admin'
         */
        //添加用户名a_name条件
        example.createCriteria().andANameEqualTo(admin.getaName());

        List<Admin> list = adminMapper.selectByExample(example);
        if(list.size() > 0 ){
            System.out.println("用户已经注册！");
            return "用户已经注册！";
        }
        admin.setaPass(MD5Util.getMD5(admin.getaPass()));
        int count= adminMapper.insert(admin);
        if(count==1){
            System.out.println("注册成功！");
            return "注册成功！";
        }
        System.out.println("注册失败！");
        return "注册失败！";
    }


}
