<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- div =  container > highContetns , rowContents > highcon > high  -->

<div class="container" style="height:1000px; padding: 30px 0px;">

<div class="row">
    <div class="col-3 col-lg-3">
			<!-------------------------------------------경력--------------------------------------------------->
				<div class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div style="height:300px;"  class="card-body">

						<h5 class="card-title">경력</h5>

						<div class="input-group mb-3 ml-1">
							<!------------------------------------------경력신입체크---------------------------------------------->

							<div style="padding-right: 60px;">
								<input id="radioCareer" type="radio" name="fruit" value=""> 경력
							</div>

							<div style="padding-left: 60px;">
								<input id="radioNew" type="radio" name="fruit" value="" /> 신입
							</div>
							<br> <br>
							<!-----------------------------------------/경력신입체크---------------------------------------------->
							<div>

								<div class="overLessYear form-label-group mb-3 ml-1">
									<select id="overYear"
										class="bs-select form-label-group form-control-clean col-md-15 mt--5"
										name='overYear'>
										<option value=0>최소경력</option>
										<option value=1>1년 이상</option>
										<option value=2>2년 이상</option>
										<option value=3>3년 이상</option>
										<option value=4>4년 이상</option>
										<option value=5>5년 이상</option>
										<option value=6>6년 이상</option>
										<option value=7>7년 이상</option>
										<option value=8>8년 이상</option>
										<option value=9>9년 이상</option>
									</select>
								</div>

								<div class="overLessYear form-label-group mb-3 ml-1">
									<select id="lessYear"
										class="bs-select form-label-group form-control-clean col-md-15 mt--5"
										name='overYear'>
										<option value=0>최대경력</option>
										<option value=1>1년 이하</option>
										<option value=2>2년 이하</option>
										<option value=3>3년 이하</option>
										<option value=4>4년 이하</option>
										<option value=5>5년 이하</option>
										<option value=6>6년 이하</option>
										<option value=7>7년 이하</option>
										<option value=8>8년 이하</option>
										<option value=9>9년 이하</option>
									</select>
								</div>

							</div>

						</div>
					</div>
				</div>
				</div>


			<!------------------------------------------/경력--------------------------------------------------->
			<!------------------------------------------지역---------------------------------------------------->
    <div class="col-3 col-lg-3" style="z-index:1;">
				<div style="z-index:1;"
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div style="height:300px; z-index:1;"  class="card-body">
						<h5 class="card-title">지역</h5>
						
							<select
                style="z-index:100;"
                class="bs-select form-control form-label-group form-control-clean col-md-7 mt--5"
                data-ajax-target="#district_category"
                id="city_category" name="city_category"
                data-ajax-callback-function="selectedCity">
                <c:forEach items="${citys}" var="city">
                  <option value="${city.name}">${city.name}</option>
                </c:forEach>
              </select>
              
               <select
                class="bs-select form-control form-label-group form-control-clean col-md-7 mt--5"
                id="district_category" name="district_category"
                data-ajax-url="../district/list2"
                data-ajax-method="GET"
                data-ajax-callback-function="selectedDistrict">
                <c:forEach items="${districts}" var="district">
                  <option value="${district.districtNumber}">${district.name}</option>
                </c:forEach>
              </select>
							
					</div>
				</div>
				</div>


			<!-----------------------------------------/지역---------------------------------------------------->
			<!-----------------------------------------학력----------------------------------------------------->
<div class="col-3 col-lg-3" style="z-index:1;">
				<div style="z-index:1;"
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div style="height:300px;z-index:1;"  class="card-body">
						<h5 class="card-title">학력</h5>
						<div class="input-group mb-3 ml-1" style="z-index:1;">
							<select
								class="bs-select form-label-group form-control-clean col-md-12 mt--5"
								id="selectEducation" name="generalMember.number">
								<option value="0">학력전체</option>
								<c:forEach items="${educations}" var="education">
									<option value="${education.educationNumber}">${education.category}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
</div>

		
			<!----------------------------------------/학력----------------------------------------------------->
			<!---------------------------------------기술,툴----------------------------------------------------->
