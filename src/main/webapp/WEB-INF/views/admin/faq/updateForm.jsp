<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="middle" class="flex-fill">
  <section class="rounded mb-3 ">
    <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom"><strong>FAQ 수정</strong></div>
    <!-------------------------------------------- contents -------------------------------------------------->
    <div class="portlet mt--20 p-3" style="width: 100%;">

      <div class="portlet-header">
        <h1 class="d-none d-lg-block">FAQ</h1>

      </div>
      <form action="update" method="post">
        <input type="hidden" name="number" value="${faq.number}">
        <div class="row">
          <span class="text-gray-900 mt--12 mr--5" style="margin-left: 30px;">카테고리
            : </span> <select id="select_options2" name="category.number"
            class="form-control form-control-sm col-md-3">
            <c:forEach items="${categories}" var="category">
              <c:if test="${faq.category.name == category.name}">
                <option value="${category.number}" selected="selected">${category.name}</option>
              </c:if>
              <c:if test="${faq.category.name != category.name}">
                <option value="${category.number}">${category.name}</option>
              </c:if>
            </c:forEach>
          </select>
        </div>
        <p class="text-gray-900 mb-1 ml-3">작성일시 : ${faq.registeredDate}</p>
        <p class="text-gray-900 mb-1 ml-3">조회수 : ${faq.viewCount}</p>
        <div class="container-fluid">
          <span class="text-gray-900">제목 : </span> <input required type="text"
            class="form-label-group form-control-clean col-md-11 mt--5"
            name="title" value="${faq.title}">

          <p class="text-gray-900 mt-3">문의사항 :</p>

          <textarea required placeholder="문의하실 내용을 적어주세요." id="description"
            name="content" class="form-control" rows="6">${faq.content}</textarea>
          <p class="text-gray-900 mt-3">답변 :</p>

          <textarea placeholder="답변하실 내용을 적어주세요." id="description"
            name="answerContent" class="form-control" rows="6">${faq.answerContent}</textarea>

      <div class="row">
        <label
          class="d-block mt-3 ml-3">
          <span>게시글 공개 여부 (</span>
          <c:if test="${faq.readable eq 1}">
          <input type="radio" name="readable" value='1' checked="checked">공개
          <input type="radio" name="readable" value='0'>비공개
          </c:if>
          <c:if test="${faq.readable eq 0}">
          <input type="radio" name="readable" value='1'>공개
          <input type="radio" name="readable" value='0' checked="checked">비공개
          </c:if>
          )
        </label>
      </div>
            
          <div align="right" class="container-fluid">
            <button type="submit"
              class="btn btn-outline-secondary btn-pill btn-sm mt-3">
              수정하기</button>

          </div>
        </div>
      </form>
    </div>
  </section>
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
