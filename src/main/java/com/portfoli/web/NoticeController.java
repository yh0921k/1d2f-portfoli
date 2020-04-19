package com.portfoli.web;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.portfoli.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

  static Logger logger = LogManager.getLogger(NoticeController.class);

  public NoticeController() {
    NoticeController.logger.debug("NoticeController 객체 생성!");
  }

  //  @Autowired
  //  BoardService boardService;
  @Autowired
  NoticeService noticeService;

  @RequestMapping("/main")
  public String notice() throws Exception {
    return "/notice/main.jsp";
  }

  @RequestMapping(method = RequestMethod.GET, value="/addForm")
  public String addForm() {
    return "/notice/addForm.jsp";
  }

  @RequestMapping(method = RequestMethod.POST, value="/addForm")
  public String addForm2() {
    //    boardService.add("d");
    //    noticeService.add(notice);
    return "/notice/addForm.jsp";
  }


}
