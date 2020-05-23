package com.portfoli.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
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

  @GetMapping("detail")
  public ModelAndView detail(HttpServletRequest request, HttpServletResponse response, int number)
      throws Exception {
    Map<String, Object> params = new HashMap<>();
    ModelAndView mv = new ModelAndView();
    Report report = reportService.get(number);

    Cookie[] cookies = request.getCookies();
    Cookie viewCookie = null;

    if (cookies != null && cookies.length > 0) {
      for (int i = 0; i < cookies.length; i++) {
        if (cookies[i].getName().contentEquals("cookie" + number)) {
          viewCookie = cookies[i];
        }
      }
    }

    if (report != null) {
      report.setMember(memberService.get(report.getTargetNumber()));
      mv.addObject("report", report);

      if (viewCookie == null) {
        Cookie newCookie = new Cookie("cookie" + number, "|" + number + "|");
        response.addCookie(newCookie);

        params.put("viewCount", report.getViewCount() + 1);
        params.put("boardNo", number);
        boardService.addViewCount(params);
      }
    }

    return mv;
  }
}