package com.dhb.atcrowdfunding.manager.mapper;

import com.dhb.atcrowdfunding.bean.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);

    List<User> selectAll();

    int updateByPrimaryKey(User record);
    /* *
     * @Author: dong_hb
     * @Description: 根据用户名查询用户是否存在。
     * @Date: 9:34 上午 2020/5/19
     * @Param [user]
     * @return com.dhb.atcrowdfunding.bean.User
     */
    User queryUserByLoginAcct(User user);
}