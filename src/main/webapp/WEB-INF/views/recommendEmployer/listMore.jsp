<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:if test="${not empty jobpostings}">
	<c:forEach var="item" items="${jobpostings}">
  <div class="card-body posting" style="height:240px" onclick="detail(${item.jobPostingNumber})">
    <div style="disply:inline-block; float:left; height:200px; width:200px; margin-left:10px; margin-right:20px;">
      <div id="thumbnail" style="display:inline-block; float:left; width:200px; height:200px; border:1px solid; "> 
        <img src="../../upload/jobposting/` + item.thumbnail + `_300x300.jpg" width="200" height="200">
      </div>
    </div>
    <h5 class="card-title">${item.company.name}</h5>
    <span><strong>${item.title}<strong></span>
    <h6><a>${item.tel}</a></h6>
    <br>
    <c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate var="now" value="${now}" pattern="yyyyMMdd" />
		<fmt:formatDate var="bdate" value="${item.startDated}" pattern="yyyyMMdd" />
    <p class="card-text" style="height:20px; margin-bottom:6px;">${item.field.name}</p>
    <p class="card-text" style="height:20px; margin-bottom:6px;">${item.district.cityName}&nbsp; ${item.district.name}</p>
    <span style="font-size:15px;">시작일: ${item.startDated}&nbsp;(${bdate - now})</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span style="font-size:15px;">조회수 : ${item.viewCount}</span>
  </div>
  </c:forEach>
</c:if>