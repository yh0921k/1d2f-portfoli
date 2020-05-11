function execPostCode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 도로명 조합형 주소 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', '
							+ data.buildingName : data.buildingName);
				}
				// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = ' (' + extraRoadAddr + ')';
				}
				// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
				if (fullRoadAddr !== '') {
					fullRoadAddr += extraRoadAddr;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				console.log(data.zonecode);
				console.log(fullRoadAddr);

				document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('addr2').value = fullRoadAddr;
			}
		}).open();
	}

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
	
	function catSchool(cat) {
		document.getElementById('schoolCat').innerHTML=cat;
		document.getElementById('word').value='';
		$("#schoolList").empty(); 
		
	}
	
	function search(target){ 
		var schoolCat = document.getElementById('schoolCat');
		var word = target.value; 
		var encodeWord = encodeURI(word); 
		var temp = '';
		console.log(schoolCat.innerHTML);
		console.log(word); 
		console.log(encodeWord); 
		
		if(schoolCat.innerHTML == '초등학교') {
			temp = 'elem_list';
		} else if(schoolCat.innerHTML == '중학교'){
			temp = 'midd_list';
		} else if(schoolCat.innerHTML == '고등학교') {
			temp = 'high_list';
		}else {
			temp = 'univ_list';
		}
		
		//start Ajax 
		$.ajax({ 
			type : 'GET', 
			dataType : 'json', 
			url : "http://www.career.go.kr/cnet/openapi/getOpenApi?" 
					+"apiKey=79f4c78e6e1efe4d170ee4cde0181d57" 
					+"&svcType=api&svcCode=SCHOOL&contentType=json&gubun=" 
					+ temp
					+"&searchSchulNm="+word, 
					error : function(err) { 
						console.log("실행중 오류가 발생하였습니다."); 
						}, 
						success : function(data) { 
							$("#schoolList").empty(); 
							var checkWord = $("#word").val(); //검색어 입력값 
							if(checkWord.length > 0 && data.dataSearch.content.length > 0){ 
								for (i = 0; i < data.dataSearch.content.length; i++) { 
									$("#schoolList") 
										.append( 
												"<li class='list-group-item' onclick='submitSchool(this)' value='" 
												+ data.dataSearch.content[i].schoolName 
												+ "' data-input='" 
												+ data.dataSearch.content[i].schoolName 
												+ ">" 
												+ "<a href='javascript:void(0);'>" 
												+ data.dataSearch.content[i].schoolName 
												+ "</a>" 
												+ "</li>"); 
									} 
								} 
							} 
						});//end Ajax 
						}
	
	function submitSchool(searched) {
		var school = searched.getAttribute('value');
		document.getElementById('word').value=school;
		$("#schoolList").empty(); 
	}
