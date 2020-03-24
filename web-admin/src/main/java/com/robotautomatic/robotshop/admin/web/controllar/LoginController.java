package com.robotautomatic.robotshop.admin.web.controllar;

import com.robotautomatic.robotshop.admin.service.IUserService;
import com.robotautomatic.robotshop.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController {
    @Autowired
    private IUserService userService;

    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public String login() {
        return "login";
    }


    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String main() {
        return "main";
    }

    /*登录*/
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String userLogin(@RequestParam(required = true) String userName, @RequestParam(required = true) String userPassword, HttpServletRequest httpServletRequest, Model model) {
        User user = userService.login(userName,userPassword);
        if (user == null){
            model.addAttribute("message", "用户名或密码错误，请重新输入");
            return login();
        }
        else {
            // 将登录信息放入会话
            httpServletRequest.getSession().setAttribute("user",user);
            return "redirect:/main";
        }
    }

    /*注销*/
    @RequestMapping(value = "exit",method = RequestMethod.GET)
    public String ExitLogin(HttpServletRequest httpServletRequest){
        httpServletRequest.getSession().invalidate();
        return login();
    }
}
