package com.portfoli.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class AdminAuthInterceptor implements HandlerInterceptor {

  @Override
  public boolean preHandle(final HttpServletRequest request, final HttpServletResponse response,
      final Object handler) throws Exception {
    System.out.println("AdminAuthInterceptor.preHandle()");
    if (request.getSession().getAttribute("admin") == null) {
      response
          .sendRedirect(request.getContextPath() + request.getServletPath() + "/auth/loginForm");
      return false;
    }
    return true;
  }
}
