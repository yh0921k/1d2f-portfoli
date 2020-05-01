<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../header.jsp"/>

      <!-- PAGE TITLE -->
      <section class="bg-white">
        <div class="container py-1">

          <h1 class="h2">
            공지사항
          </h1>

          <nav aria-label="breadcrumb">
            <ol class="breadcrumb fs--14">
              <li class="breadcrumb-item"><a href="../../">portfoli</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="list">고객센터</a></li>
            </ol>
          </nav>

        </div>
      </section>
      <!-- /PAGE TITLE -->



  <style>
    .lightGray{width: 100%; border:2px lightGray solid;}
    .darkerGray{color:#313335;}
    .firstTR{border-bottom:1px darkGray dashed;}
    .padding{padding:10px; border:0px;}
    .photoTD{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .photoInside{text-align: center}
    .buttonTD{text-align: center}
  </style>

      <!-- FAQ -->
      <section>
        <div class="container">

          <div class="row">

          <%--왼쪽 noticebar부분 --%>
          <jsp:include page="sidebar.jsp" />          
            
            <div class="col-12 col-lg-8">

              <!--
                .article-format class will add some slightly formattings for a good text visuals. 
                This is because most editors are not ready formatted for bootstrap
                Blog content should come inside this container, as it is from database!
                src/scss/_core/base/_typography.scss
              -->
              <div class="bg-white p-5 p-4-xl rounded-xl article-format">
              
            <form action="updateForm" method="post">
            <c:if test="${not empty notice}">
            <input name="number" type="hidden" value="${notice.getNumber()}"/>
            <input name="number" type="hidden" value="${notice.noticeNumber}"/>
            <table class="lightGray">
            <tr class="firstTR">
              <td width="75%" class='padding'>[${categoryName}] ${notice.title}</td>
              <td width="25%" class='padding darkerGray'>${notice.registeredDate}</td>
            </tr>
            <tr>
              <td colspan="2" class='padding'><a href="detail?number=${notice.number}">url : localhost:9999/portfoli/app/notice/detail?number=${notice.number}</td>
            </tr>
            <tr>
              <td colspan="2" class='padding'><textarea readonly="readonly" style="border-color:transparent; resize:none; width: 100%; height: 300px">${notice.content}</textarea></td>
            </tr>
            <tr class='photoTD'>
              <td colspan="2"  class='photoInside'>
              <c:choose>
              <c:when test="${not empty notice.attachment}">
                <img style="margin: 0" alt="첨부파일" name="attachment" src='${pageContext.servletContext.contextPath}/upload/notice/${notice.getAttachment()}' height='80'/><br>
                <a style="margin: 0" href='${pageContext.servletContext.contextPath}/upload/notice/${notice.getAttachment()}' download="${pageContext.servletContext.contextPath}/upload/notice/${notice.getAttachment()}.jpg" height='80'>첨부파일 다운로드</a>
                 <%-- pf_portfolio_file이 완성되면 그때 구현할 예정
                 <c:forEach items="${notice.files}" var="photoFile">
                 <img src='${pageContext.servletContext.contextPath}/upload/notice/${notice.attachment}' height='80'/>
                 </c:forEach>
                 --%>
               </c:when>
               <c:otherwise>
               <span>첨부파일이 없습니다.</span>
               </c:otherwise>
               </c:choose>
              </td>
            </tr>

            <tr>
            <td colspan="2" class='buttonTD'>
            <button type="submit">수정</button>
            </td>
            </tr>
            </table>
            </c:if>
            </form>
            <button type="submit"  onclick='location.href="delete?number=${notice.number}"'>삭제</button>
            <c:if test="${empty notice}">
            값이 없습니다. 찡긋
            </c:if>
              </div>

            </div>

          </div>

        </div>
      </section>
      <!-- /FAQ -->



      <jsp:include page="../footer.jsp"/>