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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.portfoli.domain.Certificate;
import com.portfoli.domain.CompanyRequiredCertificate;
import com.portfoli.domain.EmploymentStatus;
import com.portfoli.domain.JobPosting;
import com.portfoli.domain.JobPostingFile;
import com.portfoli.service.CertificateService;
import com.portfoli.service.EmploymentStatusService;
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

  @Autowired
  EmploymentStatusService employmentStatusService;

  @Autowired
  CertificateService certificateService;

  public JobPostingController() {
    logger.debug("JobPostingController 생성");
  }

  @GetMapping("form")
  public void addForm(Model model) throws Exception {
    List<EmploymentStatus> employmentStatus = employmentStatusService.get();
    List<Certificate> certificates = certificateService.listCertificate();
    System.out.println(certificates);
    model.addAttribute("employmentStatus", employmentStatus);
    model.addAttribute("certificates", certificates);
  }

  @PostMapping("add")
  public String add(//
      JobPosting jobPosting, //
      Certificate certificate, MultipartFile[] jobPostingFiles) throws Exception {
    System.out.println(certificate);
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
          .size(300, 300)//
          .outputFormat("jpg")//
          .toFiles(new Rename() {
            @Override
            public String apply(String name, ThumbnailParameter param) {
              return name + "_300x300";
            }
          });
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
  public void detail(@RequestParam(defaultValue = "1") int no, Model model) throws Exception {
    jobPostingService.plusCnt(no);
    model.addAttribute("jobPosting", jobPostingService.get(no));
  }

  @GetMapping("list")
  public void list(@ModelAttribute("jobPosting") JobPosting jobPosting, Model model)
      throws Exception {

    int listCnt = jobPostingService.ListCnt(jobPosting);
    List<JobPosting> jobPostings = jobPostingService.list();
    model.addAttribute("listCnt", listCnt);
    model.addAttribute("list", jobPostings);
  }

  @GetMapping("list2")
  public void list2(@RequestParam(defaultValue = "1") int lastNo, Model model) throws Exception {
    List<JobPosting> jobPostings = jobPostingService.list2(lastNo);
    model.addAttribute("list", jobPostings);
  }

  @GetMapping("search")
  public void search(String keyword, Model model) throws Exception {
    model.addAttribute("list", jobPostingService.search(keyword));
  }

  @GetMapping("updateForm")
  public void updateForm(int no, Model model) throws Exception {
    List<EmploymentStatus> employmentStatus = employmentStatusService.get();
    List<Certificate> certificates = certificateService.listCertificate();
    model.addAttribute("jobPosting", jobPostingService.get(no));
    model.addAttribute("employmentStatus", employmentStatus);
    model.addAttribute("certificates", certificates);
  }

  @PostMapping("update")
  public String update(//
      JobPosting jobPosting, //
      Certificate certificate, MultipartFile[] jobPostingFiles) throws Exception {
    System.out.println(certificate);
    ArrayList<JobPostingFile> files = new ArrayList<>();
    String dirPath = servletContext.getRealPath("/upload/jobposting");
    for (MultipartFile jobPostingFile : jobPostingFiles) {
      if (jobPostingFile.getSize() <= 0) {
        continue;
      }
      String filename = UUID.randomUUID().toString();
      jobPostingFile.transferTo(new File(dirPath + "/" + filename));
      files.add(new JobPostingFile().setFilePath(filename));

      Thumbnails.of(dirPath + "/" + filename)//
          .size(300, 300)//
          .outputFormat("jpg")//
          .toFiles(new Rename() {
            @Override
            public String apply(String name, ThumbnailParameter param) {
              return name + "_300x300";
            }
          });

    }

    List<Certificate> companyRequiredCertificates = new ArrayList<>();
    companyRequiredCertificates.add(//
        new CompanyRequiredCertificate().setCertificate(certificate));

    if (files.size() > 0) {
      jobPosting.setFiles(files);
    } else {
      jobPosting.setFiles(null);
    }

    // if (companyRequiredCertificates.size() > 0) {
    // jobPosting.setCompanyRequiredCertificates(companyRequiredCertificates);
    // } else {
    // jobPosting.setCompanyRequiredCertificates(null);
    // }

    jobPostingService.update(jobPosting);
    return "redirect:list";
  }
}
