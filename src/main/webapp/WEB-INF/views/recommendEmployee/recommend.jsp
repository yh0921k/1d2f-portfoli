<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container"
	style="width: 2000px; height: 1500px; padding: 30px 0px;">


	<div class="highContents"
		style="width: 100%; height: 45%; margin: auto; float: left;">

		<div class="highcon1" style="width: 100%; height: 70%; float: left;">

			<div clss="high1" style="width: 15%; height: 100%; float: left;">
				<p>경력</p>
				
				<div style="margin:3px; padding:3px; ">
				<input type="radio" name="fruit" value="사과" /> 경력 
				<input type="radio" name="fruit" value="바나나" checked="checked" /> 신입
			  </div>
				<select
					class="bs-select form-label-group form-control-clean col-md-5 mt--5"
					id="inputGroupSelect06" name="generalMember.number">
					<c:forEach items="${memCareers}" var="memCareer">
						<option value="${memCareer.number}">${memCareer.career}</option>
					</c:forEach>
				</select>
			</div>

			<div class="high2" style="width: 20%; height: 100%; float: left;">
				<p>지역</p>
				<select
					class="bs-select form-label-group form-control-clean col-md-5 mt--5"
					id="inputGroupSelect06" name="generalMember.number">
					<c:forEach items="${districts}" var="district">
						<option value="${districtNumber.number}">${district.name}</option>
					</c:forEach>
				</select>
			</div>

			<div class="high3"
				style="width: 20%; height: 100%; float: left;">
				<p>학력</p>
				<select
          class="bs-select form-label-group form-control-clean col-md-5 mt--5"
          id="inputGroupSelect06" name="generalMember.number">
          <c:forEach items="${educations}" var="education">
            <option value="${education.educationNumber}">${education.category}</option>
          </c:forEach>
        </select>
			</div>

			<div class="high4"
				style="width: 45%; height: 100%; background-color: coral; float: left;">
				<p>기술/툴 드롭다운</p>
			</div>
		</div>


		<div class="highcon2"
			style="width: 100%; height: 30%; background-color: dimgrey; float: left;">

			<div class="highcon2"
				style="width: 15%; height: 100%; background-color: chocolate; float: left;">
				<p>전체 5,135 건</p>
			</div>
			<div class="highcon2"
				style="width: 85%; height: 100%; background-color: burlywood; float: left;">
				<p>스택</p>
			</div>

		</div>


	</div>



	<div class="rowContents"
		style="width: 100%; height: 55%; background-color: orange; margin: auto; float: left;">

		<div class="row1"
			style="width: 15%; height: 100%; background-color: purple; float: left;">
			<p>이름</p>
		</div>

		<div class="row2"
			style="width: 15%; height: 100%; background-color: aqua; float: left;">
			<p>경력</p>
		</div>

		<div class="row3"
			style="width: 30%; height: 100%; background-color: brown; float: left;">
			<p>포트폴리오 (게시글 누르면 해당 게시글로 이동)</p>
		</div>

		<div class="row4"
			style="width: 30%; height: 100%; background-color: cadetblue; float: left;">
			<p>기술틀</p>
		</div>

		<div class="row4"
			style="width: 10%; height: 100%; background-color: fuchsia; float: left;">
			<p>개수,경력순 드롭다운</p>
		</div>
	</div>


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

