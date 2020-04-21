package com.portfoli.web;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Notice;
import com.portfoli.service.BoardService;
import com.portfoli.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

  static Logger logger = LogManager.getLogger(NoticeController.class);

  public NoticeController() {
    NoticeController.logger.debug("NoticeController 객체 생성!");
  }

  @Autowired
  BoardService boardService;

  @Autowired
  NoticeService noticeService;

  @RequestMapping("list")
  public void list(Model model) throws Exception {
    List<Notice> notices = noticeService.list();
    model.addAttribute("list", notices);
  }

  @RequestMapping("detail")
  public void detail(int number, Model model) throws Exception {
    Notice notice = noticeService.get(number);
    model.addAttribute("notice", notice);
  }

  

}
