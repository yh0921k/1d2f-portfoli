<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<span class="text-muted">프리미엄 채용공고</span><br>
<div class="row pt-3 mb-3">
<c:set var="today" value="${System.currentTimeMillis()}"/>
<c:forEach items="${premium}" var="chargedPost">
  <div class="col-12 col-lg-4 mb-3">
    <div class="card shadow-md transition-all-ease-250 border-secondary bl-0 br-0 bb-0 bw--2">
      <div class="card-body pb-0">
        <h6 class="card-title mb-0">${chargedPost.company.name}</h6>
        <div class="transition-hover-top" onclick="location.href='detail?no=${chargedPosting.jobPostingNumber}'">
        ${chargedPost.title}</div>
        <p class="card-text mb-0">
          <c:if test="${not empty chargedPost.logo}">
            <img src="${pageContext.servletContext.contextPath}/upload/jobposting/${chargedPost.logo}" width="300" height="70">
          </c:if>
          <br><br> <small>경력 ${chargedPost.minimumCareer} | ${chargedPost.finalEducation.category} | ${chargedPost.district.name}</small>
          <br>
          <span id="endDate" style="display: none;">${chargedPost.endDated}</span>
        </p>
        <span id='D' class="fs--15 font-weight-bold mb-0" style="color: #424242;">
          D-${String.format("%.0f", (chargedPost.endDated.getTime() - today) / 1000 / 60 / 60 / 24)}
        </span>
      </div>
    </div>
</div>
</c:forEach>
</div>