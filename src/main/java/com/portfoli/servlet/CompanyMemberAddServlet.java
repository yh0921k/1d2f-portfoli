package com.portfoli.servlet;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import com.portfoli.domain.Company;
import com.portfoli.domain.CompanyMember;
import com.portfoli.service.CompanyMemberService;

@WebServlet("/companyMember/join")
public class CompanyMemberAddServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    request.getRequestDispatcher("/companyMember/JoinForm.jsp").include(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    try {
      request.setCharacterEncoding("UTF-8");

      ServletContext servletContext = getServletContext();
      ApplicationContext iocContainer =
          (ApplicationContext) servletContext.getAttribute("iocContainer");

      CompanyMemberService companyMemberService = iocContainer.getBean(CompanyMemberService.class);

      Company company = new Company();
      company.setBusinessRegistrationNumber(request.getParameter("businessRegistrationNumber"));
      company.setName(request.getParameter("companyName"));
      company.setTel(request.getParameter("companyTel"));

      CompanyMember companyMember = new CompanyMember();
      companyMember.setPosition(request.getParameter("position"));
      companyMember.setId(request.getParameter("id"));
      companyMember.setName(request.getParameter("name"));
      companyMember.setEmail(request.getParameter("email"));
      companyMember.setPassword(request.getParameter("password"));
      companyMember.setTel(request.getParameter("tel"));
      companyMember.setSmsYN(Integer.parseInt(request.getParameter("smsYN")));
      companyMember.setEmailYN(Integer.parseInt(request.getParameter("emailYN")));
      companyMember.setCompany(company);

      companyMemberService.add(companyMember);

      response.sendRedirect("JoinResult.jsp");

    } catch (Exception e) {
      request.setAttribute("error", e);
      request.setAttribute("url", "list");
    }
  }
}