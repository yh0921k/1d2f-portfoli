package com.portfoli.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
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

  @GetMapping("form")
  public void form(HttpServletRequest request, int receiverNumber, Model model) throws Exception {
    Member loginUser = (Member) request.getSession().getAttribute("loginUser");
    model.addAttribute("loginUser", loginUser);
    model.addAttribute("receiver", memberService.get(receiverNumber));
  }

  @PostMapping("add")
  public void add(Message message, MultipartHttpServletRequest request) throws Exception {
    String dirPath = servletContext.getRealPath("/upload/message");
    List<MessageFile> messageFiles = new ArrayList<>();
    List<MultipartFile> fileList = request.getFiles("messageFiles[]");
    for (MultipartFile file : fileList) {
      if (file.getSize() > 0) {
        MessageFile messageFile = new MessageFile();
        String fileName =
            String.format("%d_%s", System.currentTimeMillis(), file.getOriginalFilename());

        messageFile.setFileName(file.getOriginalFilename());
        messageFile.setFilePath(fileName);

        file.transferTo(new File(dirPath + "/" + fileName));

        messageFiles.add(messageFile);
      }
    }

    message.setFiles(messageFiles);

    messageService.add(message);
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

    request.getSession().setAttribute("inbox", inbox);

    model.addAttribute("pageNumber", pageNumber);
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("totalPage", totalPage);
    model.addAttribute("startPage", startPage);
    model.addAttribute("endPage", endPage);
  }

  @GetMapping("sent/detail")
  public String sentDetail(int number, Model model) throws Exception {
    Message message = messageService.get(number);
    if (message.getSenderDelete() == 1) {
      throw new Exception("존재하지 않는 쪽지입니다.");
    }
    message.setMember(memberService.get(message.getReceiverNumber()));

    model.addAttribute("message", message);

    return "message/sentDetail";
  }

  @GetMapping("inbox/detail")
  public String inboxDetail(int number, Model model) throws Exception {
    Message message = messageService.get(number);
    if (message.getReceiverDelete() == 1) {
      throw new Exception("존재하지 않는 쪽지입니다.");
    }

    message.setMember(memberService.get(message.getSenderNumber()));

    model.addAttribute("message", message);

    return "message/inboxDetail";
  }

  @GetMapping("inbox/modal")
  public String inboxModal(int number, Model model) throws Exception {
    Message message = messageService.get(number);
    if (message.getReceiverDelete() == 1) {
      throw new Exception("존재하지 않는 쪽지입니다.");
    }

    model.addAttribute("message", message);

    return "message/inboxModal";
  }

  @GetMapping("sent/delete")
  public void deleteSentMessage(int number) throws Exception {
    Message message = messageService.get(number);
    messageService.deleteSentMessage(message);
  }

  @GetMapping("inbox/delete")
  public void deleteReceivedMessage(int number) throws Exception {
    Message message = messageService.get(number);
    messageService.deleteReceivedMessage(message);
  }
}