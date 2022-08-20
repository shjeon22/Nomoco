<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<h1>info.jsp</h1>
	<h2>${id}회원정보 출력</h2>

	아이디 :${memberVO.id }  
	<br> 비밀번호 :${memberVO.pw }
	<br> 이름: ${memberVO.name }
	<br> 전화번호 : ${memberVO.tel }
	<br> 이메일 : ${memberVO.email }
	<br> 주소 : ${memberVO.address}
	<br> 회원가입일 : ${memberVO.regdate }
	<br>
<h3><a href="${pageContext.request.contextPath }/member/index">메인페이지</a></h3>
<h3><a href="${pageContext.request.contextPath }/member/mypage">마이페이지</a></h3>
</body>
<jsp:include page="../include/footer.jsp" />
</html>