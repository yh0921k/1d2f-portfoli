package com.portfoli.web;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletContext;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.JobPostingFile;
import com.portfoli.service.JobPostingService;
import net.coobird.thumbnailator.ThumbnailParameter;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.name.Rename;

@Controller
@RequestMapping("/jobposting")
public class JobPostingController {

  static Logger logger = LogManager.getLogger(JobPostingController.class);

  @Autowired
  ServletContext servletContext;

  @Autowired
  JobPostingService jobPostingService;

  public JobPostingController() {
    logger.debug("JobPostingController 생성");
  }

  @GetMapping("form")
  public void form() throws Exception {}

  @PostMapping("add")
  public String add(//
      JobPosting jobPosting, //
      MultipartFile[] jobPostingFiles) throws Exception {

    System.out.println(jobPosting + "1111");

    ArrayList<JobPostingFile> files = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/jobposting");
    for (MultipartFile photoFile : jobPostingFiles) {
      if (photoFile.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      photoFile.transferTo(new File(dirPath + "/" + filename));
      files.add(new JobPostingFile().setFilePath(filename));

      Thumbnails.of(dirPath + "/" + filename)//
          .size(20, 20)//
          .outputFormat("jpg")//
          .toFiles(new Rename() {
            @Override
            public String apply(String name, ThumbnailParameter param) {
              return name + "_20x20";
            }
          });

    }

    if (files.size() == 0) {
      throw new Exception("최소 한 개의 사진 파일을 등록해야 합니다.");
    }
    jobPosting.setFiles(files);
    System.out.println(jobPosting + "2222");
    jobPostingService.add(jobPosting);
    return "redirect:list";
  }

  @GetMapping("delete")
  public String delete(int no) throws Exception {
    jobPostingService.delete(no);
    return "redirect:list";
  }

  @GetMapping("detail")
  public void detail(int no, Model model) throws Exception {
    model.addAttribute("jobPosting", jobPostingService.get(no));
  }

  @GetMapping("list")
  public void list(Model model) throws Exception {
    List<JobPosting> jobPostings = jobPostingService.list();
    model.addAttribute("list", jobPostings);
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", jobPostingService.search(keyword));
  }

  @GetMapping("updateForm")
  public void updateForm(int no, Model model) throws Exception {
    model.addAttribute("jobPosting", jobPostingService.get(no));
  }

  @PostMapping("update")
  public String update(//
      int no, //
      JobPosting jobPosting, //
      MultipartFile[] jobPostingFiles) throws Exception {
    System.out.println("111111111111111");

    jobPosting = jobPostingService.get(no);

    ArrayList<JobPostingFile> files = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/jobposting");
    for (MultipartFile jobPostingFile : jobPostingFiles) {
      if (jobPostingFile.getSize() <= 0) {
        continue;
      }
      System.out.println("22222222222222");
      String filename = UUID.randomUUID().toString();
      jobPostingFile.transferTo(new File(dirPath + "/" + filename));
      files.add(new JobPostingFile().setFilePath(filename));
    }

    if (files.size() > 0) {
      jobPosting.setFiles(files);
    } else {
      jobPosting.setFiles(null);
    }


    System.out.println("33333333333333333");
    jobPostingService.update(jobPosting);
    return "redirect:list";
  }
}
