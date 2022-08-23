<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/member.css">
</head>
<body>
<%
// 로그인 처리 -> 로그인 x (로그인페이지 이동)
String id = (String) session.getAttribute("id");
if( id == null ){
	 response.sendRedirect("/test/member/login");
}
%> 
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
            <div class="row align-items-center py-5"><h1 style="color: white;">회원탈퇴</h1>
                <div class="col-md-8 text-white">
                </div>
                
            </div>
        </div>
    </section>
<fieldset>
	<form action="/member/delete" method="post">
	<!-- input타입중 hidden은 화면에 있는 해당 input태그를 숨겨서 정보 전달   -->
		아이디 : <input type="text" name="id" value="${id }" readonly><br>
		비밀번호 : <input type="password" name="pw" placeholder="비밀번호를 입력해주세요"><br>
		<input type="submit" class="btn btn-block btn-danger" value="탈퇴하기">
		<input type="button" class="btn btn-block btn-warning" value="뒤로가기" onclick="location.href='/member/index'">
	</form>
</fieldset>
</body>
</html>
<jsp:include page="../include/footer.jsp" />