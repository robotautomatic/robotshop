package com.robotautomatic.robotshop.admin.service;

import com.funtl.my.shop.commons.dto.BaseResult;
import com.funtl.my.shop.commons.dto.PageInfo;
import com.robotautomatic.robotshop.domain.User;

import java.util.List;
import java.util.Map;

public interface IUserService {
    /*用户登录*/
    User login(String username, String password);
    List<User> getAllUser();
    BaseResult saveUser(User user);
    User getUserById(Integer userId);
    List<User> search(String search);

    /*批量删除*/
    void deleteMulti(String[] ids);

    /*分页*/
    PageInfo<User> page(int start, int length, int draw);

    /*查询总笔数*/
    int count();
}
