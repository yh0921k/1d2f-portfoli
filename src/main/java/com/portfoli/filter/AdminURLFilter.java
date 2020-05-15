package com.portfoli.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebFilter("/admin")
public class AdminURLFilter implements Filter {

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {

    HttpServletRequest httpRequest = (HttpServletRequest) request;
    HttpServletResponse httpResponse = (HttpServletResponse) response;

    String requestURI = httpRequest.getRequestURI();
    String adminBaseURI = httpRequest.getContextPath() + httpRequest.getServletPath();

    System.out.println(requestURI);
    System.out.println(adminBaseURI);
    if (requestURI.equals(adminBaseURI) || requestURI.equals(adminBaseURI + "/")) {
      if (httpRequest.getSession().getAttribute("admin") == null) {
        httpResponse.sendRedirect(adminBaseURI + "/auth/loginForm");
        return;
      } else {
        httpResponse.sendRedirect(adminBaseURI + "/auth/index");
        return;
      }
    }
    chain.doFilter(request, response);
  }
}
