<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!-- AJAX CONTENT -->
<div class="modal-header">
  <h2 class="modal-title fs--18 m-0">
    <strong>카테고리 등록</strong>
  </h2>

  <button type="button" class="close pointer" data-dismiss="modal" aria-label="Close">
    <span class="fi fi-close fs--18" aria-hidden="true"></span>
  </button>
</div>

<div class="modal-body">
        
  <div class="accordion" id="accordionDropdownSignInUp">

    <!-- SIGN IN -->
    <form class="collapse bs-validate show" novalidate method="post" action="/portfoli/admin/category/add" id="accordionDropdownSignInUpSignIn" data-parent="#accordionDropdownSignInUp">
      <div class="pt--0">

        <div class="form-label-group mb-4">
          <input required placeholder="number" id="categoryNumber" name="categoryNumber" class="form-control form-control-clean">
          <label for="signin_email">번호</label>
        </div>

        <div class="form-label-group mb-2">
          <input required placeholder="category" id="name" name="name" class="form-control form-control-clean" autocomplete="new-password">
          <label for="signin_password">카테고리</label>
        </div>
          
        <span id="message" style="color:red; font-size:13px;"></span>
        <button id="register" type="submit" class="btn btn-primary btn-soft btn-block">
          등록하기
        </button>

      </div>
    </form>
    <!-- /SIGN IN -->
  </div>
</div>

<script>
$(document).ready(function() {
	$("#register").attr('disabled', "true");
  $("#categoryNumber").keyup(function() { 
	  var obj = {"categoryNumber" : $("#categoryNumber").val()}
	  $.ajax({
	        url: "/portfoli/admin/category/isValid",
	        type: "post",
	        data: JSON.stringify(obj),
	        dataType: "json",
	        contentType: "application/json",
	        success: function(data) {
	            if(data == "valid") {
	            	$("#message").html("");
	            	$("#register").removeAttr('disabled');
	            } else {
	            	$("#message").html("해당 번호의 카테고리가 존재합니다.");
	            	$("#register").attr('disabled', "true");
	            }   
	        },
	        error: function(errorThrown) {
	            console.log("Error");
	        }
	    });
  }); 
});
</script>