<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    <jsp:include page="../include/header.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<legend>회원정보수정</legend>
<!-- ACTION 속성값이 없는경우 자신의 주소를 호출  -->
	<form action="/member/update" method="post" name="fr">
		아이디 <input type="text" name="id" value="${id }" readonly><br>
		비밀번호 <input type="password" name="pw" placeholder="비밀번호를 입력하세요" required><br>
		이름 <input type="text" name="name" value="${memberVO.name } "><br>
		전화번호 <input type="text" name="tel" value="${memberVO.tel}"><br>
		이메일 <input type="text" name="email" value="${memberVO.email }"><br>
		주소 <input type="text" name="address" value="${memberVO.address }"><br>
		 마지막 정보 수정일: ${memberVO.updatedate }
		<input type="submit" class="btn" value="회원정보수정하기">
		<input type="button" class="btn" value="메인으로" onclick="location.href='/member/index'">
		<input type="button" class="btn" value="마이페이지" onclick="location.href='/member/mypage'">
	</form>
</fieldset>
</html>
<jsp:include page="../include/footer.jsp" />