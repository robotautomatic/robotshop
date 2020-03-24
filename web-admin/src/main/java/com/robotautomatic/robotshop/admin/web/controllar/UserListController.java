package com.robotautomatic.robotshop.admin.web.controllar;

import com.funtl.my.shop.commons.dto.BaseResult;
import com.funtl.my.shop.commons.dto.PageInfo;
import com.robotautomatic.robotshop.admin.service.IUserService;
import com.robotautomatic.robotshop.domain.User;
import com.sun.tracing.dtrace.Attributes;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller

public class UserListController {
    @Autowired
    IUserService userService;

    @ModelAttribute
    public User getUser(Integer id){
        User user = new User();
        if (id != null){
            user = userService.getUserById(id);
        }else {}
        return user;
    }

    /*查询所有的用户*/
    @RequestMapping(value = "user_list", method = RequestMethod.GET)
    public String userList(Model model) {
/*        List<User> allUser = userService.getAllUser();
        model.addAttribute("users",allUser );*/
        return "/user_list";
    }

    /*跳转用户表单页*/
    @RequestMapping(value="user_form",method = RequestMethod.GET)
    public String user_form(){
        return "/user_form";
    }

    /*保存用户信息*/
    @RequestMapping(value = "saveUser",method = RequestMethod.POST)
    public String saveUser(User saveUser, Model model, RedirectAttributes redirectAttributes){
        BaseResult baseResult = userService.saveUser(saveUser);
        if (baseResult.getStatus() == BaseResult.STATUS_SUCCESS) {
            redirectAttributes.addFlashAttribute("baseResult", baseResult);
            return "redirect:/user_list";
        }
        else {
            model.addAttribute("baseResult",baseResult );
            return "/user_form";
        }
    }

    /*删除用户信息*/
    @ResponseBody
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public BaseResult delete(String ids) {
        BaseResult baseResult = null;
        if (StringUtils.isNotBlank(ids)) {
            String[] idArray = ids.split(",");
            userService.deleteMulti(idArray);
            baseResult = BaseResult.success("删除用户成功");
        } else {
            baseResult = BaseResult.fail("删除用户失败");
        }
        System.out.println("1111111111111111111111111111111111111");
        System.out.println(baseResult.getMessage());
        System.out.println("22222222222222222222");
        return baseResult;
    }



    /*搜索*/
    @RequestMapping(value = "search", method = RequestMethod.POST)
    public String search(String search, Model model){
        List<User> users = userService.search(search);
        System.out.println(search);
        model.addAttribute("users",users);
        model.getClass().toString();
        System.out.println("-------");
        System.out.println(users);
        return "/user_list";
    }


    /*分页*/
    @RequestMapping(value = "page",method = RequestMethod.GET)
    @ResponseBody
    public PageInfo<User> page(HttpServletRequest request){
        System.out.println("打印request" + request);
        String strdraw = request.getParameter("draw");
        System.out.println("draw"+strdraw);
        String strstart = request.getParameter("start");
        System.out.println("start"+strstart);
        String strlength = request.getParameter("length");
        System.out.println("strlength"+strlength);
        int draw = strdraw == null?0:Integer.parseInt(strdraw);
        int start = strstart ==null?0:Integer.parseInt(strstart);
        int length = strlength ==null?10:Integer.parseInt(strlength);
        // 封装 Datatables 需要的结果
        PageInfo<User> pageInfo = userService.page(start, length, draw);
        System.out.println("fz data  " + pageInfo.getData());
        System.out.println(pageInfo);

        return pageInfo;
    }

    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail() {
        return "/user_detail";
    }
}
