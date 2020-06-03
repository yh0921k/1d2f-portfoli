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
								<input type="radio" name="fruit" value=""> 경력
							</div>

							<div style="padding-left: 60px;">
								<input type="radio" name="fruit" value="" /> 신입
							</div>
							<br> <br>
							<!-----------------------------------------/경력신입체크---------------------------------------------->
							<div>

								<div class="form-label-group mb-3 ml-1">
									<select id="overYear"
										class="bs-select form-label-group form-control-clean col-md-15 mt--5"
										name='overYear'>
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

								<div class="form-label-group mb-3 ml-1">
									<select id="lessYear"
										class="bs-select form-label-group form-control-clean col-md-15 mt--5"
										name='overYear'>
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
								class="bs-select form-label-group form-control-clean col-md-7 mt--5"
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
								class="bs-select form-label-group form-control-clean col-md-9 mt--5"
								id="inputGroupSelect06" name="generalMember.number">
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
								class="bs-select form-label-group form-control-clean col-md-10 mt--5"
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

			<div class="highcon2" style="width: 15%; height: 100%; float: left;">
				<p>조회건수</p>
			</div>
			<div class="highcon2"
				style="width: 85%; height: 100%; background-color:darkgray; float: left;">
				<p>Breadcrumb</p>
			</div>

		</div>
		<!-- highcon2 /div -->


	</div>
	<!-- highContents /div -->



	<div class="rowContents"
		style="width: 100%; height: 55%; margin: auto; float: left;">

		<br>
		<div style="float: right; margin: auto; padding: 3px;">
			<select class="form-control form-control-pill bs-select"
				title="Please Select...">
				<option value="0">경력순</option>
				<option value="1">학력순</option>
			</select>
		</div>
		<br> <br>

		<table class="table table-striped table-hover">
			<thead>
				<th>이름</th>
				<th>경력</th>
				<th>포트폴리오</th>
				<th>기술/툴</th>
			</thead>
			<tbody>
				<td>이름</td>
				<td>경력</td>
				<td>포트폴리오</td>
				<td>기술</td>
			</tbody>
		</table>

	</div>
	<!-- rowContents /div -->


</div>

<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

