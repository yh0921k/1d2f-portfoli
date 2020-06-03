<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"
	errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<meta name="theme-color" content="#377dff">


<div class="container py-1">

	<!-- MEMBER INTEREST SKILL TAB -->
	<div class="tab-pane border bt-0 p-4 shadow-xs">
	  <div class="d-block shadow-xs rounded p-4 mb-2">
	      
	    <div class="row">
	      <div class="col">
	        <div id="int_available">
	        관심필드 : 
	        </div>  
	        <div id="region_available">
	        관심지역 : 
	        </div>  
	        </div>
	    </div> 
	  </div>
	</div>
	<!-- MEMBER INTEREST SKILL TAB -->


  <div class="card-body" style="height:240px">
    <div style="disply:inline-block; float:left; height:200px; width:200px; margin-left:10px; margin-right:20px;">
      <div id="thumbnail" style="display:inline-block; float:left; width:200px; height:200px; border:1px solid; "> 
        <img src="../../upload/jobposting/` + item.thumbnail + `_300x300.jpg" width="200" height="200">
      </div>
    </div>
    <h5 class="card-title">회사명</h5>
    <span><strong>공고이름<strong></span>
    <h6><a href="` + item.homepage + `" target="_blank">사이트 주소</a></h6>
    <br>
    <p class="card-text" style="height:20px; margin-bottom:6px;">공고요청 필드</p>
    <p class="card-text" style="height:20px; margin-bottom:6px;">공고요청 지역</p>
    <span style="font-size:15px;">시작일(남은시간)</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span style="font-size:15px;">조회수 : ` + item.viewCount + `</span>
  </div>

</div>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${pageContext.request.getContextPath()}/resources/assets/js/generalUpdate.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
  window.onload = function() {
	  
    // 관심 분야 리스트 불러오기
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          let skillList = JSON.parse(xhr.responseText); 
          for(var skill of skillList) {
            var addHtml = `<span style="cursor:pointer; margin:2px;" class="interestSkills badge badge-pill badge-secondary">` + skill.name + `</span>`
            $("#int_available").append(addHtml);
          }
         }               
       }
      }    
    xhr.open('GET', '../field/listOfUserInterest', false); 
    xhr.send();
	  
    if(document.getElementsByName("checkbox_p").length > 0) {
      return;
    }
    
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
	    if (xhr.readyState == 4) {
        if (xhr.status == 200) {
          let obj = JSON.parse(xhr.responseText);
          for(idx in obj) {
            var addHtml = `<div class="iqs-item">       
            <label class="form-checkbox form-checkbox-primary">
              <input class="field" type="checkbox" name="checkbox_p">` + obj[idx].name + `</label>`
            $("#selectField").append(addHtml);
            $("#int_selectField").append(addHtml);
         }               
       }
	    }
    };
    xhr.open('GET', '../field/list', true); 
    xhr.send();
  };  

  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  /*
  var filter = function() {
	  console.log("Filter()");
    let data = {};
    data.skillList = [];
    var skillList = document.querySelectorAll("#filter_field .selectedSkills");
    for(let skill of skillList) {
      data.skillList.push(skill.innerText);
    }
    data.orderCount = $("#orderCount option:selected").val()
    
    var convertedData = JSON.stringify(data);
    
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
        if (xhr.readyState == 4) {
          if (xhr.status == 200) {
              let obj = JSON.parse(xhr.responseText);
              console.log("OBJ : ", obj);
              $("#portfolio_field > div").remove();
              for(let item of obj) {
                //console.log(item.thumbnail);
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
                              <img src="../../upload/portfolio/` + item.thumbnail + `_300x300.jpg" width="200" height="200">
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
    xhr.open('POST', 'listByFilter');
    xhr.setRequestHeader('Content-Type', 'application/json'); 
    xhr.send(convertedData);
};


window.onload = function() {
	let data = {};
	data.field = $("#field").val();
	data.orderCount = $("#orderCount").val();
	var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = () => {
      if (xhr.readyState == 4) {
          if (xhr.status == 200) {
        	  let obj = JSON.parse(xhr.responseText);
        	  for(let item of obj) {
        		  //console.log(item.thumbnail);
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
        	                  <img src="../../upload/portfolio/` + item.thumbnail + `_300x300.jpg" width="200" height="200">
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

$(document).ready(function(){
	$("#fields").change(function() {
		
		let fieldName = $("#fields option:selected").val();
		$("#skills").empty();
		$("#skills").append(`<option id="allField" class="fieldList">기술전체</option>`);
		var xhr = new XMLHttpRequest();
		  xhr.onreadystatechange = () => {
		      if (xhr.readyState == 4) {
		          if (xhr.status == 200) {
		            let makeHtml = "";
		            let obj = JSON.parse(xhr.responseText);
		            for(let field of obj) {
		            	makeHtml += `<option class="fieldList">` + field.name + `</option>`;
		            }
		            $("#skills").append(makeHtml);
		          }
		      }
		  };
		  xhr.open('GET', '../skill/list?selected=' + fieldName, false);
		  xhr.send();
	});
});

$(document).ready(function(){
	$("#skills").change(function() {
	  let skillName = $("#skills option:selected").val()
	  
	  var list = document.querySelectorAll("#filterSkills .selectedSkills");
	  for(var item of list) {
		  if(item.innerText===skillName) {
			  return;
		  }
	  }
	  
	  $("#filterSkills").append(
	      `<span style="cursor:pointer; margin:2px;" class="selectedSkills badge badge-pill badge-secondary">` + skillName + `</span>`
	      );
	  
	  filter();
	});
});
$(document).ready(function(){
	$("#orderCount").change(function() {
	  console.log($(this));
	  filter();
	});
});

$("#filter_field").on("click", ".selectedSkills", function(){
	$(this).remove();
	filter();
});
*/
</script>

<!-- 관심 분야 탭 -->
<script>
</script>