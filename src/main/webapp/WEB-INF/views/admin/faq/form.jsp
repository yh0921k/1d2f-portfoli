<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="middle" class="flex-fill">  
  <section class="rounded mb-3 ">
      <div class="clearfix fs--18 pt-2 pb-3 mb-3 border-bottom">
        <strong>새 FAQ</strong>
      </div>

      <form action="add" method="post">
        <div class="row">
          <span class="text-gray-900 mt--12 mr--5" style="margin-left: 30px;">카테고리: </span>
          <select id="select_options2" name="category.number" class="form-control form-control-sm col-md-3">
            <c:forEach items="${categories}" var="category">
              <option value="${category.number}">${category.name}</option>
            </c:forEach>
          </select>
        </div>
        <div class="container-fluid">
          <span class="text-gray-900">제목 : </span> <input required type="text"
            class="form-label-group form-control-clean col-md-11 mt--5"
            name="title">

          <p class="text-gray-900 mt-3">문의사항 :</p>

          <textarea required placeholder="문의하실 내용을 적어주세요." id="description"
            name="content" class="form-control" rows="6"></textarea>

          <p class="text-gray-900 mt-3">답변 :</p>

          <textarea placeholder="답변하실 내용을 적어주세요." id="description"
            name="answerContent" class="form-control" rows="6"></textarea>

          <div class="row">
            <label
              class="form-switch form-switch-pill form-switch-primary d-block mt-3  ml-3">
              <input type="checkbox" value="0" id="readable" name="readable">
              <i data-on="OK" data-off="NO"></i> <span class="h6">게시글 공개 여부</span>
            </label>
          </div>

          <div align="right" class="container-fluid">
            <button type="submit"
              class="btn btn-outline-secondary btn-pill btn-sm mt-3">
              등록하기</button>

          </div>
        </div>
      </form>
    </section>
  </div>
<script>
$('input[type="checkbox"]').change(function(){
    this.value = (Number(this.checked));
});
</script>
