<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- AJAX CONTENT -->
<div class="modal-header">
  <h2 class="modal-title fs--18 m-0">
    <strong>카테고리 수정</strong>
  </h2>

  <button type="button" class="close pointer" data-dismiss="modal" aria-label="Close">
    <span class="fi fi-close fs--18" aria-hidden="true"></span>
  </button>
</div>

<div class="modal-body">
        
  <div class="accordion" id="accordionDropdownSignInUp">

    <!-- SIGN IN -->
    <form class="collapse bs-validate show" novalidate method="post" action="update" enctype="multipart/form-data" id="accordionDropdownSignInUpSignIn" data-parent="#accordionDropdownSignInUp">
      <div class="pt--0">

        <div class="form-label-group mb-4">
          <input value=${category.categoryNumber} required placeholder="number" id="categoryNumber" name="categoryNumber" class="form-control form-control-clean">
          <label>번호</label>
        </div>

        <div class="form-label-group mb-4">
          <input value=${category.name} required placeholder="category" id="name" name="name" class="form-control form-control-clean">
          <label for="signin_password">카테고리</label>
        </div>

        <button type="submit" class="btn btn-primary btn-soft">
          수정
        </button>
        <input value="삭제" type="button" class="btn btn-primary btn-soft" onclick="location.href='delete?categoryNumber=${category.categoryNumber}'">
        </button>

      </div>
    </form>
    <!-- /SIGN IN -->
  </div>
</div>


<style>
 .TD{
   padding: 10px 0px; text-align: center;
 }
 .TD2{
   padding: 10px 10px;
 }
 .padding{
   padding:5px 5px;
 }
</style>
