<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
					<button type="submit"
						class="input-group-text bg-success text-light">
						<i class="fa fa-fw fa-search text-white"></i>
					</button>
				</div>
			</form>
		</div>
	</div>


	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">게시판</h1>
		</div>
	</div>


	<!-- Start Contact -->
	<div class="container py-5">
		<table class="table table-bordered">
			<tbody style="text-align : center;">
				<tr>
					<th style="width: 30px ">번호</th>
					<th style="width: 60px">제목</th>
					<th style="width: 80px">작성자(ID)</th>
					<th style="width: 80px">아이피(ip)</th>
					<th style="width: 140px">작성일</th>
					<th style="width: 80px">조회수</th>
				</tr>
				<c:forEach var="vo" items="${list}">
					<tr>
						<td>${vo.bno }</td>
						<td><a href="<c:url value="/board/read?bno=${vo.bno}&page=${ph.page}&pageSize=${ph.pageSize}"/>">${vo.title }</a></td>
						<td>${vo.writer }</td>
						<td>${vo.ip }</td>
						<td>
						<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd HH:mm:ss" /><%-- <fmt:formatDate value="${vo.regdate }" type="both"/>  --%>
						</td>
						<td>${vo.viewcnt }</td>
						
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<BR>
		<div class="row">
		
 <div class="paging-container">
      <div class="paging">
      <ul class="pagination pagination-lg justify-content-center">
      
        <c:if test="${totalCnt==null || totalCnt==0}">
          <div> 게시물이 없습니다. </div>
        </c:if>
        <c:if test="${totalCnt!=null && totalCnt!=0}">
          <c:if test="${ph.showPrev}">
       <li class="page-item">     <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" style="" href="<c:url value="/board/list?page=${ph.beginPage-1}"/>">◀ PREV</a></li>
          </c:if>
          <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
          <li class="page-item">  <a  class ="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="<c:url value="/board/list?page=${i}"/>">${i}</a></li>
          </c:forEach>
          <c:if test="${ph.showNext}">
          <li class="page-item">   <a class="page-link rounded-0 shadow-sm border-top-0 border-left-0 text-dark" href="<c:url value="/board/list?page=${ph.endPage+1}"/>">NEXT ▶</a></li>
          </c:if>
        </c:if> <button type="submit" class="btn btn-primary" onclick="location.href='/board/register'">글 쓰기</button>
		</ul>
      </div>
    </div>
				</div>
					
	</div>
	<!-- End Contact -->
	

	<script type="text/javascript">
		

		var result = '${result}';

		if (result == "REGOK") {
			alert('글이 정상적으로 작성 되었습니다.');
		}

		if (result == "MODOK") {
			alert(" 수정이 완료되었습니다.");
		}
		if (result == "MODX") {
			alert(" 작성자만 수정할 수 있습니다. ");
		}

		if (result == "DELOK") {
			alert(" 글이 정상적으로 제거 되었습니다. ");
		}
		if (result == "DELX") {
			alert(" 작성자 이외에 삭제할 수 없습니다. ");
		}
	</script>

	
<jsp:include page="../include/footer.jsp" />