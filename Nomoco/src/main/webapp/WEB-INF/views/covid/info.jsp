<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member/member.css">

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
		<h1 class="h1">코로나 발생 현황</h1>
	</div>
</div>

<div class="container py-5">
	<div class="row">

		<div class="col-lg-3">
			<h1 class="h2 pb-4">Categories</h1>
			<ul class="list-unstyled templatemo-accordion">
				<li class="pb-3"><a
					class="collapsed d-flex justify-content-between h3 text-decoration-none"
					href="#"> 코로나정보<i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
				</a>
					<ul class="collapse show list-unstyled pl-3">
						<li><a class="text-decoration-none"
							href="${pageContext.request.contextPath}/covid/info">발생동향</a></li>
						<li><a class="text-decoration-none"
							href="${pageContext.request.contextPath}/covid/info2">선별 진료소</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</div>
<!-- Start Contact -->
<div class="container py-5">
	<table class="table table-bordered">
		<h4>${covidinfo.get(0).covid_title}</h4>
		<tr>
			<th colspan="2">사망</th>
			<th colspan="2">재원중증</th>
			<th colspan="2">신규입원</th>
			<th colspan="2">확진</th>
		</tr>

		<tr>
			<td>익일</td>
			<td>인구 10만명당</td>
			<td>익일</td>
			<td>인구 10만명당</td>
			<td>익일</td>
			<td>인구 10만명당</td>
			<td>익일</td>
			<td>인구 10만명당</td>
		</tr>
		<tr>
			<td>${covidinfo.get(0).covid_num0}</td>
			<td>${covidinfo.get(0).covid_num1}</td>
			<td>${covidinfo.get(0).covid_num2}</td>
			<td>${covidinfo.get(0).covid_num3}</td>
			<td>${covidinfo.get(0).covid_num4}</td>
			<td>${covidinfo.get(0).covid_num5}</td>
			<td>${covidinfo.get(0).covid_num6}</td>
			<td>${covidinfo.get(0).covid_num7}</td>

		</tr>

	</table>


	<table class="table table-bordered">
		<h4>${covidinfo2.get(0).c_title}</h4>
		<tr>
			<c:set var="TextValue" value="${covidinfo2.get(0).c_info}" />
			<th colspan="1">${fn:substring(TextValue,0,3) }</th>
			<th colspan="1">${fn:substring(TextValue,4,8) }</th>
			<th colspan="1">${fn:substring(TextValue,11,15) }</th>
			<th colspan="1">${fn:substring(TextValue,18,22) }</th>
			<th colspan="1">${fn:substring(TextValue,25,29) }</th>
			<th colspan="1">${fn:substring(TextValue,31,36) }</th>
			<th colspan="1">${fn:substring(TextValue,38,43) }</th>
			<th colspan="1">${fn:substring(TextValue,45,50) }</th>
			<th colspan="1">${fn:substring(TextValue,51,60) }</th>
		</tr>

		<tr>
			<c:set var="TextValue" value="${covidinfo2.get(0).c_info1}" />
			<td>${fn:substring(TextValue,0,3) }</td>
			<td>${fn:substring(TextValue,3,10) }</td>
			<td>${fn:substring(TextValue,10,17) }</td>
			<td>${fn:substring(TextValue,17,25) }</td>
			<td>${fn:substring(TextValue,25,33) }</td>
			<td>${fn:substring(TextValue,33,41) }</td>
			<td>${fn:substring(TextValue,41,49) }</td>
			<td>${fn:substring(TextValue,49,57) }</td>
			<td>${fn:substring(TextValue,57,65) }</td>
		</tr>
		<tr>
			<c:set var="TextValue" value="${covidinfo2.get(0).c_info2}" />
			<td>${fn:substring(TextValue,0,7) }</td>
			<td>${fn:substring(TextValue,9,17) }</td>
			<td>${fn:substring(TextValue,17,24) }</td>
			<td>${fn:substring(TextValue,24,31) }</td>
			<td>${fn:substring(TextValue,31,38) }</td>
			<td>${fn:substring(TextValue,38,44) }</td>
			<td>${fn:substring(TextValue,44,52) }</td>
			<td>${fn:substring(TextValue,52,59) }</td>
			<td>${fn:substring(TextValue,59,65) }</td>

		</tr>
	</table>
	<table class="table table-bordered">
		<h4>${covidinfo2.get(0).c_title2}</h4>
		<tr>

			<th colspan="1">구분</th>
			<th colspan="1">확진자 (%)</th>
			<th colspan="1">사망자 (%)</th>
			<th colspan="1">치명률 (%)</th>

		</tr>

		<tr>
			<c:set var="TextValue" value="${covidinfo2.get(0).c_info3}" />
			<td>${fn:substring(TextValue,0,3) }</td>
			<td>${fn:substring(TextValue,3,21) }</td>
			<td>${fn:substring(TextValue,21,36) }</td>
			<td>${fn:substring(TextValue,36,42) }</td>


		</tr>
		<tr>
			<c:set var="TextValue" value="${covidinfo2.get(0).c_info3}" />
			<td>${fn:substring(TextValue,42,44) }</td>
			<td>${fn:substring(TextValue,44,63) }</td>
			<td>${fn:substring(TextValue,63,78) }</td>
			<td>${fn:substring(TextValue,78,90) }</td>



		</tr>

	</table>
<span style="color: red"> 코로나 관련 데이터에 대한 저작권 <br>Copyright ⓒ By MOHW. All Rights Reserved.<BR> http://ncov.mohw.go.kr 에 있습니다.</span>


</div>
</html>
<!-- End Contact -->

<jsp:include page="../include/footer.jsp" />