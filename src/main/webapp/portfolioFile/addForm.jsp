<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포트폴리오 파일 등록</title>
</head>
<body>

	<h1>포트폴리오 파일 등록</h1>
	<form action='add' method='post' enctype='multipart/form-data'>
		게시글 번호: <input name='boardNumber' type='number'><br>
		 파일 주소: <input name='filePath' type='file'><br>
		<button>제출</button>
	</form>



</body>
</html>