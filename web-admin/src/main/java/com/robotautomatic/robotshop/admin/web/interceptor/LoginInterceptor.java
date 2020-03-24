package com.robotautomatic.robotshop.admin.web.interceptor;

import com.funtl.my.shop.commons.constant.ConstantUtils;
import com.robotautomatic.robotshop.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println(httpServletRequest.getSession().getAttribute(ConstantUtils.SESSION_USER)+"aaaaaa");
        User user = (User) httpServletRequest.getSession().getAttribute(ConstantUtils.SESSION_USER);
        if (user==null) httpServletResponse.sendRedirect("/login");
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
/*        User user = (User) httpServletRequest.getSession().getAttribute(ConstantUtils.SESSION_USER);
        if (user==null && !modelAndView.getViewName().equals("login")) httpServletResponse.sendRedirect("/login");
        else if (user!=null && modelAndView.getViewName().equals("login")) httpServletResponse.sendRedirect("/main");
        else ;*/
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
