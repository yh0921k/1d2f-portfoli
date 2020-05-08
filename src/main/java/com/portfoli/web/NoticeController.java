package com.portfoli.web;

import java.io.File;
import java.sql.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.Board;
import com.portfoli.domain.BoardAttachment;
import com.portfoli.domain.Notice;
import com.portfoli.domain.NoticeCategory;
import com.portfoli.domain.Pagination;
import com.portfoli.service.BoardAttachmentService;
import com.portfoli.service.BoardService;
import com.portfoli.service.NoticeCategoryService;
import com.portfoli.service.NoticeService;

@Controller
@RequestMapping("/notice")
@MultipartConfig(maxFileSize = 100000000)
public class NoticeController {

  static Logger logger = LogManager.getLogger(NoticeController.class);

  public NoticeController() {
    NoticeController.logger.debug("NoticeController 객체 생성!");
  }

  @Autowired
  ServletContext servletContext;

  @Autowired
  BoardAttachmentService boardAttachmentService;

  @Autowired
  BoardService boardService;

  @Autowired
  NoticeService noticeService;

  @Autowired
  NoticeCategoryService noticeCategoryService;

  @RequestMapping("list")
  public void list(@ModelAttribute("notice") Notice notice,
      @RequestParam(defaultValue="1") int curPage,
      HttpServletRequest request, Model model) throws Exception {

    // 전체리스트 개수
    int listCnt = noticeService.selectListCnt(notice);

    Pagination pagination = new Pagination(listCnt, curPage);
    pagination.setPageSize(10);// 한페이지에 노출할 게시글 수
    
    notice.setStartIndex(pagination.getStartIndex());
    notice.setCntPerPage(pagination.getPageSize());
    
    // 전체리스트 출력
    model.addAttribute("listCnt", listCnt);
    model.addAttribute("pagination", pagination);
    
    List<Notice> notices = noticeService.list(notice);
    model.addAttribute("list", notices);
  }

  @RequestMapping("detail")
  public void detail(int number, Model model) throws Exception {
    Notice notice = noticeService.get(number);
    Board board = boardService.get(number);
    List<BoardAttachment> boardAttachment = boardAttachmentService.get(number);

    board.setViewCount(board.getViewCount() + 1);
    boardService.update(board);

    NoticeCategory noticeCategory = noticeCategoryService.get(notice.getCategoryNumber());

    model.addAttribute("notice", notice);
    model.addAttribute("categoryName", noticeCategory.getName());
    model.addAttribute("attachment", boardAttachment);
  }

  @GetMapping("form")
  public void form(Model model) throws Exception {
    model.addAttribute("list", noticeCategoryService.list());
  }

  @PostMapping("add")
  @Transactional
  public String add(int noticeNumber, String title, String content,
      @RequestParam("files") MultipartFile[] files) throws Exception {

    // Board객체 추가(pf_board)
    Board board = new Board();
    board.setTitle(title);
    board.setContent(content);
    board.setRegisteredDate(new Date(System.currentTimeMillis()));
    board.setViewCount(0);
    boardService.add(board);

    // Notice객체 추가(pf_notice)
    Notice notice = new Notice();
    notice.setNumber(board.getNumber());
    notice.setCategoryNumber(noticeNumber);
    notice.setTitle(title);
    notice.setContent(content);
    notice.setRegisteredDate(new Date(System.currentTimeMillis()));
    noticeService.insert(notice);

    // BoardAttachment 객체 추가(pf_board_attachment)
    String dirPath = servletContext.getRealPath("/upload/notice");
    for(MultipartFile file : files) {
      if (file.getSize() <= 0) {
        continue;
      } else {
        String filename = UUID.randomUUID().toString() + file.getOriginalFilename();
        String filepath = dirPath + "/" + filename;
        file.transferTo(new File(filepath));

        BoardAttachment boardAttachment = new BoardAttachment();
        boardAttachment.setBoardNumber(board.getNumber());
        boardAttachment.setFileName(filename);
        boardAttachment.setFilePath(filepath);
        boardAttachmentService.add(boardAttachment);
      }
    }
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int number) throws Exception {
    if(noticeService.delete(number)) {
      boardAttachmentService.delete(number);
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
    model.addAttribute("category", noticeCategoryService.get(item.getCategoryNumber()));
  }


  @PostMapping("update")
  public String update(int originalNoticeNumber, Notice notice,
      @RequestParam("files") MultipartFile[] files) throws Exception {

    for(MultipartFile file : files) {
      // file의 사이즈가 0이 이상인경우 (첨부파일이 있는 경우), 첨부파일을 수정하기위해 기존 파일을 삭제한다.
      if(file.getSize() > 0) {
        boardAttachmentService.delete(notice.getNumber());
      }
    }

    String dirPath = servletContext.getRealPath("/upload/notice");

    for(MultipartFile file : files) {
      if (file.getSize() <= 0) {
        continue;
      } else {
        String filename = UUID.randomUUID().toString() + file.getOriginalFilename();
        String filepath = dirPath + "/" + filename;
        file.transferTo(new File(filepath));

        BoardAttachment boardAttachment = new BoardAttachment();
        boardAttachment.setBoardNumber(notice.getNumber());
        boardAttachment.setFileName(filename);
        boardAttachment.setFilePath(filepath);
        boardAttachmentService.add(boardAttachment);
      }
    }

    Board board = new Board();
    board.setNumber(notice.getNumber());
    board.setTitle(notice.getTitle());
    board.setContent(notice.getContent());
    board.setRegisteredDate(notice.getRegisteredDate());
    board.setViewCount(notice.getViewCount());

    if(boardService.update(board)) {
      if(notice.getCategoryNumber() != originalNoticeNumber) {
        noticeService.update(notice);
      }
      return "redirect:list";
    }else
      throw new Exception("업데이트에 실패했습니다.");
  }



}