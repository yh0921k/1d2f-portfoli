<%@page import="java.util.List"%>
<%@page import="com.portfoli.domain.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section class="bg-white" style="padding: 30px 0px;">
	<div class="container py-1">
	
	  <h3 class="h4" style="display:inline-block;"><strong>Ranking</strong></h3>
	  
	  
	  <hr>
	  <div style="display:inline-block" class="dataTables_length" id="rand_yjK_length">
	    <label>
		    <select id="field" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
			    <option id="allField" class="fieldList">분야전체</option>       
			    <!-- 페이지 불릴 때 필드 리스트 로딩 -->
			    <c:forEach var="field" items="${fieldList}">
					  <option class="fieldList">${field.name}</option>
					</c:forEach>
		    </select>
		  </label>
    </div>
    
    <div style="display:inline-block" class="dataTables_length" id="rand_yjK_length">
      <label>
        <select id="moreLine" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
          <option id="allField" class="fieldList">기술전체</option>       
          <!-- 페이지 불릴 때 필드 리스트 로딩 -->
          <c:forEach var="field" items="${fieldList}">
            <option class="fieldList">${field.name}</option>
          </c:forEach>
        </select>
      </label>
    </div>
    
    <div style="display:inline-block" class="dataTables_length" id="rand_yjK_length">
      <label>
        <select id="orderCount" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
	        <option id="viewCount" class="count">조회수</option>        
	        <option id="likeCount" class="count">좋아요수</option>
        </select>
      </label>
    </div>
    <br><br>
    
	  <div id="portfolio_field" style="width:100%;">
      <div class="row">
        <div class="col-12 col-lg-12">
          <div class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-primary bl-0 br-0 bb-0 bw--2">
            <div class="card-body" style="height:70px">
            </div>
          </div>
        </div>
      </div>
    </div>  
	  <hr>
	   
	   
	
	</div>
</section>

<script>
window.onload = function() {
	let data = {};
	data.field = $("#field").val();
	data.orderCount = $("#orderCount").val();
	console.log(data.field);
	console.log(data.orderCount);
	var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = () => {
      if (xhr.readyState == 4) {
          if (xhr.status == 200) {
        	  let obj = JSON.parse(xhr.responseText);
        	  for(let item of obj) {
        		  console.log(item.thumbnail);
        		  let makeHtml = "";
        		  let portfolioSkill = "";
        		  for(let skill of item.skills) {
        			  portfolioSkill += `<span style="margin:2px;" class="haveSkills badge badge-pill badge-secondary">` + skill.name + `</span>`
        		  }
        		  
        		  makeHtml += `<div class="row">
        	        <div class="col-12 col-lg-12">
        	          <div class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-primary bl-0 br-0 bb-0 bw--2">
        	            <div class="card-body" style="height:240px">
        	              <div style="disply:inline-block; float:left; height:200px; width:200px; margin-left:10px; margin-right:20px;">
        	                <div id="thumbnail" style="display:inline-block; float:left; width:200px; height:200px; border:1px solid; "> 
        	                  <img src="../../upload/` + item.thumbnail + `_300x300.jpg" width="200" height="200">
        	                </div>
        	              </div>
        	              <h5 class="card-title">` + item.title + `</h5>
        	              <span><strong>` + item.id + `<strong></span>
        	              <h6><a href="` + item.homepage + `" target="_blank">` + item.homepage + `</a></h6>
        	              <br>
        	              <p class="card-text" style="height:20px; margin-top:30px; margin-bottom:6px;">` + portfolioSkill +`</p>
        	              <span style="font-size:15px;">조회수 : ` + item.viewCount + `</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	              <span style="font-size:15px;">좋아요 : ` + item.likeCount + `</span>
        	            </div>
        	          </div>
        	        </div>
        	      </div>`;
        	    $("#portfolio_field").append(makeHtml);
        	  }
          }
      }
  };
  xhr.open('POST', 'listByOption');
  xhr.setRequestHeader('Content-Type', 'application/json'); 
  xhr.send();
};
</script>