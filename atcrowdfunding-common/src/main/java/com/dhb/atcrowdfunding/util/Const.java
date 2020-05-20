package com.dhb.atcrowdfunding.util;

import org.apache.ibatis.annotations.Param;

/**
 * 常量类
 *
 * @author zhangyu
 */
public class Const {
    /* *
     * @Author: dong_hb
     * @Description: 项目上下文
     * @Date: 11:02 下午 2020/5/18
     * @Param 
     * @return 
     */
    public static final String APP_PATH = "APP_PATH";
    /* *
     * @Author: dong_hb
     * @Description: session中的属性值
     * @Date: 11:02 下午 2020/5/18
     * @Param
     * @return
     */
    public static final String LOGIN_USER = "loginUser";
    /* *
     * @Author: dong_hb
     * @Description: 用户名不存在
     * @Date: 11:03 下午 2020/5/18
     * @Param
     * @return
     */
    public static final String LOGIN_LOGINACCT_ERROR = "用户名称不存在!";
    /* *
     * @Author: dong_hb
     * @Description: 用户密码不正确
     * @Date: 11:03 下午 2020/5/18
     * @Param
     * @return
     */
    public static final String LOGIN_USERPSWD_ERROR = "用户密码不正确!";
    /* *
     * @Author: dong_hb
     * @Description: 设置默认密码：
     * @Date: 11:04 下午 2020/5/18
     * @Param
     * @return
     */
    public static final String DEFAULT_USERPSWD = "123";
    public static final String RESULT_SUCCESS_LOGIN_INFO = "登录成功";
    public static final String RESULT_FALSE_LOGIN_INFO = "登录失败";

    public static final Boolean BOOLEAN_VALUE_TRUE = true;
    public static final Boolean BOOLEAN_VALUE_FALSE = false;
    public static final String  SUCCESS_VALUE = "resultBool";

    public static final String MESSAGE_INFO = "message";

}
