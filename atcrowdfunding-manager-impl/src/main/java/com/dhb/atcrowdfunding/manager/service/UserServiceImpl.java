package com.dhb.atcrowdfunding.manager.service;

import com.dhb.atcrowdfunding.bean.User;
import com.dhb.atcrowdfunding.exception.PasswordErrorException;
import com.dhb.atcrowdfunding.exception.UserNotFoundException;
import com.dhb.atcrowdfunding.manager.mapper.UserMapper;
import com.dhb.atcrowdfunding.util.Const;
import com.dhb.atcrowdfunding.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName: UserServiceImpl
 * @Description:
 * @Author: dong_hb
 * @Date: 2020/5/18 11:22 下午
 * @Version 1.0
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /* *
     * @Author: dong_hb
     * @Description: 根据用户名查询用户
     * @Date: 9:22 上午 2020/5/19
     * @Param [user]
     * @return com.dhb.atcrowdfunding.bean.User
     */
    @Override
    public User queryUserByLoginAcct(User user) {

        User userResult = userMapper.queryUserByLoginAcct(user);
        //用户名不存在：自定义一个异常：
        if (userResult == null) {
            throw new UserNotFoundException(Const.LOGIN_LOGINACCT_ERROR);
        }
        //比较此时查询的密码和从前台的密码，进行比较，如果一致，登录成功，否则密码错误。
        if (!userResult.getUserpswd().equals(MD5Util.digest(user.getUserpswd()))) {
            throw new PasswordErrorException(Const.LOGIN_USERPSWD_ERROR);
        }
        return userResult;
    }
}
