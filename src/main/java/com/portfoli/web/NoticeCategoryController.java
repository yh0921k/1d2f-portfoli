package com.portfoli.web;

import java.util.List;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.NoticeCategory;
import com.portfoli.service.NoticeCategoryService;
import com.portfoli.service.NoticeService;

@Controller
@RequestMapping("/notice/category")
public class NoticeCategoryController {
  
  static Logger logger = LogManager.getLogger(NoticeCategoryController.class);

  public NoticeCategoryController() {
    NoticeCategoryController.logger.debug("NoticeCategoryController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  NoticeService noticeService;

  @Autowired
  NoticeCategoryService noticeCategoryService;

  @RequestMapping("list")
  public void list(Model model) throws Exception {
    List<NoticeCategory> categories = noticeCategoryService.list();

    model.addAttribute("list", categories);
  }

  @RequestMapping("detail")
  public void detail(int number, Model model) throws Exception {
    NoticeCategory noticeCategory = noticeCategoryService.get(number);
    model.addAttribute("category", noticeCategory);
  }

  @GetMapping("form")
  public void form() throws Exception {}

  @PostMapping("add")
  public String add(NoticeCategory noticeCategory) throws Exception {
    noticeCategoryService.insert(noticeCategory);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int categoryNumber) throws Exception {
    try {
    NoticeCategory noticeCategory = noticeCategoryService.get(categoryNumber);
    noticeCategoryService.delete(categoryNumber);
    logger.debug(String.format("게시물 분류 삭제: [%d번] %s", categoryNumber, noticeCategory.getName()));
    return "redirect:list";
    } catch(Exception e) {
      throw new IllegalStateException("해당 분류번호의 게시물이 있어 삭제할 수 없습니다.");
    }
  }
  @PostMapping("updateForm")
  public void updateForm(NoticeCategory noticeCategory, Model model) throws Exception {
    NoticeCategory item = noticeCategoryService.get(noticeCategory.getCategoryNumber());
    model.addAttribute("category", item);
  }


  @PostMapping("update")
  public String update(NoticeCategory noticeCategory) throws Exception {
    noticeCategoryService.update(noticeCategory);
    return "redirect:list";
  }



}
