<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../header.jsp"/>

      <!-- PAGE TITLE -->
      <section class="bg-white">
        <div class="container py-1">

          <h1 class="h2">
            고객센터
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
              <button onclick="location.href='form'">공지사항 파워추가</button>
                <table border='1' style="width: 100%">
                <tr>
                  <td width="15%">유형</td>
                  <td width="55%">제목</td>
                  <td width="15%">등록일</td>
                  <td width="15%">조회수</td>
                </tr>
                
            <c:forEach items="${list}" var="item">
            <tr>
              <td><a href="detail?number=${item.number}">${item.categoryName}</a></td>
              <td><a href="detail?number=${item.number}">${item.title}</a></td>
              <td><a href="detail?number=${item.number}">${item.registeredDate}</a></td>
              <td><a href="detail?number=${item.number}">${item.viewCount}</a></td>
            </tr>
            </c:forEach>
                
                </table>

              </div>

            </div>

          </div>

        </div>
      </section>
      <!-- /FAQ -->



      <jsp:include page="../footer.jsp"/>