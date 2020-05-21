package com.dhb.atcrowdfunding;

import org.apache.poi.ss.formula.functions.T;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName: BaseController
 * @Description: 对重复的代码进行封装，但是要注意线程的安全问题。
 * @Author: dong_hb
 * @Date: 2020/5/20 5:07 下午
 * @Version 1.0
 */
public class BaseController {

    /**一个线程过来就会创建一个线程，避免线程安全的还是多实例。*/
    ThreadLocal<Map<String,Object>> threadLocal = new ThreadLocal<Map<String,Object>>();

    /**设置布尔类型的状态值到map中*/
    protected void successMethod(String successKey,Boolean successVal){
        /**将共享的数据放到局部方法中，防止线程安全问题*/
        Map<String,Object> resultMap = new HashMap<String, Object>();
        threadLocal.set(resultMap);
        threadLocal.get().put(successKey,successVal);
    }

    /**设置消息的信息到map中：*/
    protected void messageMethod(String messageInfo,String messageVal){
        threadLocal.get().put(messageInfo,messageVal);
    }

    /**将将查询到的数据放置到map中*/
    protected void addListData2Map(Object object){
        threadLocal.get().put("data",object);
    }


    /**返回map的值：*/
    protected Map<String,Object> getResultMap(){
        return threadLocal.get();
    }

}
