<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../header.jsp"/>

      <!-- PAGE TITLE -->
      <section class="bg-white" style="padding: 30px 0px;">
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
    .padding{padding:10px; border-right: 2px solid lightGray;}
    .optPadding{height: 30px; padding: 0px 5px;}
    .pinkPadding{resize:none; border-color:pink; width: 80%; height: 100%}
    .photoTD{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .photoInside{text-align: center}
    .buttonTD{text-align: center}
    .textAR{resize:none; border-color:pink}
  </style>
  
      <!-- FAQ -->
      <section style="padding: 50px 0px;">
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
              
            <form action="update" method="post" enctype="multipart/form-data">
            <c:if test="${not empty notice}">
            <input name="originalNoticeNumber" type=hidden value="${notice.getCategoryNumber()}"/>
            <input name="number" type="hidden" value="${notice.getNumber()}"/>
            <table class='lightGray'>
            <tr class='firstTR'>
              <td width="75%" class='padding'>
              
              <select name="noticeNumber" class='optPadding'>
              <option value="${category.getCategoryNumber()}">${category.getName()}</option>
              <option disabled="disabled">-------------------</option>
              <c:forEach items="${list}" var="item">
              <c:choose>
              <c:when test="${category.categoryNumber eq item.getCategoryNumber()}">
              <%--
              <option style="background-color: Silver;font-weight: bold;" value="${item.getNoticeNumber()}">${item.getName()}</option>
               --%>
              </c:when>
              <c:otherwise>
              <option value="${item.getCategoryNumber()}">${item.getName()}</option>
              </c:otherwise>
              </c:choose>
              </c:forEach>
              <%--
               --%>
              </select>
              <input name="title"  class='pinkPadding' value="${notice.title}"/></td>
              <td width="25%" class='padding darkerGray'>${notice.registeredDate}</td>
            </tr>
            <tr>
              <td colspan="2" class='padding'><a href="detail?number=${notice.number}">url : localhost:9999/portfoli/app/notice/detail?number=${notice.number}</a></td>
            </tr>
            <tr>
              <td colspan='3' class='padding'>
              <textarea class='textAR' cols="100%" rows="30px" name="content">${notice.content}</textarea>
              </td>
            </tr>
            <tr class='photoTD'>
              <td colspan="2" align="center">
              <input type="file" name="files" />
              <input type="file" name="files" />
              <input type="file" name="files" />
              <input type="file" name="files" />
              <input type="file" name="files" />
              </td>
            </tr>

            <tr>
            <td class='buttonTD' colspan='3'>
            <button>수정완료</button>
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