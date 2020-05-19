package com.portfoli.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.BoardAttachment;
import com.portfoli.domain.Member;
import com.portfoli.domain.Report;
import com.portfoli.service.MemberService;
import com.portfoli.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {
  static Logger logger = LogManager.getLogger(ReportController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  ReportService reportService;

  @Autowired
  MemberService memberService;

  @GetMapping("form")
  public void form(HttpServletRequest request, @RequestParam("number") int targetNumber, Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);
    model.addAttribute("target", memberService.get(targetNumber));
    model.addAttribute("categories", reportService.reportCategorie());
  }

  @PostMapping("add")
  public void add(Report report, @RequestParam("files[]") MultipartFile[] files) throws Exception {
    ArrayList<BoardAttachment> attachments = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/report");
    for (MultipartFile file : files) {
      if (file.getSize() > 0) {
        BoardAttachment attachment = new BoardAttachment();
        String fileName =
            String.format("%d_%s", System.currentTimeMillis(), file.getOriginalFilename());

        attachment.setFileName(file.getOriginalFilename());
        attachment.setFilePath(fileName);

        file.transferTo(new File(dirPath + "/" + fileName));

        attachments.add(attachment);
      }
    }

    report.setAttachments(attachments);

    reportService.add(report);
  }

  @GetMapping("list")
  public void list(
      HttpServletRequest request,
      @RequestParam(defaultValue = "1") int pageNumber,
      @RequestParam(defaultValue = "5") int pageSize,
      Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");

    List<Report> list =
        reportService.list(loginUser.getNumber(), pageNumber, pageSize);

    int size = reportService.listCount(loginUser.getNumber());
    int totalPage = size / pageSize;
    if (size % pageSize > 0) {
      totalPage++;
    }

    if (pageNumber < 1 || pageNumber > totalPage) {
      pageNumber = 1;
    }

    int endPage = (int) Math.ceil(pageNumber / (double) pageSize) * pageSize;
    int startPage = endPage - pageSize + 1;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    model.addAttribute("list", list);
    model.addAttribute("pageNumber", pageNumber);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("startPage", startPage);
    model.addAttribute("endPage", endPage);
  }
}