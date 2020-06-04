<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- div =  container > highContetns , rowContents > highcon > high  -->

<div class="container"
	style="width: 2000px; height: 1500px; padding: 30px 0px;">


	<div class="highContents"
		style="width: 100%; height: 45%; margin: auto; float: left;">

		<div class="highcon1"
			style="width: 100%; height: 70%; float: left; text-align: center;">

			<!-------------------------------------------경력--------------------------------------------------->
			<div clss="high1"
				style="width: 24%; height: 100%; float: left; padding: 3px;">


				<div
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div class="card-body">

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
										<option value=10>10년 이상</option>
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
										<option value=10>10년 이하</option>
									</select>
								</div>

							</div>

						</div>
					</div>
				</div>

			</div>
			<!-- high1 /div -->
			<!------------------------------------------/경력--------------------------------------------------->
			<!------------------------------------------지역---------------------------------------------------->
			<div class="high2"
				style="width: 25%; height: 100%; float: left; padding: 3px;">

				<div
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div class="card-body">
						<h5 class="card-title">지역</h5>
						<div class="input-group mb-3 ml-1">
							<select
								class="bs-select form-label-group form-control-clean col-md-12 mt--5"
								id="inputGroupSelect06" name="generalMember.number">
								<c:forEach items="${districts}" var="district">
									<option value="${districtNumber.number}">${district.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>


			</div>
			<!-- high2 /div -->
			<!-----------------------------------------/지역---------------------------------------------------->
			<!-----------------------------------------학력----------------------------------------------------->
			<div class="high3"
				style="width: 26%; height: 100%; float: left; padding: 3px;">

				<div
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div class="card-body">
						<h5 class="card-title">학력</h5>
						<div class="input-group mb-3 ml-1">
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
			<!-- high3 /div -->
			<!----------------------------------------/학력----------------------------------------------------->
			<!---------------------------------------기술,툴----------------------------------------------------->
			<div class="high4"
				style="width: 25%; height: 100%; float: left; padding: 3px;">

				<div
					class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-success bl-0 br-0 bb-0 bw--2">
					<div class="card-body">
						<h5 class="card-title">기술/툴</h5>
						<div class="input-group mb-3 ml-1">
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
			<!-- high4 /div -->
			<!--------------------------------------/기술,툴----------------------------------------------------->
		</div>
		<!-- highcon1 /div -->


		<div class="highcon2" style="width: 100%; height: 30%; float: left;">

		<div class="row">
      <div class="col-2 col-lg-2">
        <div class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-danger bl-0 br-0 bb-0 bw--2">
          <div id="searchCount" class="card-body" style="height:150px">
            <p>조회수</p>
          </div>
        </div>
      </div>
      
      <div class="col-10 col-lg-10">
        <div id="filterField" class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-danger bl-0 br-0 bb-0 bw--2">
          <div id="filterList" class="card-body" style="height:150px">
            <p>Filter</p>
          </div>
        </div>
      </div>
    </div>

		</div>
		<!-- highcon2 /div -->


	</div>
	<!-- highContents /div -->

  <!-- 테이블 출력 부분 -->
  <div class="row">
    <div class="col-12 col-lg-12">
      <div class="card shadow-md shadow-lg-hover transition-all-ease-250 transition-hover-top h-100 border-primary bl-0 br-0 bb-0 bw--2">
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
  
  let current = document.querySelectorAll("#filterList .careerEnd");
  if(current.length) {
    $(current).remove();
  } 
  
  let item = $("#selectEducation option:selected").text();
  $("#filterField #filterList").append(
      `<span style="cursor:pointer; margin:2px;" class="careerEnd badge badge-pill badge-secondary">` + item + `</span>`
      );
});

$("#filterField").on("click", "#filterList .badge", function(){
	  console.log("Test");
	  $(this).remove();
});
</script>