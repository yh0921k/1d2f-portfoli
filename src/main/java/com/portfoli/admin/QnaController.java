package com.portfoli.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.portfoli.domain.Member;
import com.portfoli.domain.Pagination;
import com.portfoli.domain.Qna;
import com.portfoli.service.BoardService;
import com.portfoli.service.MemberService;
import com.portfoli.service.QnaCategoryService;
import com.portfoli.service.QnaService;
import com.portfoli.service.UserMailSendService;

@Controller
@RequestMapping("qna")
public class QnaController {

  final int pageSize = 10;

  @Autowired
  ServletContext servletContext;

  @Autowired
  BoardService boardService;

  @Autowired
  QnaService qnaService;

  @Autowired
  MemberService memberService;

  @Autowired
  QnaCategoryService qnaCategoryService;

  @Autowired
  UserMailSendService mailsender;

  @GetMapping("list")
  public void list(Model model, @RequestParam(defaultValue = "1") int pageNumber) throws Exception {

    int listCnt = qnaService.selectListCnt();
    Pagination pagination = new Pagination(listCnt, pageNumber);
    pagination.setPageSize(pageSize);// 한페이지에 노출할 게시글 수

    List<Qna> qnas = qnaService.list(pagination.getCurPage(), pagination.getPageSize());

    for (Qna qna : qnas) {
      qna.setWriter(memberService.get(qna.getMemberNumber()).getName());
    }
    model.addAttribute("qnas", qnas);
    model.addAttribute("pageNumber", pagination.getCurPage());
    model.addAttribute("pageSize", pagination.getPageSize());
    model.addAttribute("totalPage", pagination.getPageCnt());
    model.addAttribute("startPage", pagination.getStartPage());
    model.addAttribute("endPage", pagination.getEndPage());
  }

  @GetMapping("detail")
  public ModelAndView detail(HttpServletRequest request, HttpServletResponse response, HttpSession session, int no) throws Exception {
    ModelAndView mv = new ModelAndView();
    Qna qna = qnaService.get(no);
    if (qna != null) {
      qna.setWriter(memberService.get(qna.getMemberNumber()).getName());
      mv.addObject("qna", qna);
    }
    return mv;
  }
  
  @GetMapping("delete")
  public String delete(int no) throws Exception {
    qnaService.delete(no);
    return "redirect:/admin/qna/list";
  }

  @PostMapping("reply")
  public String reply(HttpServletRequest request, int no, int emailNoti, int readable, String content, int writer) throws Exception {
    System.out.println(emailNoti);
    Map<String, Object> params = new HashMap<>();
    params.put("answer", content);
    params.put("no", no);
    if(emailNoti == 1) {
      Member m = memberService.get(writer);
      mailsender.sendQnaReply(m.getEmail(), m.getName(), content);
    }
    qnaService.addReply(params);
    return "redirect:/admin/qna/list";
  }

}
