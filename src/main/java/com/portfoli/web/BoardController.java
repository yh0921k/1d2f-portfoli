package com.portfoli.web;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Board;
import com.portfoli.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

  static Logger logger = LogManager.getLogger(BoardController.class);

  public BoardController() {
    BoardController.logger.debug("NoticeController 객체 생성!");
  }

  @Autowired
  BoardService boardService;

  // 얘가 request Handler 메서드임
  @RequestMapping("/list")
  public String list(Model model) throws Exception{
    List<Board> boards = boardService.list();
    model.addAttribute("list", boards);
    return "/board/list.jsp";
  }

  @RequestMapping(value="form")
  public String form() throws Exception {
    return "/board/form.jsp";
  }

  @RequestMapping(value="add")
  public String add(String title, String content, int viewCount, String attachment) throws Exception {

    Board board = new Board();
    board.setContent(content);
    board.setTitle(title);
    board.setAttachment(attachment);
    System.out.println(board);

    boardService.add(board);
      return "redirect:list";
  }
  
  // 얘가 request Handler 메서드임
  @GetMapping("detail")
  public String detail(int number, Model model) throws Exception {
    Board board = boardService.get(number);
    System.out.println(number + "(!):" + board);
    model.addAttribute("board", board);
    return "/board/detail.jsp";
  }
  
  
  // 얘가 request Handler 메서드임
  @GetMapping("updateForm")
  public String updateForm(int number, Model model) throws Exception {
    model.addAttribute("board", boardService.get(number));
    return "/board/list";
  }

  // 얘가 request Handler 메서드임
//  @PostMapping("update")
//  public String update(Board board) throws Exception {
//    if(boardService.update(board))
//      return "redirect:list";
//    else
//      throw new Exception("수정할 게시물 정보가 유효하지 않습니다.");
//  }



}
