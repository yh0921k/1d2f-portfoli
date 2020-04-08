package com.portfoli.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
  protected void doGet(HttpServletRequest reqeust, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<meta charset='UTF-8'>");
      out.println("<title>회원 등록</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>회원 등록</h1>");
      out.println("<form action='join' method='post'>");
      out.println("아이디: <input name='id' type='text'><br>\n");
      out.println("이름: <input name='name' type='text'><br>\n");
      out.println("이메일: <input name='email' type='email'><br>\n");
      out.println("암호: <input name='password' type='password'><br>\n");
      out.println("전화번호: <input name='tel' type='text'><br>\n");
      out.println("경력: <input name='career' type='number'><br>\n");
      out.println("<label><input type='radio' name='smsYN' value='1' checked>SMS 수신동의</label>");
      out.println("<label><input type='radio' name='smsYN' value='2'>SMS 수신거부</label><br>");
      out.println("<label><input type='radio' name='emailYN' value='1' checked>이메일 수신동의</label>");
      out.println("<label><input type='radio' name='emailYN' value='2'>이메일 수신거부</label><br>");
      out.println("<button>제출</button>");
      out.println("</form>");
      out.println("</body>");
      out.println("</html>");

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
      PrintWriter out = response.getWriter();

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

      generalMemberService.add(member, generalMember);

      out.println("<!DOCTYPE html>");
      out.println("<html>");
      out.println("<head>");
      out.println("<meta charset='UTF-8'>");
      out.println("<meta http-equiv='refresh' content='2;url=list'>");
      out.println("<title>회원 등록</title>");
      out.println("</head>");
      out.println("<body>");
      out.println("<h1>회원 등록 결과</h1>");
      out.println("<p>새 회원을 등록했습니다.</p>");
      out.println("</body>");
      out.println("</html>");
    } catch (Exception e) {
      throw new ServletException(e);
    }
  }
}
