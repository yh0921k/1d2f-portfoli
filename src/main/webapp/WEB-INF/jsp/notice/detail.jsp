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
            <input name="board.number" type="hidden" value="${notice.getBoard().getNumber()}"/>
            <input name="board.number" type="hidden" value="${notice.noticeNumber}"/>
            <table border='1' style="width: 100%;">
            <tr>
              <td width="75%" style="padding: 10px;">[${categoryName}] ${notice.board.title}</td>
              <td width="25%" style="padding: 10px; color:#313335;">${notice.board.registeredDate}</td>
            </tr>
            <tr>
              <td colspan="2" style="padding: 10px;"><a href="detail?number=${notice.board.number}">url : localhost:9999/portfoli/app/notice/detail?number=${notice.board.number}</td>
            </tr>
            <tr>
              <td colspan="2" style="padding: 10px;"><textarea readonly="readonly" style="border-color:transparent; resize:none; width: 100%; height: 300px">${notice.board.content}</textarea></td>
            </tr>
            <tr>
              <td colspan="2" style="padding: 10px;">
                <img name="board.attachment" src='${pageContext.servletContext.contextPath}/upload/notice/${notice.getBoard().getAttachment()}' height='80'/>
                 <%-- pf_portfolio_file이 완성되면 그때 구현할 예정
                 <c:forEach items="${notice.files}" var="photoFile">
                 <img src='${pageContext.servletContext.contextPath}/upload/notice/${notice.getBoard().attachment}' height='80'/>
                 </c:forEach>
                 --%>
              </td>
            </tr>

            <tr>
            <td colspan="2">
            <button>수정</button>
            <a href="delete?number=${notice.board.number}">삭제</a>
            </td>
            </tr>
            </table>
            </c:if>
            <c:if test="${empty notice}">
            값이 없습니다. 찡긋
            </c:if>
            </form>
							</div>

						</div>

					</div>

				</div>
			</section>
			<!-- /FAQ -->



		  <jsp:include page="../footer.jsp"/>
