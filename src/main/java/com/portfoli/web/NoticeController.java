package com.portfoli.web;

import java.io.File;
import java.sql.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
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
import com.portfoli.domain.Board;
import com.portfoli.domain.Notice;
import com.portfoli.domain.NoticeCategory;
import com.portfoli.service.BoardService;
import com.portfoli.service.NoticeCategoryService;
import com.portfoli.service.NoticeService;
import com.portfoli.service.PortfolioFileService;

@Controller
@RequestMapping("/notice")
public class NoticeController {

  static Logger logger = LogManager.getLogger(NoticeController.class);

  public NoticeController() {
    NoticeController.logger.debug("NoticeController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  PortfolioFileService portfolioFileService;
  
  @Autowired
  BoardService boardService;

  @Autowired
  NoticeService noticeService;

  @Autowired
  NoticeCategoryService noticeCategoryService;

  @RequestMapping("list")
  public void list(Model model) throws Exception {
    List<Notice> notices = noticeService.list();
    model.addAttribute("list", notices);
  }

  @RequestMapping("detail")
  public void detail(int number, Model model) throws Exception {
    Notice notice = noticeService.get(number);
    notice.setViewCount(notice.getViewCount()+1);
    NoticeCategory noticeCategory =noticeCategoryService.get(notice.getNoticeNumber());
    model.addAttribute("notice", notice);
    model.addAttribute("categoryName", noticeCategory.getName());
  }

  @GetMapping("form")
  public void form(Model model) throws Exception {
    model.addAttribute("list", noticeCategoryService.list());
  }

  @PostMapping("add")
  public String add(int noticeNumber, String title, String content, @RequestParam("attachment") MultipartFile attachment) throws Exception {
    Notice notice = new Notice();
    notice.setNoticeNumber(noticeNumber);
    notice.setTitle(title);
    notice.setContent(content);
    notice.setRegisteredDate(new Date(System.currentTimeMillis()));

    if (attachment.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/notice");
      String filename = UUID.randomUUID().toString();
      attachment.transferTo(new File(dirPath + "/" + filename));
      notice.setAttachment(filename);
    } else {
      notice.setAttachment(null);
    }

    Board board = new Board();
    board.setNumber(notice.getNumber());
    board.setTitle(notice.getTitle());
    board.setContent(notice.getContent());
    board.setAttachment(notice.getAttachment());
    board.setRegisteredDate(notice.getRegisteredDate());
    board.setViewCount(notice.getViewCount());

    boardService.add(board);
    notice.setNumber(board.getNumber());
    noticeService.insert(notice);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int number) throws Exception {
    if(noticeService.delete(number)) {
      portfolioFileService.delete(number);
      boardService.delete(number);
    return "redirect:list";
    } else
      throw new Exception("삭제중 오류발생");
  }

  @PostMapping("updateForm")
  public void updateForm(Notice notice, Model model) throws Exception {
    Notice item = noticeService.get(notice.getNumber());
    model.addAttribute("notice", item);
    model.addAttribute("list", noticeCategoryService.list());
    model.addAttribute("category", noticeCategoryService.get(item.getNoticeNumber()));
  }


  @PostMapping("update")
  public String update(Notice notice, MultipartFile file) throws Exception {

    if (file.getSize() > 0) {
      String dirPath = servletContext.getRealPath("/upload/notice");
      String filename = UUID.randomUUID().toString();

      logger.debug(dirPath + ":" + filename);
      file.transferTo(new File(dirPath + "/" + filename));
      notice.setAttachment(filename);
    }

    Board board = new Board();
    board.setNumber(notice.getNumber());
    board.setTitle(notice.getTitle());
    board.setContent(notice.getContent());
    board.setAttachment(notice.getAttachment());
    board.setRegisteredDate(notice.getRegisteredDate());
    board.setViewCount(notice.getViewCount());

    if(boardService.update(board)) {
      noticeService.update(notice);
      return "redirect:list";
    }else
      throw new Exception("업데이트에 실패했습니다.");
  }



}
