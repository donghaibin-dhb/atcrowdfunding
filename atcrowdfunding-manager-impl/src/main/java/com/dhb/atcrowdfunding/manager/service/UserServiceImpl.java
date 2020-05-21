package com.dhb.atcrowdfunding.manager.service;

import com.dhb.atcrowdfunding.bean.User;
import com.dhb.atcrowdfunding.exception.PasswordErrorException;
import com.dhb.atcrowdfunding.exception.UserNotFoundException;
import com.dhb.atcrowdfunding.manager.mapper.UserMapper;
import com.dhb.atcrowdfunding.util.Const;
import com.dhb.atcrowdfunding.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    /* *
     * @Author: dong_hb
     * @Description: 查询用户列表
     * @Date: 10:22 上午 2020/5/21
     * @Param []
     * @return java.util.List<com.dhb.atcrowdfunding.bean.User>
     */
    @Override
    public List<User> findUserList(String condition) {
        List<User> users = userMapper.selectAll(condition);
        return users;
    }
    
    /* *
     * @Author: dong_hb
     * @Description: 新增用户管理员
     * @Date: 4:21 下午 2020/5/21
     * @Param [user]
     * @return java.lang.Integer
     */
    @Override
    public Integer addUser(User user) {
        user.setUserpswd(MD5Util.digest("123456"));
        return userMapper.insert(user);
    }

    /* *
     * @Author: dong_hb
     * @Description: 删除用户信息
     * @Date: 5:32 下午 2020/5/21
     * @Param [id]
     * @return java.lang.Integer
     */
    @Override
    public Integer deleteUserById(Integer id) {
        return userMapper.deleteByPrimaryKey(id);
    }

    /* *
     * @Author: dong_hb
     * @Description: 批量删除用户
     * @Date: 8:40 下午 2020/5/21
     * @Param [ids]
     * @return java.lang.Integer
     */
    @Override
    public Integer deleteBatchWithUser(List<Integer> ids) {
        return userMapper.deleteBatchWithUser(ids);
    }
}
