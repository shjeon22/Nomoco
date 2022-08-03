<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--jstl라이브러리 사용  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  	<h1>관리자용</h1>
  	
  	<h2> 회원정보 목록 </h2>
  	
  	<table border="1">
  		<tr>
  		   <td>아이디</td>
  		   <td>비밀번호</td>
  		   <td>이름</td>
  		   <td>전화번호</td>
  		   <td>주소</td>
  		   <td>이메일</td>
  		   <td>회원가입일</td>
  		</tr>
  		
  		<c:forEach var="member" items="${memberList }">
	  		<tr>
	  		   <td>${member.id }</td>
	  		   <td>${member.pw }</td>
	  		   <td>${member.name }</td>
	  		   <td>${member.tel }</td>
	  		   <td>${member.address }</td>
	  		   <td>${member.email }</td>
	  		   <td>${member.regdate }</td>
	  		</tr>
  		</c:forEach>
  		
  	</table>
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	

</body>
</html>