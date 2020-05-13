 <%@page import="com.portfoli.domain.BoardAttachment"%>
<%@page import="com.portfoli.domain.Portfolio"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../header.jsp"/>

      <!-- PAGE TITLE -->
      <section class="bg-white" style="padding: 30px 0px;">
        <div class="container py-1">

          <h1 class="h2">
            포트폴리오 게시판
          </h1>

          <nav aria-label="breadcrumb">
            <ol class="breadcrumb fs--14">
              <li class="breadcrumb-item"><a href="../../">portfoli</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="list">포트폴리오 게시판</a></li>
            </ol>
          </nav>

        </div>
      </section>
      <!-- /PAGE TITLE -->


      <!-- FAQ -->
      <section style="padding: 50px 0px;">
        <div class="container">

          <div class="row">

            <div class="col-12 col-lg-8">

              <!--x
                .article-format class will add some slightly formattings for a good text visuals. 
                This is because most editors are not ready formatted for bootstrap
                Blog content should come inside this container, as it is from database!
                src/scss/_core/base/_typography.scss
              -->
              <div class="bg-white p-5 p-4-xl rounded-xl article-format">
              
            <form action="updateForm" method="post">
            <c:if test="${not empty portfolio}">
            <input name="number" type="hidden" value="${portfolio.getNumber()}"/>
            <table class="lightGray">
            <tr class="firstTR">
              <td width="75%" class='padding'>
              <c:if test="${portfolio.seekingFlag == 1}">
              "${portfolio.id}"님의 포트폴리오 : (구직중)${portfolio.title}
              </c:if>
              <c:if test="${portfolio.seekingFlag != 1}">
              "${portfolio.id}"님의 포트폴리오 : (재직중)${portfolio.title}
              </c:if>
              </td>
              <td width="25%" align="center" class='padding darkerGray'>${portfolio.registeredDate}</td>
            </tr>
            <tr>
              <td colspan="2" class='padding'><a href="detail?number=${portfolio.number}">url : localhost:9999/portfoli/app/portfolio/detail?number=${portfolio.number}</td>
            </tr>
            <tr>
              <td colspan="2" class='textAR'><textarea readonly="readonly" class="textAR_in">${portfolio.content}</textarea></td>
            </tr>
            <tr class='photoTD'>
              <td colspan="2"  class='photoInside'>
              <c:choose>
              <c:when test="${portfolio.thumbnail != null}">
                ${item.thumbnail}
                <a style="margin: 0" href='${pageContext.servletContext.contextPath}/upload/portfolio/${portfolio.thumbnail}' height='80'>
                <img style="margin: 0" alt="첨부파일" name="thumbnail" src='${pageContext.servletContext.contextPath}/upload/portfolio/${portfolio.thumbnail}_300x300.jpg' height='80'/><br>
                </a>
                <br>
               </c:when>
               <c:otherwise>
               <span>썸네일이 없습니다.</span>
               </c:otherwise>
               </c:choose>
              </td>
            </tr>
            <tr class='photoTD'>
              <td colspan="2"  class='photoInside'>
              <c:choose>
              
              <c:when test="${not empty attachment}">
              <c:forEach items="${attachment}" var="item">
              <c:set var="name" value="${item.fileName}" />
              <div style="display:inline-block; padding:5px 5px; margin:5px 5px; border: 3px outset white; height: 110px;">
                <div style="font-size: small">
                ${item.filePath}
                </div>
                <div>
                <a target="_blank" download="${item.filePath}" href='${pageContext.servletContext.contextPath}/upload/portfolio/${item.fileName}' style='margin: 0'>
                    <c:choose>
			                <c:when test="${item.fileName.endsWith('.jpg') || item.fileName.endsWith('.png') || item.fileName.endsWith('.jpeg') || item.fileName.endsWith('.gif') }">
		                   <img style='margin: 0' alt='첨부파일' name='attachment' id="attch" src='${pageContext.servletContext.contextPath}/upload/portfolio/${item.fileName}' height="80px"/><br>
                       
			                </c:when>
			                <c:otherwise>
			                 <img style='margin: 0' alt='첨부파일' name='attachment' id="attch" src='${pageContext.servletContext.contextPath}/resources/assets/images/file_icon.png' height="80px"/><br>
			                </c:otherwise>
		                </c:choose>
                </a>
                </div>
              </div>
              </c:forEach>
                <br>
               </c:when>
               <c:otherwise>
               <span>첨부파일이 없습니다.</span>
               </c:otherwise>
               </c:choose>
              </td>
            </tr>

            <tr>
            <td colspan="2" class='buttonTD'>
            <button style="font-size: small" type="submit">수정(M)</button>
            <button style="font-size: small" type="submit"  id="deleteButton"onclick='move(event)'>삭제(D)</button>
            </td>
            </tr>
            </table>
            </c:if>
            </form>
            <c:if test="${empty portfolio}">
            값이 없습니다. 찡긋
            </c:if>
              </div>

            </div>

          </div>

        </div>
      </section>
      <!-- /FAQ -->

  <style>
    .lightGray{width: 100%; border:2px lightGray solid;}
    .darkerGray{color:#313335;}
    .firstTR{border-bottom:1px darkGray dashed;}
    .padding{padding:10px; border:0px;}
    .photoTD{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .photoInside{text-align: center}
    .buttonTD{text-align: center}
    .textAR{padding:0px 5px;}
    .textAR_in{border-color:transparent; resize:none; width: 100%; height: 450px;}
  </style>
  <script>
  function move(e) {
	  e.preventDefault();
	  location.href = "delete?number=" + ${portfolio.number};
  }
  
  </script>

      <jsp:include page="../footer.jsp"/>