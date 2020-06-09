package com.portfoli.web;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;
import com.portfoli.dao.VisitorDao;
import com.portfoli.domain.Visitor;

@WebListener
public class VisitCounter implements HttpSessionListener {
  @Override
  public void sessionCreated(HttpSessionEvent arg0) {
    HttpSession session = arg0.getSession();
    WebApplicationContext wac =
        WebApplicationContextUtils.getRequiredWebApplicationContext(session.getServletContext());

    HttpServletRequest request =
        ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();

    VisitorDao visitorDao = (VisitorDao) wac.getBean("visitorDao");

    Visitor visitor = new Visitor();
    visitor.setVisitIp(request.getRemoteAddr());
    visitor.setVisitAgent(request.getHeader("User-Agent"));
    visitor.setVisitRefer(request.getHeader("referer"));
    visitorDao.insert(visitor);
  }

  @Override
  public void sessionDestroyed(HttpSessionEvent arg0) {
  }
}