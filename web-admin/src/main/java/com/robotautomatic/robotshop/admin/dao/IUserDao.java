package com.robotautomatic.robotshop.admin.dao;

import com.robotautomatic.robotshop.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface IUserDao {
    User getUserById(Integer userId);
    User getUserByName(String userName);
    List<User> getAllUser();
    User login(@Param("userName") String name, @Param("userPassword") String password);
    void addUser(User user);
    void updateUser(User user);
    void deleteUser(Integer userId);
    List<User> search(User user);
    void deleteMulti(String[] ids);
    /*分页*/
    List<User> page(Map<String,Object> params);
    /*查询总笔数*/
    int count();
}
