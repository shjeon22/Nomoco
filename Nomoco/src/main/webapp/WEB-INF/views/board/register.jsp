<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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


<!-- Start Content Page -->
<div class="container-fluid bg-light py-5">
	<div class="col-md-6 m-auto text-center">
		<h1 class="h1">게시물 작성</h1>
		<p>내용을 작성해 주세요.</p>
	</div>
</div>


<!-- Start Contact -->
<div class="container py-5">
	<div class="row py-5">
		<form class="col-md-9 m-auto"
			action="${pageContext.request.contextPath }/board/register"
			method="post" role="form">
			<div class="row">
				<div class="form-group col-md-6 mb-3">
					<label for="inputname">작성자(ID)</label> <input type="text"
						class="form-control mt-1" id="writer" name="writer" value="${id}"
						readonly="readonly">
				</div>
				<div class="form-group col-md-6 mb-3">
					<label for="inputname">아이피(IP)</label> <input type="text"
						class="form-control mt-1" id="ip" name="ip" value="${ip }"
						readonly="readonly">
				</div>
			</div>
			<div class="mb-3">
				<label for="inputsubject">제목</label> <input type="text"
					class="form-control mt-1" id="title" name="title"
					placeholder="제목을 입력해주세요." required="required">
			</div>
			<div class="mb-3">
				<label for="inputmessage">내용</label>
				<textarea class="form-control mt-1" id="content" name="content"
					placeholder="내용을 입력해주세요" rows="8" required="required"></textarea>
			</div>
			<div class="row">
				<div class="col text-end mt-2">
					<button type="submit" class="btn btn-success btn-lg px-3">글쓰기</button>
				</div>
			</div>
		</form>
	</div>
</div>
<!-- End Contact -->

<jsp:include page="../include/footer.jsp" />