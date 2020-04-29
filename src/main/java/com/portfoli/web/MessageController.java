package com.portfoli.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.Member;
import com.portfoli.domain.Message;
import com.portfoli.domain.MessageFile;
import com.portfoli.service.MemberService;
import com.portfoli.service.MessageService;

@Controller
@RequestMapping("/message")
public class MessageController {
  static Logger logger = LogManager.getLogger(MessageController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  MessageService messageService;

  @Autowired
  MemberService memberService;

  // 테스트 url (세션 적용 전)
  // http://localhost:9999/portfoli/app/message/form?receiverNumber=1&senderNumber=2
  @GetMapping("form")
  public void form(HttpServletRequest request, int receiverNumber, Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);
    model.addAttribute("receiver", memberService.get(receiverNumber));
  }

  @PostMapping("add")
  public String add(HttpServletRequest request, Message message, MultipartFile[] messageFiles) throws Exception {
    ArrayList<MessageFile> files = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/message");
    for (MultipartFile messageFile : messageFiles) {
      if (messageFile.getSize() > 0) {
        MessageFile mFile = new MessageFile();
        String randomName = UUID.randomUUID().toString();
        String filePath = dirPath + "/" + randomName;

        mFile.setFileName(messageFile.getOriginalFilename());
        mFile.setFilePath(filePath);

        messageFile.transferTo(new File(filePath));

        files.add(mFile);
      }
    }

    message.setFiles(files);

    messageService.add(message);

    return "redirect:./inbox";
  }

  @GetMapping("sent")
  public void sent(
      HttpServletRequest request,
      @RequestParam(defaultValue = "1") int pageNumber,
      @RequestParam(defaultValue = "5") int pageSize,
      Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");

    List<Message> sent =
        messageService.listSentMessage(loginUser.getNumber(), pageNumber, pageSize);
    for (Message m : sent) {
      Member member = memberService.get(m.getReceiverNumber());
      m.setMember(member);
    }

    int size = messageService.sizeSent(loginUser.getNumber());
    int totalPage = size / pageSize;
    if (size % pageSize > 0) {
      totalPage++;
    }

    if (pageNumber < 1 || pageNumber > totalPage) {
      pageNumber = 1;
    }

    int endPage = (int) Math.ceil(pageNumber / (double) pageSize) * pageSize;
    int startPage = endPage - pageSize + 1;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    model.addAttribute("sent", sent);
    model.addAttribute("pageNumber", pageNumber);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("startPage", startPage);
    model.addAttribute("endPage", endPage);
  }

  @GetMapping("inbox")
  public void inbox(
      HttpServletRequest request,
      @RequestParam(defaultValue = "1") int pageNumber,
      @RequestParam(defaultValue = "5") int pageSize,
      Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");

    List<Message> inbox = messageService.listReceivedMessage(loginUser.getNumber(), pageNumber, pageSize);
    for (Message m : inbox) {
      Member member = memberService.get(m.getSenderNumber());
      m.setMember(member);
    }

    int size = messageService.sizeInbox(loginUser.getNumber());
    int totalPage = size / pageSize;
    if (size % pageSize > 0) {
      totalPage++;
    }

    if (pageNumber < 1 || pageNumber > totalPage) {
      pageNumber = 1;
    }

    int endPage = (int) Math.ceil(pageNumber / (double) pageSize) * pageSize;
    int startPage = endPage - pageSize + 1;

    if (endPage > totalPage) {
      endPage = totalPage;
    }

    model.addAttribute("inbox", inbox);
    model.addAttribute("pageNumber", pageNumber);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("startPage", startPage);
    model.addAttribute("endPage", endPage);
  }
}