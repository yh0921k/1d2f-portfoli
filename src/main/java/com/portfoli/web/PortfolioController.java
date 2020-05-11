package com.portfoli.web;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.portfoli.domain.Board;
import com.portfoli.domain.BoardAttachment;
import com.portfoli.domain.GeneralMember;
import com.portfoli.domain.Pagination;
import com.portfoli.domain.Portfolio;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;
import com.portfoli.service.MemberService;
import com.portfoli.service.PortfolioService;

@Controller
@RequestMapping("/portfolio")
@MultipartConfig(maxFileSize = 100000000)
public class PortfolioController {
  final int pageSize = 10;
  static Logger logger = LogManager.getLogger(PortfolioController.class);

  public PortfolioController() {
    PortfolioController.logger.debug("NoticeController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  MemberService memberService;

  @Autowired
  BoardAttachmentService boardAttachmentService;

  @Autowired
  BoardService boardService;

  @Autowired
  PortfolioService portfolioService;

  @RequestMapping("list")
  public void list(@ModelAttribute("portfolio") Portfolio portfolio,
      @RequestParam(defaultValue="1") int curPage,
      HttpServletRequest request, Model model) throws Exception {

    // 전체리스트 개수
    int listCnt = portfolioService.selectListCnt(portfolio);

    Pagination pagination = new Pagination(listCnt, curPage);
    pagination.setPageSize(pageSize);// 한페이지에 노출할 게시글 수

    portfolio.setStartIndex(pagination.getStartIndex());
    portfolio.setPageSize(pagination.getPageSize());

    // 전체리스트 출력
    model.addAttribute("listCnt", listCnt);
    model.addAttribute("pagination", pagination);

    // 작성자 정보
    GeneralMember gmem = memberService.getGeneralMember(portfolio.getNumber());
    model.addAttribute("generalMember", gmem);

    List<Portfolio> portfolios = portfolioService.list();
    model.addAttribute("list", portfolios);
  }

  @RequestMapping("detail")
  public void detail(int number, Model model) throws Exception {
    Portfolio portfolio = portfolioService.get(number);
    Board board = boardService.get(number);
    List<BoardAttachment> boardAttachment = boardAttachmentService.get(number);

    board.setViewCount(board.getViewCount() + 1);
    boardService.update(board);

    model.addAttribute("portfolio", portfolio);
    model.addAttribute("attachment", boardAttachment);
  }



}