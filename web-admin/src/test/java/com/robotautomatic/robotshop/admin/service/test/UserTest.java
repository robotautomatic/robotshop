package com.robotautomatic.robotshop.admin.service.test;

import com.funtl.my.shop.commons.dto.PageInfo;
import com.robotautomatic.robotshop.admin.dao.IUserDao;
import com.robotautomatic.robotshop.admin.service.Impl.UserServiceImpl;
import com.robotautomatic.robotshop.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-context-druid.xml", "classpath:spring-context-mybatis.xml"})
public class UserTest {
    @Autowired
    private IUserDao userDao ;
    @Autowired
    private UserServiceImpl userService;

    @Test
    public void testGetUser() throws IOException {

        User user = userDao.login("admin","123");
        System.out.println(user);
    }
    @Test
    public void  testGetAllUser(){
        List<User> userList = userDao.getAllUser();

        System.out.println(userList);
    }
    @Test
    public void  testAddUser(){
        User user = new User("gl","123",null,"123@321.com",null);
        userDao.addUser(user);
    }
    @Test
    public void  testDeleteUser(){
        userDao.deleteUser(3);
    }
    @Test
    public void  testUpdateUser(){
        User user = new User(2,"robot","321",null,"xcx0424@163.com","378742922");
        userDao.updateUser(user);
    }
    /*搜索*/
    @Test
    public void  testSearch(){
/*        User user = new User();
        String search = "a";
        user.setUserName(search);
        user.setUserPhone(search);
        user.setUserEmail(search);
        user.setUserQQ(search);
        List<User> users = userDao.search(user);*/
        List<User> users = userService.search("a");
        System.out.println(users);

    }
    /*批量删除*/
    @Test
    public void  testDeleteMulti(){
        String[] ids ={"5","6"};
        userService.deleteMulti(ids);
    }
    /*分页*/
    @Test
    public void  testPage(){
        int count = userDao.count();
        Map<String, Object> params = new HashMap<>();
        params.put("start", 0);
        params.put("length", 10);
        List list = new ArrayList();
        list = userDao.page(params);
        System.out.println(list);
    }

}
