<%@ page import="com.portfoli.domain.JobPosting"%>
<%@ page import="com.portfoli.domain.JobPostingFile"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="today" value="${System.currentTimeMillis()}"/>
  <c:forEach items="${jobPostings}" var="jobPosting" varStatus="status">
    <tr class="transition-all-ease-250 transition-hover-top h-100 bl-0 br-0 bb-0 bw--2 card-body posting"
    		style="color:black; cursor:pointer;"
    		id="tList"
    		onclick="location.href='detail?no=${jobPosting.jobPostingNumber}'"
    		>
    <td><c:forEach items="${jobPosting.files}" var="jobPostingFile">
      <img src="../../upload/jobposting/${jobPostingFile.filePath}" width="100" height="100">
      </c:forEach></td>
      <td style="display:none;">${jobPosting.jobPostingNumber}</td>
      <td><font style="color: orange;">${jobPosting.company.name}</font><br>
      ${jobPosting.title}
      </td>
      
      <td>경력 <font style="color: orange;">${jobPosting.minimumCareer}
                    </font><br>
          최소학력 <font style="color: orange;">${jobPosting.finalEducation.category}</font>          
                    </td>
      <td>
      고용형태 <font style="color: orange;">${jobPosting.employmentStatus.name}</font><br>
      지역 <font style="color: orange;">${jobPosting.district.name}</font>
      </td>
      <td>${jobPosting.endDated}<br>
      <span id='D' class="fs--15 font-weight-bold mb-0" style="color: #424242;">
          D-${String.format("%.0f", (jobPosting.endDated.getTime() - today) / 1000 / 60 / 60 / 24)}
        </span>
      </td>
      <td>${jobPosting.viewCount}</td>
    </tr>
  </c:forEach>



