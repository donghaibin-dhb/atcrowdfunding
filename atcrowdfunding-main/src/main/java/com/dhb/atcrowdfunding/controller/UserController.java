package com.dhb.atcrowdfunding.controller;

import com.dhb.atcrowdfunding.bean.User;
import com.dhb.atcrowdfunding.manager.service.UserService;
import com.dhb.atcrowdfunding.util.Const;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName: UserController
 * @Description:修改哪个项目的时候，如果使用一键安装和clean不起作用的时候，那么就单独install一下：
 * @Author: dong_hb
 * @Date: 2020/5/18 10:12 下午
 * @Version 1.0
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;


    /**退出系统：*/
    @RequestMapping("/loginout")
    public String loginout(HttpSession session){
        if (session != null)
            session.invalidate();
        //防止一直提交表单：
        return "redirect:/login.htm";
    }


    /**跳转到后台主页*/
    @RequestMapping("/main")
    public String main(){
        return "main";
    }


    /**跳转到登录页面：*/
    @RequestMapping("/login")
    public String forwardLoginPage(){
        return "login";
    }


    /* *
     * @Author: dong_hb
     * @Description: 用户登录。
     *               @ResponseBody：开启消息转换器。
     * @Date: 10:57 下午 2020/5/18
     * @Param [user]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     */
    @RequestMapping("/userManager/login")
    @ResponseBody
    public Map<String,Object> login(User user, HttpSession httpSession){

        Map<String,Object> resultMap = new HashMap<String, Object>();
        //如果登录成功的话，会跳转到首页，此时也就不需要设置登录的信息。
        resultMap.put(Const.SUCCESS_VALUE,Const.BOOLEAN_VALUE_TRUE);

        try {

            User result = userService.queryUserByLoginAcct(user);
            //将用户的信息放置到session中：
            httpSession.setAttribute(Const.LOGIN_USER,result);

        } catch (Exception e) {
            //如果登录失败的话，那么就需要将错误信息，以及错误码设置到map中：
            resultMap.put(Const.SUCCESS_VALUE,Const.BOOLEAN_VALUE_FALSE);
            resultMap.put(Const.MESSAGE_INFO,e.getMessage());
            e.printStackTrace();
        }
        return resultMap;
    }

}
