package com.portfoli.web;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.Board;
import com.portfoli.domain.BoardAttachment;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;

@Controller
@RequestMapping("/board")
@MultipartConfig(maxFileSize = 1000000)
public class BoardController {

  static Logger logger = LogManager.getLogger(BoardController.class);

  public BoardController() {
    logger.debug("NoticeController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;
  
  @Autowired
  BoardService boardService;
  
  @Autowired
  BoardAttachmentService boardAttachmentService;

  @RequestMapping("list")
  public void list(Model model) throws Exception{
    List<Board> boards = boardService.list();
    List<BoardAttachment> boardAttachment = boardAttachmentService.list();
    model.addAttribute("list", boards);
    model.addAttribute("attachment", boardAttachment);
  }

  @RequestMapping("form")
  public void form() throws Exception {}

  @RequestMapping("add")
  public String add(BoardAttachment boardAttachment, String title, String content, int viewCount,
      String attachment, MultipartFile[] filePaths) throws Exception {

    Board board = new Board();
    board.setContent(content);
    board.setTitle(title);
    boardService.add(board);
    
    String dirPath = servletContext.getRealPath("/upload/boardAttachment");
    
    for(MultipartFile filePath : filePaths) {
      if(filePath.getSize() <= 0) {
        continue;
      }
      String filename = String.format("$s___%s",
          UUID.randomUUID().toString(), filePath.getOriginalFilename());
      
      boardAttachment.setFilePath(dirPath + "/" + filename);
      boardAttachment.setFileName(filename);
      
      filePath.transferTo(new File(dirPath + "/" + filename));
      boardAttachmentService.add(boardAttachment);
    }
    
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(int number, Model model) throws Exception {
    Board board = boardService.get(number);
    List<BoardAttachment> lists = boardAttachmentService.get(number);

    model.addAttribute("board", board);
    model.addAttribute("list", lists);
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