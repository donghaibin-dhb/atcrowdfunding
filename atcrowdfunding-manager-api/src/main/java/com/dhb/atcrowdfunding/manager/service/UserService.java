package com.dhb.atcrowdfunding.manager.service;

import com.dhb.atcrowdfunding.bean.User;

import java.util.List;

public interface UserService {
    
    /* *
     * @Author: dong_hb
     * @Description: 根据用户名查询用户信息：
     * @Date: 9:14 上午 2020/5/19
     * @Param [user]
     * @return com.dhb.atcrowdfunding.bean.User
     */
    User queryUserByLoginAcct(User user);


    /**查询用户列表*/
    List<User> findUserList(String condition);

    /**新增管理员*/
    Integer addUser(User user);

    /**删除用户信息*/
    Integer deleteUserById(Integer id);

    /**批量删除用户：*/
    Integer deleteBatchWithUser(List<Integer> ids);
}
