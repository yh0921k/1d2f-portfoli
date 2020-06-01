package com.portfoli.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import com.portfoli.domain.Member;

public class ControllerInterceptor implements HandlerInterceptor {

  static Logger logger = LogManager.getLogger("runMode");

  @Override
  public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
      ModelAndView modelAndView) throws Exception {
    String user = null;
    String date = null;
    String ipAddr = null;
    String url = null;
    try {
      System.out.println("ControllerInterceptor.postHandle()");
      SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd-HHmmss");
      date = dateFormat.format(new Date());
      ipAddr = (null != request.getHeader("X-FORWARDED-FOR")) ? request.getHeader("X-FORWARDED-FOR")
          : request.getRemoteAddr();
      url = request.getContextPath() + "/app/" + modelAndView.getViewName();
      user = ((Member) request.getSession().getAttribute("loginUser")).getId();
      logger.info(String.format("[%s]:%s > %15s:%s", date, ipAddr, user, url));
    } catch (Exception e) {
      if (user == null) {
        user = "default";
      }
      logger.info(String.format("[%s]:%s > %15s:%s", date, ipAddr, user, url));
    }
  }
}
