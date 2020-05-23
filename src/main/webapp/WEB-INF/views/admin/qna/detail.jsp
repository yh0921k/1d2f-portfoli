<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="modal-header">
	<h2 class="modal-title fs--18 m-0">QNA 상세보기</h2>

	<button type="button" class="close pointer" data-dismiss="modal"
		aria-label="Close">
		<span class="fi fi-close fs--18" aria-hidden="true"></span>
	</button>
</div>

<div class="modal-body p--30">
	
	<p class="text-gray-900 mb-1 ml-3">카테고리 : ${qna.category.name}</p>
	<p class="text-gray-900 mb-1 ml-3">작성자 : ${qna.writer}</p>
	<p class="text-gray-900 mb-1 ml-3">작성일시 : ${qna.registeredDate}</p>
	<p class="text-gray-900 mb-1 ml-3">조회수 : ${qna.viewCount}</p>
	<p class="text-gray-900 mb-1 ml-3">제목 : ${qna.title}</p>
	<p class="text-gray-900 mb-1 ml-3">내용 :</p>
	<div class="border m-3 p-3" style="min-height: 200px;">
		<p style="white-space: pre-wrap;" class="text-gray-900">${qna.content}</p>
	</div>
	
	<hr>
	<form method="post" action="reply">
	<input type="number" style="display: none;" name="no" id="no" value="${qna.number}">
	<input type="number" style="display: none;" id="emailNoti" name="emailNoti" value="${qna.emailNoti}">
	<input type="number" style="display: none;" id="readable" name="readable" value="${qna.readable}">
	<input type="number" style="display: none;" id="writer" name="writer" value="${qna.memberNumber}">
	<textarea required placeholder="문의 답변 내용" id="content" name="content" class="form-control mb-3" rows="6">${qna.answer}</textarea>
	
	<div align="right" class="container-fluid">
		<button type="submit" class="btn btn-outline-secondary btn-pill btn-sm">답변하기</button>
		<a href="/portfoli/admin/qna/delete?no=${qna.number}"><button type="button" class="btn btn-outline-secondary btn-pill btn-sm ml-2">삭제</button></a>
	</div>
	</form>
</div>
