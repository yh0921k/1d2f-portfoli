package com.portfoli.web;

import java.util.List;
import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
  public String list(Map<String, Object> model) throws Exception{
    List<Board> boards = boardService.list();
    model.put("list", boards);
    return "/board/list.jsp";
  }

  @RequestMapping(method = RequestMethod.GET, value="/addForm")
  public String addForm() throws Exception {
    return "/board/addForm.jsp";
  }

  @RequestMapping(method = RequestMethod.POST, value="/addForm")
  public String addForm(String title, String content, int viewCount, String attachment) throws Exception {

    Board board = new Board();
    board.setContent(content);
    board.setTitle(title);
    board.setAttachment(attachment);
    System.out.println(board);

    if(boardService.add(board))
      return "redirect:list";
    else
      throw new Exception("추가할 게시물 정보가 유효하지 않습니다.");
  }



}
