package com.dhb.atcrowdfunding.exception;

/**
 * @ClassName: PasswordErrorException
 * @Description:
 * @Author: dong_hb
 * @Date: 2020/5/19 9:32 上午
 * @Version 1.0
 */
public class PasswordErrorException extends RuntimeException{

    public PasswordErrorException() {
        super();
    }

    public PasswordErrorException(String message) {
        super(message);
    }
}