<div class="col-3 col-lg-3" style="z-index:1;">
				<div style="z-index:1;"
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div style="height:300px;z-index:1; "  class="card-body">
						<h5 class="card-title">기술/툴</h5>
						<div class="input-group mb-3 ml-1" style="z-index:1;">
							<select
								class="bs-select form-label-group form-control-clean col-md-12 mt--5"
								id="inputGroupSelect07" name="skill.number">
								<c:forEach items="${skills}" var="skill">
									<option value="${skill.number}">${skill.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
</div>


			<!--------------------------------------/기술,툴----------------------------------------------------->
        </div>
<hr>

		<div class="row" style="z-index:0;">
      <div class="col-2 col-lg-2">
        <div class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-danger bl-0 br-0 bb-0 bw--2">
          <div id="searchCount" class="card-body" style="height:150px">
            <p>조회수</p>
          </div>
        </div>
      </div>
      
      <div class="col-10 col-lg-10" style="z-index:0;">
        <div id="filterField" style="z-index:0;" class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-danger bl-0 br-0 bb-0 bw--2">
          <div id="filterList" class="card-body" style="height:150px; z-index:0;">
            <p>Filter</p>
          </div>
        </div>
      </div>
    </div>
<hr>


  <!-- 테이블 출력 부분 -->
  <div class="row">
    <div class="col-12 col-lg-12">
      <div style="z-index:-1;" class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-primary bl-0 br-0 bb-0 bw--2">
        <div id="searchTable" class="card-body" style="height:150px">
        
			    <div style="display:inline-block" class="dataTables_length" id="rand_yjK_length">
			      <label>
			        <select id="orderCount" name="rand_yjK_length" aria-controls="rand_yjK" class="custom-select custom-select-sm form-control form-control-sm">
			          <option id="viewCareer" class="count">경력순</option>        
			          <option id="viewEducation" class="count">학력순</option>
			        </select>
			      </label>
			    </div>
        
          <table class="table table-striped table-hover">
            <thead>
			        <th>이름</th>
			        <th>경력구분</th>
			        <th>포트폴리오</th>
			        <th>관심지역</th>
			        <th>보유기술</th>
            </thead>
            <tbody>
			        <td>이름</td>
			        <td>경력구분</td>
			        <td>포트폴리오</td>
			        <td>지역</td>
			        <td>기술</td>
            </tbody>
          </table>        
        </div>
      </div>
    </div>
  </div>
<!-- 테이블 출력 부분 -->


</div>

<style>
	.bs-select.form-label-group.form-control-clean.col-md-12.mt--5.js-bselectified{
		z-index:1;
	}
</style>


<script>
window.onload = function() {
	$(".overLessYear").hide();
};

$("#radioNew").click(function() {
	$(".overLessYear").hide();
});

$("#radioCareer").click(function() {
	$(".overLessYear").show();
});

$("#overYear").change(function(){
	let startIdx = $("#overYear option").index($("#overYear option:selected"));
	
	if($("#overYear option:selected").val() == 0) {
		return;
	}
	
	let compare = document.querySelectorAll("#filterList .careerEnd");
	if($(compare).length > 0 && $("#overYear option:selected").text().charAt(0) > $(compare).text().charAt(0)) {
		return;
	}
	
	let current = document.querySelectorAll("#filterList .careerStart");
	if(current.length) {
		$(current).remove();
	}	
	
	let item = $("#overYear option:selected").text();
	$("#filterField #filterList").append(
			`<span style="cursor:pointer; margin:2px;" class="careerStart badge badge-pill badge-secondary">` + item + `</span>`
			);
});

$("#lessYear").change(function(){
  let startIdx = $("#lessYear option").index($("#lessYear option:selected"));
  
  if($("#lessYear option:selected").val() == 0) {
    return;
  }
  
  let compare = document.querySelectorAll("#filterList .careerStart");
  if($(compare).length > 0 && $("#lessYear option:selected").text().charAt(0) < $(compare).text().charAt(0)) {
    return;
  }
  
  let current = document.querySelectorAll("#filterList .careerEnd");
  if(current.length) {
    $(current).remove();
  } 
  
  let item = $("#lessYear option:selected").text();
  $("#filterField #filterList").append(
      `<span style="cursor:pointer; margin:2px;" class="careerEnd badge badge-pill badge-secondary">` + item + `</span>`
      );
});
	
$("#selectEducation").change(function(){
  let startIdx = $("#selectEducation option").index($("#selectEducation option:selected"));
  
  if($("#selectEducation option:selected").val() == 0) {
    return;
  }
  
  let current = document.querySelectorAll("#filterList .selectEdu");
  if(current.length) {
    $(current).remove();
  } 
  
  let item = $("#selectEducation option:selected").text();
  $("#filterField #filterList").append(
      `<span style="cursor:pointer; margin:2px;" class="selectEdu badge badge-pill badge-secondary">` + item + `</span>`
      );
});

$("#filterField").on("click", "#filterList .badge", function(){
	  $(this).remove();
});

function selectedCity(el, value, label) {
	<%-----city로 작업할경우 코드 들어갈 곳 도시번호------%>  
	  console.log(value, label)
	<%-----city로 작업할경우 코드 들어갈 곳 도시번호------%>
	}

	function selectedDistrict(el, value, label) {
	<%-----district로 작업할경우 코드 들어갈 곳 도시번호------%>
	  
	  console.log(value, label)
	<%-----district로 작업할경우 코드 들어갈 곳 도시번호------%>
	}


	$.SOW.core.ajax_select.init('#city_category');
	$.SOW.core.ajax_select.init('#district_category');
</script>