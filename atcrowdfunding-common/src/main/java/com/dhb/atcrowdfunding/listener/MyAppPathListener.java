package com.dhb.atcrowdfunding.listener;

import com.dhb.atcrowdfunding.util.Const;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.jsp.PageContext;

/**
 * @ClassName: MyAppPathListener
 * @Description:
 *              自定义一个监听器，当servletContext应用上下文（域对象）
 *              初始话的时候，将pageContext.request.contextPath()
 *              设置到域对象中，然后在该应用中都可以获取它。
 * @Author: dong_hb
 * @Date: 2020/5/18 9:25 下午
 * @Version 1.0
 */
public class MyAppPathListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ////  URL　=>　　http://localhost:8080/atcrowdfunding-main/index.jsp
        //http:协议
        //localhost:ip
        //8080：端口号。
        ///atcrowdfunding-main 项目上下文
        //uri:/index.jsp
        ServletContext servletContext = servletContextEvent.getServletContext();
        //使用常量解决魔法值。
        servletContext.setAttribute(Const.APP_PATH, servletContext.getContextPath());
//      System.out.println(servletContext.getAttribute(Const.APP_PATH));
//      System.out.println("........");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
