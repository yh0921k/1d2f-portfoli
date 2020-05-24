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
import com.portfoli.domain.Member;
import com.portfoli.domain.Pagination;
import com.portfoli.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

  static Logger logger = LogManager.getLogger(MemberController.class);

  public MemberController() {
    MemberController.logger.debug("MemeberController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  MemberService memberService;

  @GetMapping("list")
  public void list(String regisDate, @RequestParam(defaultValue = "10") int moreLine, @RequestParam(defaultValue = "1") int pageNumber, HttpServletRequest request, Model model) throws Exception {
    int listCnt = memberService.selectListCnt();
    Pagination pagination = new Pagination(listCnt, pageNumber);
    pagination.setPageSize(moreLine);
    List<Member> members = memberService.list(regisDate, pagination.getCurPage(), pagination.getPageSize());
    
    model.addAttribute("moreLine", moreLine);
    model.addAttribute("members", members);
  }


  @GetMapping("moreContents")
  public void moreContents(String regisDate, @RequestParam(defaultValue = "10") int moreLine, @RequestParam(defaultValue = "1") int pageNumber, HttpServletRequest request, Model model) throws Exception {
    int listCnt = memberService.selectListCnt();
    Pagination pagination = new Pagination(listCnt, pageNumber);
    pagination.setPageSize(moreLine);
    List<Member> members = memberService.list(regisDate, pagination.getCurPage(), pagination.getPageSize());
    
    for(Member m : members ) {
      System.out.println(m);
    }
    model.addAttribute("moreLine", moreLine);
    model.addAttribute("members", members);
  }
}
