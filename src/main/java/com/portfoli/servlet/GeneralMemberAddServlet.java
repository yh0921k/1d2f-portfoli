package com.portfoli.servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Member;
import com.portfoli.service.GeneralMemberService;

@WebServlet("/generalMember/join")
public class GeneralMemberAddServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      response.setContentType("text/html;charset=UTF-8");
      request.getRequestDispatcher("/member/generalMemberForm.jsp").include(request, response);

    } catch (Exception e) {
      throw new ServletException(e);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html;charset=UTF-8");

      ServletContext servletContext = request.getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");

      GeneralMemberService generalMemberService = iocContainer.getBean(GeneralMemberService.class);
      Member member = new Member();
      GeneralMember generalMember = new GeneralMember();

      member.setId(request.getParameter("id"));
      member.setName(request.getParameter("name"));
      member.setEmail(request.getParameter("email"));
      member.setPassword(request.getParameter("password"));
      member.setTel(request.getParameter("tel"));
      member.setSmsYN(Integer.parseInt(request.getParameter("smsYN")));
      member.setEmailYN(Integer.parseInt(request.getParameter("emailYN")));

      // generalMember.setPhotoFilePath(request.getParameter("photoFilePath"));
      // generalMember.setMembereship("none");
      // generalMember.setSeekingFlag(1);
      generalMember.setCareer(Integer.parseInt(request.getParameter("career")));

      if (generalMemberService.add(member, generalMember) > 0) {
        response.sendRedirect("../index.html");
      } else {
        throw new Exception("회원을 추가할 수 없습니다.");
      }

    } catch (Exception e) {
      request.setAttribute("error", e);
      request.setAttribute("url", "join");
      request.getRequestDispatcher("/error").forward(request, response);
    }
  }
}
