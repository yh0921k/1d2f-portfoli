<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>회원가입</title>
<script type="text/javascript">
function chkBizNumber() {
    var checkNum = new Array(1, 3, 7, 1, 3, 7, 1, 3, 5, 1); 
    var tmpBizNum, i, chkSum=0, c2, remander; 
    var bizNumber = document.form.businessRegistrationNumber.value.replace(/-/gi,''); 

     for (i=0; i<=7; i++) chkSum += checkNum[i] * bizNumber.charAt(i); 
     c2 = "0" + (checkNum[8] * bizNumber.charAt(8)); 
     c2 = c2.substring(c2.length - 2, c2.length); 
     chkSum += Math.floor(c2.charAt(0)) + Math.floor(c2.charAt(1)); 
     remander = (10 - (chkSum % 10)) % 10;

    if (Math.floor(bizNumber.charAt(9)) != remander) {
      alert("유효한 사업자 등록번호가 아닙니다.");
      return false;
    } else {
      return true;
    }
}
</script>
</head>
<body>

<h1>기업회원 가입</h1>
<form name='form' action='join' onsubmit='return chkBizNumber();' method='post'>
사업자등록번호: <input name='businessRegistrationNumber' type='text' maxlength='12'><br>
기업명: <input name='companyName' type='text'><br>
기업전화번호: <input name='companyTel' type='text'><br>
직책: <input name='position' type='text'><br>
아이디: <input name='id' type='text'><br>
이름: <input name='name' type='text'><br>
이메일: <input name='email' type='email'><br>
암호: <input name='password' type='password'><br>
전화번호: <input name='tel' class='phoneNumber' type='tel' maxlength='14'><br>
SMS 수신여부:<br>
동의 <input name='smsYN' type='radio' value='1' checked>
거부 <input name='smsYN' type='radio' value='2' checked><br>
이메일 수신여부:<br>
동의 <input name='emailYN' type='radio' value='1' checked>
거부 <input name='emailYN' type='radio' value='2' checked><br>
  <input type='submit' value='가입'>
</form>
</body>
</html>