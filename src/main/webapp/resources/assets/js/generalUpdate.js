$(function() {
	$(document).find("input[name=issueDate]")
	.removeClass('hasDatepicker').datepicker({
		dateFormat : "yy-mm-dd",
		changeYear : "true"
	});
$(document).find("input[name=expireDate]")
	.removeClass('hasDatepicker').datepicker({
		dateFormat : "yy-mm-dd",
		changeYear : "true"
	});
});

// 다음 주소 찾기 api
function execPostCode() {
	new daum.Postcode({
		oncomplete : function(data) {
			var fullRoadAddr = data.roadAddress;
			var extraRoadAddr = '';
			if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
				extraRoadAddr += data.bname;
			}
			if (data.buildingName !== '' && data.apartment === 'Y') {
				extraRoadAddr += (extraRoadAddr !== '' ? ', '
						+ data.buildingName : data.buildingName);
			}
			if (extraRoadAddr !== '') {
				extraRoadAddr = ' (' + extraRoadAddr + ')';
			}
			if (fullRoadAddr !== '') {
				fullRoadAddr += extraRoadAddr;
			}

			document.getElementById('addr1').value = data.zonecode;
			document.getElementById('addr2').value = fullRoadAddr;
		}
	}).open();
}

// 회원 탈퇴
function check() {

	var delete1 = document.getElementById('requiredDelete1').checked;
	var delete2 = document.getElementById('requiredDelete2').checked;
	var delete3 = document.getElementById('requiredDelete3').checked;
	if (delete1 && delete2 && delete3) {
		return true;
	} else {
		alert("탈퇴 안내에 모두 동의해 주세요.");
		return false;
	}
}

// 학교 검색
function catSchool(cat) {
	document.getElementById('schoolCat').innerHTML = cat;
	document.getElementById('word').value = '';
	$("#schoolList").empty();

}

function search(target) {
	var schoolCat = document.getElementById('schoolCat');
	var word = target.value;
	var encodeWord = encodeURI(word);
	var temp = '';

	console.log(schoolCat.innerHTML);
	console.log(word);
	console.log(encodeWord);

	if (schoolCat.innerHTML == '초등학교') {
		temp = 'elem_list';
	} else if (schoolCat.innerHTML == '중학교') {
		temp = 'midd_list';
	} else if (schoolCat.innerHTML == '고등학교') {
		temp = 'high_list';
	} else {
		temp = 'univ_list';
	}

	// start Ajax
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : "http://www.career.go.kr/cnet/openapi/getOpenApi?"
				+ "apiKey=79f4c78e6e1efe4d170ee4cde0181d57"
				+ "&svcType=api&svcCode=SCHOOL&contentType=json&gubun=" + temp
				+ "&searchSchulNm=" + word,
		error : function(err) {
			console.log("실행중 오류가 발생하였습니다.");
		},
		success : function(data) {
			$("#schoolList").empty();
			var checkWord = $("#word").val(); // 검색어 입력값
			if (checkWord.length > 0 && data.dataSearch.content.length > 0) {
				for (var i = 0; i < data.dataSearch.content.length; i++) {
					$("#schoolList").append(
							"<li class='list-group-item' onclick='submitSchool(this)' value='"
									+ data.dataSearch.content[i].schoolName
									+ "' data-input='"
									+ data.dataSearch.content[i].schoolName
									+ ">" + "<a href='javascript:void(0);'>"
									+ data.dataSearch.content[i].schoolName
									+ "</a>" + "</li>");
				}
			}
		}
	});
}

function submitSchool(searched) {
	var school = searched.getAttribute('value');
	document.getElementById('word').value = school;
	$("#schoolList").empty();
}

function searchCert() {
	var schoolCat = document.getElementById('schoolCat');
	var word = target.value;
	var encodeWord = encodeURI(word);
	var temp = '';
	if (schoolCat.innerHTML == '초등학교') {
		temp = 'elem_list';
	} else if (schoolCat.innerHTML == '중학교') {
		temp = 'midd_list';
	} else if (schoolCat.innerHTML == '고등학교') {
		temp = 'high_list';
	} else {
		temp = 'univ_list';
	}

	// start Ajax
	$.ajax({
		type : 'GET',
		dataType : 'json',
		url : "http://www.career.go.kr/cnet/openapi/getOpenApi?"
				+ "apiKey=79f4c78e6e1efe4d170ee4cde0181d57"
				+ "&svcType=api&svcCode=SCHOOL&contentType=json&gubun=" + temp
				+ "&searchSchulNm=" + word,
		error : function(err) {
			console.log("실행중 오류가 발생하였습니다.");
		},
		success : function(data) {
			$("#schoolList").empty();
			var checkWord = $("#word").val(); // 검색어 입력값
			if (checkWord.length > 0 && data.dataSearch.content.length > 0) {
				for (var i = 0; i < data.dataSearch.content.length; i++) {
					$("#schoolList").append(
							"<li class='list-group-item' onclick='submitSchool(this)' value='"
									+ data.dataSearch.content[i].schoolName
									+ "' data-input='"
									+ data.dataSearch.content[i].schoolName
									+ ">" + "<a href='javascript:void(0);'>"
									+ data.dataSearch.content[i].schoolName
									+ "</a>" + "</li>");
				}
			}
		}
	});
}

// 자격증 검색
$(function() {
	var list = [];

	$.ajax({
		type : 'get',
		url : "/portfoli/app/certificate/listCert",
		dataType : "json",
		success : function(data) {
			$.each(data, function() {
				list.push(this.toString());
			});
			return list;
		}
	});

	$("#searchCert")
			.autocomplete(
					{

						source : list,
						select : function(event, ui) {
							$("#certsList")
									.append(
											"<tr>"
													+ "<td><input readonly type='text' class='form-control form-control-sm' value="
													+ ui.item.value
													+ "></td>"
													+ "<td><input type='text' class='form-control form-control-sm' name='issueDate' value=''/></td>"
													+ "<td><input type='text' class='form-control form-control-sm' name='expireDate' value=''/></td>"
													+ "<td><button type='button' onclick='deleteLine(this) ' "
													+ "style='padding: 0; border: none; background: none;'>"
													+ "<i class='fi fi-close'></i></button>"
													+ "</td>" + "</tr>");
							$(document).find("input[name=issueDate]")
									.removeClass('hasDatepicker').datepicker({
										dateFormat : "yy-mm-dd",
										changeYear : "true"
									});
							$(document).find("input[name=expireDate]")
									.removeClass('hasDatepicker').datepicker({
										dateFormat : "yy-mm-dd",
										changeYear : "true"
									});
						},
						focus : function(event, ui) {
							return false;
						}

					});

});

// 엔터 막기
$('input[type="text"]').keydown(function() {
	if (event.keyCode === 13) {
		event.preventDefault();
	}
	;
});

// 라인 삭제
function deleteLine(obj) {
	$(obj).parent().parent().remove();
}
