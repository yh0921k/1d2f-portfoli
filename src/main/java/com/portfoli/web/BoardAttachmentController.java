package com.portfoli.web;

import java.io.File;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.BoardAttachment;
import com.portfoli.service.BoardAttachmentService;

@Controller
@RequestMapping("boardAttachment")
//@MultipartConfig(maxFileSize = 10000000)
public class BoardAttachmentController {

  static Logger logger = LogManager.getLogger(BoardAttachmentController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  BoardAttachmentService boardAttachmentService;

  public BoardAttachmentController () {
    logger.debug("boardAttachmentService 객체 생성!");
  }

  @RequestMapping("list")
  public void list(Model model) throws Exception {
    List<BoardAttachment> lists = boardAttachmentService.list();
    model.addAttribute("list", lists);
  }

  @RequestMapping("form")
  public void form() throws Exception {}
  
  @RequestMapping(value = "add")
  public String add(BoardAttachment boardAttachment, // w/ boardNumber
      @RequestParam("filePaths") MultipartFile[] filePaths) throws Exception {
    
    String dirPath = servletContext.getRealPath("/upload/boardAttachment");
    for(MultipartFile filePath : filePaths) {
      if(filePath.getSize() < 0) {
        continue;
      }
      
//      [suffix를 추출하는 대신 originalFileName을 활용하기로 결정]
//      String[] contentType = filePath.getContentType().split("/");
//      String suffix = "";
//      if(contentType[0].equals("image")) {
//        suffix = contentType[1];
//      } else {
//        suffix = contentType[1];
//      }
      
      String filename = String.format("%s___%s",
          UUID.randomUUID().toString(), filePath.getOriginalFilename());
      
      boardAttachment.setFilePath(dirPath + "/" + filename);
      boardAttachment.setFileName(filename);
      
      filePath.transferTo(new File(dirPath + "/" + filename));
      boardAttachmentService.add(boardAttachment);
    }
    return "redirect:list";
  }
  
  


}