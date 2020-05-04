<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../../header.jsp"/>

    <%--상단 바부분 : 필요없어서 뺌 
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
      --%>

			<!-- FAQ -->
			<section>
				<div class="container">

					<div class="row">

          <%--왼쪽 noticebar부분 : 필요없어서 뺌
          <jsp:include page="sidebar.jsp" />
				  --%>
				  
						<div class="col-12 col-lg-8">

							<!--
								.article-format class will add some slightly formattings for a good text visuals. 
								This is because most editors are not ready formatted for bootstrap
								Blog content should come inside this container, as it is from database!
								src/scss/_core/base/_typography.scss
							-->
							<div class="bg-white p-5 p-4-xl rounded-xl article-format">
							
	          <h1>공지사항 카테고리 수정페이지</h1>
					  <form action="update" method="post" enctype="multipart/form-data">
            <c:if test="${not empty category}">
            <table border='1' style="width: 100%;">
            
            <tr>
              <td width="30%"><input readonly="readonly" style="border-color:transparent; resize:none;" value="공지사항 카테고리 번호"/></td>
              <td width="70%"><input style="resize:none; border-color:pink; width: 100%;" name="categoryNumber" value="${category.categoryNumber}"/></td>
            </tr>
            <tr>
              <td width="30%"><input readonly="readonly" style="border-color:transparent; resize:none;" value="공지사항 카테고리 내용"/></td>
              <td width="70%"><input style="resize:none; border-color:pink; width: 100%;" name="name" value="${category.name}"/></td>
            </tr>
            <tr>
            <tr>
            <td colspan="2">
            <button>확인</button>
            <input type="button" onclick="location.href='forceDelete?categoryNumber=${category.categoryNumber}'" value="삭제"/>
            </td>
            </tr>
            </table>
            </c:if>
            <c:if test="${empty category}">
            값이 없습니다. 찡긋
            </c:if>
            </form>
							</div>

						</div>

					</div>

				</div>
			</section>
			<!-- /FAQ -->



		  <jsp:include page="../../footer.jsp"/>
