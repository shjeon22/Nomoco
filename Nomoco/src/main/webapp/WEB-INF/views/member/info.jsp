<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/member.css">
</head>

<body>

	<!-- Modal -->
	<div class="modal fade bg-white" id="templatemo_search" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="w-100 pt-1 mb-5 text-right">
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<form action="" method="get"
				class="modal-content modal-body border-0 p-0">
				<div class="input-group mb-2">
					<input type="text" class="form-control" id="inputModalSearch"
						name="q" placeholder="Search ...">
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>



	<section class="bg-success py-5" style="height: 200px">
		<div class="container">
			<div class="row align-items-center py-5">
				<h1 style="color: white;">${id }님의회원정보</h1>
				<div class="col-md-8 text-white"></div>

			</div>
		</div>
	</section>

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

		<tr>
			<td>${memberVO.id }</td>
			<td>${memberVO.pw }</td>
			<td>${memberVO.name }</td>
			<td>${memberVO.tel }</td>
			<td>${memberVO.address}</td>
			<td>${memberVO.email }</td>
			<td>${memberVO.regdate }</td>
		</tr>

	</table>

	<h3>
		<a href="${pageContext.request.contextPath }/member/mypage"
			class="btn btn-block btn-warning btn-lg">마이페이지 </a>
	</h3>
	<h3>
		<a href="${pageContext.request.contextPath }/member/index"
			class="btn btn-block btn-success btn-lg">메인페이지</a>
	</h3>
</body>
<jsp:include page="../include/footer.jsp" />
</html>