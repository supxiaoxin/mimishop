package com.mys;

import com.mys.utils.MD5Util;
import org.junit.Test;

public class MyTest {
    @Test
    public void md5Test(){
        String m= MD5Util.getMD5("729351");
        System.out.println(m);
    }
}
