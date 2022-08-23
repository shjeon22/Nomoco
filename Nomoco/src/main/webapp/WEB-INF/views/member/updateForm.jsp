<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css">
</head>
<body>
<!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>
    <section class="bg-success py-5" style="height: 200px">
        <div class="container">
            <div class="row align-items-center py-5"><h1 style="color: white;">${id }님의 회원정보수정</h1>
                <div class="col-md-8 text-white">
                </div>
                
            </div>
        </div>
    </section>
		<!-- ACTION 속성값이 없는경우 자신의 주소를 호출  -->
		<fieldset>
<legend></legend>
<!-- ACTION 속성값이 없는경우 자신의 주소를 호출  -->
	<form action="/member/update" method="post" name="fr">
		아이디 <input type="text" name="id" value="${id }" readonly><br>
		비밀번호 <input type="password" name="pw" placeholder="비밀번호를 입력하세요" required><br>
		이름 <input type="text" name="name" value="${memberVO.name } "><br>
		전화번호 <input type="text" name="tel" value="${memberVO.tel}"><br>
		이메일 <input type="text" name="email" value="${memberVO.email }"><br>
		주소 <input type="text" name="address" value="${memberVO.address }"><br>
		 마지막 정보 수정일: ${memberVO.updatedate }
		<input type="submit" class="btn btn-block btn-info" value="회원정보수정하기">
		<input type="button" class="btn btn-block btn-success" value="메인으로" onclick="location.href='/member/index'">
		<input type="button"  class="btn btn-block btn-warning"  value="마이페이지" onclick="location.href='/member/mypage'">
	</form>
</fieldset>
		
</html>
<jsp:include page="../include/footer.jsp" />