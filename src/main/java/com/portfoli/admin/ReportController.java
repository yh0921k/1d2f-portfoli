package com.portfoli.admin;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.portfoli.domain.Report;
import com.portfoli.service.BoardService;
import com.portfoli.service.MemberService;
import com.portfoli.service.ReportService;

@Controller
@RequestMapping("/report")
public class ReportController {
  static Logger logger = LogManager.getLogger(ReportController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  BoardService boardService;

  @Autowired
  ReportService reportService;

  @Autowired
  MemberService memberService;

  @GetMapping("list")
  public void list(
      HttpServletRequest request,
      @RequestParam(defaultValue = "1") int pageNumber,
      @RequestParam(defaultValue = "10") int pageSize,
      Model model) throws Exception {
    List<Report> list = reportService.adminList(pageNumber, pageSize);
    for (Report report : list) {
      report.setMember(memberService.get(report.getReporterNumber()));
    }

    int size = reportService.adminListCount();
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