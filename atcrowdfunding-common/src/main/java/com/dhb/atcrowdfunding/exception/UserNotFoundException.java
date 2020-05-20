package com.dhb.atcrowdfunding.exception;

/**
 * @ClassName: UserNotFoundException
 * @Description:
 * @Author: dong_hb
 * @Date: 2020/5/19 9:27 上午
 * @Version 1.0
 */
public class UserNotFoundException extends RuntimeException{

    public UserNotFoundException(){
        super();
    }

    public UserNotFoundException(String message){
        super(message);
    }
}
