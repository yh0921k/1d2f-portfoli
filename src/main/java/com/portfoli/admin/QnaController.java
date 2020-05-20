package com.portfoli.admin;

import java.util.List;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.portfoli.domain.Pagination;
import com.portfoli.domain.Qna;
import com.portfoli.service.BoardService;
import com.portfoli.service.MemberService;
import com.portfoli.service.QnaCategoryService;
import com.portfoli.service.QnaService;
import com.portfoli.service.UserMailSendService;

@Controller
@RequestMapping("adQna")
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
  
}
