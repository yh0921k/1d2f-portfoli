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
      <p>새 포트폴리오파일을 등록했습니다.</p>
      <%String filename = (String)request.getSession().getAttribute("filename"); %>
      <img src='../upload/portfoliofile/<%=filename%>'/>


</body>
</html>