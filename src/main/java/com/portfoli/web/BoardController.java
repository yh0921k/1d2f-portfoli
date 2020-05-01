package com.portfoli.web;

import java.util.List;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.portfoli.domain.Board;
import com.portfoli.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

  static Logger logger = LogManager.getLogger(BoardController.class);

  public BoardController() {
    logger.debug("NoticeController 객체 생성!");
  }

  @Autowired
  BoardService boardService;

  @RequestMapping("list")
  public void list(Model model) throws Exception{
    List<Board> boards = boardService.list();
    model.addAttribute("list", boards);
  }

  @RequestMapping("form")
  public void form() throws Exception {}

  @RequestMapping("add")
  public String add(String title, String content, int viewCount, String attachment) throws Exception {

    Board board = new Board();
    board.setContent(content);
    board.setTitle(title);
    board.setAttachment(attachment);

    boardService.add(board);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(int number, Model model) throws Exception {
    Board board = boardService.get(number);
    model.addAttribute("board", board);
  }

  @GetMapping("delete")
  public String delete(int number) throws Exception {
    System.out.println(number);
    if(boardService.delete(number)) {
      System.out.println(number);
      return "redirect:list";
    }
    else
      throw new Exception("삭제할 게시물 정보가 유효하지 않습니다.");
  }


  @PostMapping("updateForm")
  public String updateForm(Board board) throws Exception {
    if(boardService.update(board))
      return "redirect:list";
    else
      throw new Exception("수정할 게시물 정보가 유효하지 않습니다.");
  }




}