<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp" />

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
				<button type="submit" class="input-group-text bg-success text-light">
					<i class="fa fa-fw fa-search text-white"></i>
				</button>
			</div>
		</form>
	</div>
</div>
<section class="bg-success py-5" style="height: 200px">
	<div class="container">
		<div class="row align-items-center py-5">
			<h1 style="color: white;">${id }님마이 페이지</h1>
			<div class="col-md-8 text-white"></div>
			<div class="col-md-4">
				<img src="" style="size: 30px" alt="">
			</div>
		</div>
	</div>
</section>
<!-- Close Banner -->

<!-- Start Section -->
<section class="container py-5">
	<div class="row text-center pt-5 pb-3">
		<div class="col-lg-6 m-auto">
			<h1 class="h1">회원정보 관리</h1>
			<p>원하시는 메뉴를 클릭하여 서비스를 이용하시기 바랍니다.</p>
		</div>
	</div>
	<form action="/member/mypage" method="post">
		<div class="row">
			<div class="col-md-6 col-lg-3 pb-5">
				<a href="/member/info">
					<div class="h-100 py-5 services-icon-wap shadow"
						style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
						<div class="h1 text-success text-center">
							<i class="fa fa-user"></i>
						</div>
						<h2 class="h5 mt-4 text-center">회원정보 조회</h2>
					</div>
				</a>
			</div>
			</a>
			
			
			
			<div class="col-md-6 col-lg-3 pb-5">
				<a href="/member/update">
					<div class="h-100 py-5 services-icon-wap shadow"
						style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
						<div class="h1 text-success text-center">
							<i class="fas fa-exchange-alt"></i>
						</div>
						<h2 class="h5 mt-4 text-center">회원정보 수정</h2>
					</div>
				</a>
			</div>
			</a>

			<div class="col-md-6 col-lg-3 pb-5">
				<a href="/member/delete">
					<div class="h-100 py-5 services-icon-wap shadow"
						style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
						<div class="h1 text-success text-center">
							<i class="fa fa-percent"></i>
						</div>
						<h2 class="h5 mt-4 text-center">회원탈퇴</h2>
					</div>
				</a>
			</div>
			</a>

			<div class="col-md-6 col-lg-3 pb-5">
				<a href="#"> <a
					class="navbar-sm-brand text-light text-decoration-none"
					href="mailto:info@company.com"><div
							class="h-100 py-5 services-icon-wap shadow"
							style="border: solid gray; box-shadow: 5px 5px 5px 5px gray; border-radius: 10px;">
							<div class="h1 text-success text-center">
								<i class="fa fa-user"></i>
							</div>
							<h2 class="h5 mt-4 text-center">
								<i class="fa fa-envelope mx-2" style="color: blue"></i><span
									style="color: black;">문의하기 <br>shjeon510@gmail.com
								</span></a>
				</h2>
				</a>
			</div>
		</div>
		</a>
		</div>
	</form>
</section>
<!-- End Section -->


<script>
	var result = '${result}';

	if (result == "UPOK") {
		alert('회원정보가 수정되었습니다.');
	}

</script>

<jsp:include page="../include/footer.jsp" />