package com.robotautomatic.robotshop.admin.service.Impl;

import com.funtl.my.shop.commons.dto.BaseResult;
import com.funtl.my.shop.commons.dto.PageInfo;
import com.robotautomatic.robotshop.admin.dao.IUserDao;
import com.robotautomatic.robotshop.admin.service.IUserService;
import com.robotautomatic.robotshop.domain.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;
    @Override
    /*登录*/
    public User login(String username, String password) {
        User user = userDao.login(username,password );
        return user;
    }
    /* 查询所有用户 */
    @Override
    public List<User> getAllUser() {
        List<User> userList = userDao.getAllUser();
        return  userList;
    }

    /*保存用户信息*/
    @Override
    public BaseResult saveUser(User user) {
        BaseResult baseResult = checkResult(user);
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            /*新增用户*/
            if (user.getUserId() == null) {
                userDao.addUser(user);
            }
            /*编辑用户息*/
            else {
                userDao.updateUser(user);
            }

            baseResult.setMessage("保存成功");
        }
        return baseResult;
    }

    /*通过id查询用户*/
    @Override
    public User getUserById(Integer userId) {
        User user = userDao.getUserById(userId);
        return user;
    }

    /*搜索*/
    public List<User> search(String search){
        User user = new User();
        user.setUserName(search);
        user.setUserPhone(search);
        user.setUserEmail(search);
        user.setUserQQ(search);
        List<User> users = userDao.search(user);
        return users;
    }


    /*验证用户信息*/
    private BaseResult checkResult(User user){
        BaseResult baseResult = BaseResult.success();
        if (StringUtils.isBlank(user.getUserName())){
            baseResult = BaseResult.fail("姓名不能为空");
        }
        if (StringUtils.isBlank(user.getUserPassword())){
            baseResult = BaseResult.fail("密码不能为空");
        }
        return baseResult;
    }
    /*批量删除*/
    @Override
    public void deleteMulti(String[] ids) {
        userDao.deleteMulti(ids);
    }

    /*分页*/
    @Override
    public PageInfo<User> page(int start, int length, int draw) {
        int count = userDao.count();
        Map<String, Object> params = new HashMap<>();
        params.put("start", start);
        params.put("length", length);

        PageInfo<User> pageInfo = new PageInfo<>();
        pageInfo.setDraw(draw);
        pageInfo.setRecordsTotal(count);
        pageInfo.setRecordsFiltered(count);
        pageInfo.setData(userDao.page(params));
        System.out.println("page data"+ pageInfo.getData());
        return pageInfo;
    }

    @Override
    public int count() {
        return 0;
    }


}
/*
else if (RegexpUtils.checkEmail(user.getUserEmail())){
        baseResult = BaseResult.fail("邮箱格式不正确");
        }*/
