package com.dhb.atcrowdfunding.manager.service;

import com.dhb.atcrowdfunding.bean.User;

public interface UserService {
    
    /* *
     * @Author: dong_hb
     * @Description: 根据用户名查询用户信息：
     * @Date: 9:14 上午 2020/5/19
     * @Param [user]
     * @return com.dhb.atcrowdfunding.bean.User
     */
    User queryUserByLoginAcct(User user);



}
