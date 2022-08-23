<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/member.css">
</head>
<body>
	<h1>관리자용</h1>

	<h2>회원정보 목록</h2>
	<table class="table table-bordered">
		<tr>
			<th colspan="1">아이디</th>
			<th colspan="1">비밀번호</th>
			<th colspan="1">이름</th>
			<th colspan="1">전화번호</th>
			<th colspan="1">주소</th>
			<th colspan="1">이메일</th>
			<th colspan="1">회원가입</th>
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
	<jsp:include page="../include/footer.jsp" />



</body>
</html>