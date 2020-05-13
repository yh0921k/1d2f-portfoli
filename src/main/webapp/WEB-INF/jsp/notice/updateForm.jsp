<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:include page="../header.jsp"/>

<div class="container-fluid">
  <div class="row">
    <!--------------------------------------- nav bar ----------------------------------------------->

    <div class="col-lg-3 mb-5 h--600 border-right ml--20 mr-5 mt--20">
      <!-- CATEGORIES -->
      <nav class="nav-deep nav-deep-light mb-2">
        <!-- mobile only -->
        <button
          class="clearfix btn btn-toggle btn-sm btn-block text-align-left shadow-md border rounded mb-1 d-block d-lg-none"
          data-target="#nav_responsive"
          data-toggle-container-class="d-none d-sm-block bg-white shadow-md border animate-fadein rounded p-3">
          <span class="group-icon px-2 py-2 float-start"> <i
            class="fi fi-bars-2"></i> <i class="fi fi-close"></i>
          </span> <span class="h5 py-2 m-0 float-start"> Customer Center </span>
        </button>

        <!-- desktop only -->
        <h3 class="h3 pt-3 pb-3 m-0 d-none d-lg-block ml-3">Customer
          Center</h3>
        <!-- navigation -->
        <ul id="nav_responsive"
          class="nav flex-column d-none d-lg-block font-weight-bold">

          <li class="nav-item active mb-2"><a class="nav-link" href="/portfoli/app/notice/list"> <span class="px-2 d-inline-block"> 공지사항 </span>
          </a></li>

          <li class="nav-item mb-2"><a class="nav-link" href="/portfoli/app/faq/list"> <span class="px-2 d-inline-block"> FAQ </span>
          </a></li>

          <li class="nav-item mb-2"><a class="nav-link" href="/portfoli/app/qna/list"> <span class="px-2 d-inline-block"> Q&A </span>
          </a></li>

        </ul>
      </nav>
    </div>
    <!--------------------------------------------- /nav bar ------------------------------------------------>
    
    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20" style="width: 65%;">

      <div class="portlet-header">
       <h1 class="d-none d-lg-block m--3">공지사항</h1>
       <form action="update" method="post" enctype="multipart/form-data">
		       <div align="right">
		         <button type="submit" class="btn btn-outline-secondary btn-pill btn-sm">수정완료(M)</button>
		         <button class="btn btn-outline-secondary btn-pill btn-sm" 
		                 onclick="move(event)">취소(C)</button>
		       </div>
            
        <div class="table-responsive rounded" style="min-height: 500px;">
            <c:if test="${not empty notice}">
            <input name="originalNoticeNumber" type=hidden value="${notice.getCategoryNumber()}"/>
            <input name="number" type="hidden" value="${notice.getNumber()}"/>
            <table class='lightGray'>
            <tr class='firstTR'>
              <td width="75%" class='padding'>
	              <select name="categoryNumber" class='optPadding'>
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
	              <input style="height:29px;" name="title"  class='pinkPadding' value="${notice.title}"/>
	            </td>
              <td align="center" width="25%" class='padding darkerGray'>
                ${notice.registeredDate}
              </td>
            </tr>
            <tr>
              <td colspan="2" class='padding'><a href="detail?number=${notice.number}">url : localhost:9999/portfoli/app/notice/detail?number=${notice.number}</a></td>
            </tr>
            <tr>
              <td colspan='3' class='padding' style="padding-top: 0px">
              <textarea class='textAR' cols="100%" rows="30px" name="content">${notice.content}</textarea>
              </td>
            </tr>
            <tr class='photoTD'>
            <%-- filePar : 첨부파일 개수 늘리는 부분 --%>
              <td colspan="2" align="center" id="filePar">
              <input type="file" name="files" class="files" onclick="plus(event)"/><br>
              </td>
            </tr>
            </table>
            </c:if>
            <c:if test="${empty notice}">
            값이 없습니다. 찡긋
            </c:if>
          </div>
        </form>
      </div>

    </div>
  </div>
   </div>

  <style>
    .files{margin:5px 0px;}
    .lightGray{width: 100%; border:2px lightGray solid;}
    .darkerGray{color:#313335;}
    .firstTR{border-bottom:1px darkGray dashed;}
    .padding{padding:7px; border-right: 2px solid lightGray;}
    .optPadding{height: 30px; padding: 0px 5px; width: 24%}
    .pinkPadding{resize:none; padding:5px; border-color:pink; width: 75%; height: 100%}
    .photoTD{padding:10px; border-top:1px darkGray dashed; border-bottom:1px darkGray dashed; background: lightGray; height: 150px;}
    .photoInside{text-align: center}
    .buttonTD{text-align: center}
    .textAR{resize:none; border-color:pink; width: 100%; height: 450px;}
  </style>
  <script>
  var td = document.querySelector(".photoTD");
  console.log(td);
  
  td.addEventListener("click", function(e) {
      e.stopImmediatePropagation();
      
      var br = document.createElement("br");
      
      var newNode = document.createElement("input");
      newNode.type="file";
      newNode.name="files";
      newNode.setAttribute("class", "files");
      newNode.setAttribute("onclick", "plus(event)");
      
      var filePar = document.querySelector("#filePar");
      console.log(filePar);
      console.log(newNode);
      filePar.appendChild(newNode);
      filePar.appendChild(br);
      
      e.stopImmediatePropagation();
      
  });
  
    function plus(e) {
    	e.stopImmediatePropagation();
    }
    
    
    function move(e) {
        e.preventDefault();
        location.href = "list";
      }
    
  </script>

      <jsp:include page="../footer.jsp"/>