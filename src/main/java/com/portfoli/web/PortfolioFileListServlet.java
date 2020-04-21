package com.portfoli.web;

import java.io.IOException;
import java.util.Collection;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.springframework.context.ApplicationContext;
import com.portfoli.domain.PortfolioFile;
import com.portfoli.service.PortfolioFileService;

// Controller로 수정예정

@WebServlet("/portfolioFile/add")
@MultipartConfig(maxFileSize = 10000000)
public class PortfolioFileListServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html;charset=UTF-8");
    request.getRequestDispatcher("addForm.jsp").include(request, response);
  }


  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {

    String filename = "";

    try {
      request.setCharacterEncoding("UTF-8");

      ServletContext servletContext = request.getServletContext();
      ApplicationContext iocContainer = (ApplicationContext) servletContext.getAttribute("iocContainer");

      PortfolioFileService portfolioFileService= iocContainer.getBean(PortfolioFileService.class);
      PortfolioFile portfolioFile = new PortfolioFile();

      portfolioFile.setBoardNumber(Integer.parseInt(request.getParameter("boardNumber")));

      Collection<Part> parts = request.getParts();
      for (Part part : parts) {
        if(!part.getName().equals("filePath") || part.getSize()<=0) {
          continue;
        }

        if(part.getSize() > 0) {
          String dirPath = getServletContext().getRealPath("/upload/portfoliofile");
          filename = UUID.randomUUID().toString();

          part.write(dirPath + "/" + filename); // 여기서 문제 발생
          portfolioFile.setFileName(filename);
          portfolioFile.setFilePath(dirPath);

          System.out.println("dirPath : " + dirPath);
          System.out.println("filename : " + filename);

          portfolioFileService.add(portfolioFile);
        }
      }

      response.setContentType("text/html;charset=UTF-8");
      request.getSession().setAttribute("filename", filename);
      request.getRequestDispatcher("addResult.jsp").include(request, response);

    } catch (Exception e) {
      throw new ServletException(e);
    }


  }
}
