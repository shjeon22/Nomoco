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
		<h1 class="h1">게시물 수정</h1>
		<p>내용을 수정해 주세요.</p>
	</div>
</div>


<!-- Start Contact -->
<form action="" method="post" role="form">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1">글 제목</label> <input type="text"
				class="form-control" id="exampleInputEmail1" name="title"
				value="${uvo.title }">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">글쓴이</label> <input type="text"
				class="form-control" id="exampleInputPassword1" name="writer"
				value="${uvo.writer }" readonly="readonly">
		</div>

		<div class="form-group">
			<label>글 내용</label>
			<textarea class="form-control" name="content" rows="3">${uvo.content }</textarea>
		</div>


	</div>

	<div class="box-footer">
		<button type="submit" class="btn btn-primary">글 수정하기</button>
	</div>
</form>
<!-- End Contact -->



<jsp:include page="../include/footer.jsp" />