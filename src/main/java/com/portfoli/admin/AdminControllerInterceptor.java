package com.portfoli.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.portfoli.domain.Admin;

public class AdminControllerInterceptor implements HandlerInterceptor {

  static Logger logger = LogManager.getLogger("runMode");
  final static int EXPIRETIME = 30;

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
      throws Exception {
    System.out.println("AdminControllerInterceptor.preHandle()");
    request.getSession().setAttribute("expire", EXPIRETIME);
    request.getSession().setMaxInactiveInterval(EXPIRETIME);
    return true;
  }

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    String user = null;
    String date = null;
    String ipAddr = null;
    String url = null;
    try {
      System.out.println("AdminControllerInterceptor.postHandle()");
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
      date = dateFormat.format(new Date());
      ipAddr = (null != request.getHeader("X-FORWARDED-FOR")) ? request.getHeader("X-FORWARDED-FOR")
          : request.getRemoteAddr();
      url = request.getContextPath() + "/" + modelAndView.getViewName();
      user = ((Admin) request.getSession().getAttribute("admin")).getId();
      logger.info(String.format("[%s]:%s > %15s:%s", date, ipAddr, user, url));
    } catch (Exception e) {
      if (user == null)
        user = "default";
      logger.info(String.format("[%s]:%s > %15s:%s", date, ipAddr, user, url));
    }
  }

  @Override
  public void afterCompletion(HttpServletRequest request, HttpServletResponse response,
      Object handler, Exception ex) throws Exception {
    System.out.println("AdminControllerInterceptor.afterCompletion()");

  }
}
