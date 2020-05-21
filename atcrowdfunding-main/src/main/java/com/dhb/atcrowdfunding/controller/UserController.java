package com.dhb.atcrowdfunding.controller;

import com.dhb.atcrowdfunding.BaseController;
import com.dhb.atcrowdfunding.bean.User;
import com.dhb.atcrowdfunding.manager.service.UserService;
import com.dhb.atcrowdfunding.util.Const;
import com.dhb.atcrowdfunding.util.Datas;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: UserController
 * @Description:修改哪个项目的时候，如果使用一键安装和clean不起作用的时候，那么就单独install一下：
 * @Author: dong_hb
 * @Date: 2020/5/18 10:12 下午
 * @Version 1.0
 */
@Controller
public class UserController extends BaseController {

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


    /**跳转到用户列表*/
    @RequestMapping("/user/user")
    public String userListPage(){
        return "user";
    }


    /**跳转到用户新增页面：*/
    @RequestMapping("/user/add")
    public String userAddPage(){
        return "add";
    }


   /* *
    * @Author: dong_hb
    * @Description: 看框架如果将一个js集合或数组封装到java中
    *               对应的数组或集合中。
    * @Date: 2020/5/21
    * @Param [id]
    * @return java.util.Map<java.lang.String,java.lang.Object>
    */
    @RequestMapping(value = "/user/deleteBatchWithUser")
    @ResponseBody
    public Map<String,Object> deleteBatchWithUser(Datas datas){
        successMethod(Const.SUCCESS_VALUE,true);
        try {
            Integer resNo = userService.deleteBatchWithUser(datas.getIds());
        } catch (Exception e) {
            successMethod(Const.SUCCESS_VALUE,false);
            messageMethod(Const.MESSAGE_INFO,e.getMessage());
            e.printStackTrace();
        }
        return getResultMap();
    }


    /* *
     * @Author: dong_hb
     * @Description: 删除用户
     * @Date: 5:30 下午 2020/5/21
     * @Param [id]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     */
    @RequestMapping(value = "/user/deleteUserById")
    @ResponseBody
    public Map<String,Object> deleteUserById(Integer id){
        successMethod(Const.SUCCESS_VALUE,true);
        try {
            Integer resNo = userService.deleteUserById(id);
        } catch (Exception e) {
            successMethod(Const.SUCCESS_VALUE,false);
            messageMethod(Const.MESSAGE_INFO,e.getMessage());
            e.printStackTrace();
        }
        return getResultMap();
    }


    /* *
     * @Author: dong_hb
     * @Description: 新增管理员：
     * @Date: 4:14 下午 2020/5/21
     * @Param [user]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     */
    @RequestMapping(value = "/user/addUser")
    @ResponseBody
    public Map<String,Object> addUser(User user){
        successMethod(Const.SUCCESS_VALUE,true);
        try {
            Integer resNo = userService.addUser(user);
        } catch (Exception e) {
            successMethod(Const.SUCCESS_VALUE,false);
            messageMethod(Const.MESSAGE_INFO,e.getMessage());
            e.printStackTrace();
        }
        return getResultMap();
    }


    /* *
     * @Author: dong_hb
     * @Description: 查询用户列表：
     * @Date: 10:44 上午 2020/5/21
     * @Param []
     * @return java.util.Map<java.lang.String,java.lang.Object>
     */
    @RequestMapping(value = "/user/findUserList")
    @ResponseBody
    public Map<String,Object> findUserList(String condition){
        successMethod(Const.SUCCESS_VALUE,true);
        try {
            List<User> userList = userService.findUserList(condition);
            addListData2Map(userList);
        } catch (Exception e) {
            successMethod(Const.SUCCESS_VALUE,false);
            messageMethod(Const.MESSAGE_INFO,e.getMessage());
            e.printStackTrace();
        }
        return getResultMap();
    }



    /* *
     * @Author: dong_hb
     * @Description: 用户登录。
     *               @ResponseBody：开启消息转换器。
     * 第二阶段：
     *     对通用的代码进行封装：通用的代码包含创建map接收参数
     *     设置错误的提示信息，错误的提示码
     *  创建工具类;
     *      BaseController
     *  反思：
     *     如果使用同步锁，synchonized,并发量很大的话，体验会很差，
     *     因为只有释放锁之后，另一方才可以调用这个方法的权限，其他的
     *     方法只能在后面等待。
     *
     * @Date: 10:57 下午 2020/5/18
     * @Param [user]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     */
    @RequestMapping("/userManager/login")
    @ResponseBody
    public Map<String,Object> login(User user, HttpSession httpSession){
        //如果登录成功的话，会跳转到首页，此时也就不需要设置登录的信息。
        successMethod(Const.SUCCESS_VALUE,true);
        try {
            User result = userService.queryUserByLoginAcct(user);
            //将用户的信息放置到session中：
            httpSession.setAttribute(Const.LOGIN_USER,result);
        } catch (Exception e) {
            //如果登录失败的话，那么就需要将错误信息，以及错误码设置到map中：
            successMethod(Const.SUCCESS_VALUE,false);
            messageMethod(Const.MESSAGE_INFO,e.getMessage());
            e.printStackTrace();
        }
        return getResultMap();
    }

}
