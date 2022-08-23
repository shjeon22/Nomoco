<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="./include/header.jsp" />

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

<!-- Start Banner Hero -->
<div id="template-mo-zay-hero-carousel" class="carousel slide"
	data-bs-ride="carousel">
	<ol class="carousel-indicators">
		<li data-bs-target="#template-mo-zay-hero-carousel"
			data-bs-slide-to="0" class="active"></li>
		<li data-bs-target="#template-mo-zay-hero-carousel"
			data-bs-slide-to="1"></li>
		<li data-bs-target="#template-mo-zay-hero-carousel"
			data-bs-slide-to="2"></li>
	</ol>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<div class="container">
				<div class="row p-5">
					<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
						<img class="img-fluid"
							src="${pageContext.request.contextPath }/resources/img/banner1.jpg"
							alt="">
					</div>
					<div class="col-lg-6 mb-0 d-flex align-items-center">
						<div class="text-align-left align-self-center">
							<h1 class="h1 text-success">
								<b>Covid -19</b> 기본수칙<br> <br>
							</h1>
							<h3 class="h2">
								<Rule>
							</h3>
							<p>
								1.꼭 필요하지 않은 외출·모임·여행 자제하기<br> <br> 2.실내 및 다른 사람과 2m(최소
								1m) 이상 거리 두기가 어려운 실외에서 반드시 마스크 착용하기<br> <br> 3.환기가
								원활하지 않거나 밀집된 장소 가지 않기<br> <br> <a rel="sponsored"
									class="text-success" href="http://localhost:8088/covid/info2"
									target="_blank" style="color: red">선별진료소 확인하기</a>

							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<div class="container">
				<div class="row p-5">
					<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
						<img class="img-fluid"
							src="${pageContext.request.contextPath }/resources/img/banner2.jpg"
							alt="">
					</div>
					<div class="col-lg-6 mb-0 d-flex align-items-center">
						<div class="text-align-left">
							<h1 class="h1">방역의 기초</h1>
							<h3 class="h2">외출전 마스크를 잊지 마세요</h3>
							<p>
							<ul>
								<li>올바른 마스크 착용으로 침방울(비말)을 통한 감염 전파를 차단할 수 있습니다.</li>
								<li>식품의약품안전처에서 의약외품으로 허가한 마스크의 착용을 적극 권고드립니다.</li>
								<li>올바른 마스크 착용 방법은 입과 코를 완전히 가리고 얼굴과 마스크 사이에 틈이 없도록 밀착시켜
									착용하는 것입니다.</li>
							</ul>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<div class="container">
				<div class="row p-5">
					<div class="mx-auto col-md-8 col-lg-6 order-lg-last">
						<img class="img-fluid"
							src="${pageContext.request.contextPath }/resources/img/banner_img_03.jpg"
							alt="">
					</div>
					<div class="col-lg-6 mb-0 d-flex align-items-center">
						<div class="text-align-left">
							<h1 class="h1">꽃 과 바람</h1>
							<h3 class="h2"></h3>
							<ul>
								<li>밀폐시설 및 다중이용시설은 환기가 잘되게 1시간마다 창문을 개방하기 바랍니다.</li>
								<li>주변에 정화 식물을 비치하여 예방하는것을 권장 드립니다.</li>
								<li>by Nomoco</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<a class="carousel-control-prev text-decoration-none w-auto ps-3"
		href="#template-mo-zay-hero-carousel" role="button"
		data-bs-slide="prev"> <i class="fas fa-chevron-left"></i>
	</a> <a class="carousel-control-next text-decoration-none w-auto pe-3"
		href="#template-mo-zay-hero-carousel" role="button"
		data-bs-slide="next"> <i class="fas fa-chevron-right"></i>
	</a>
</div>
<!-- End Banner Hero -->



<!-- Start Featured Product -->
<section class="bg-light">
	<div class="container py-5">
		<div class="row text-center py-3">
			<div class="col-lg-6 m-auto">
				<h1 class="h1">코로나 예방 물품</h1>
				<p>아래의 물품들은 코로나를 예방하는데 꼭 필요한 필수요소이니 각 가정이나 직장에 상시 구비해 두시기 바랍니다.
				</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12 col-md-4 mb-4">
				<div class="card h-100">
					<a href="shop-single.html"> <img
						src="${pageContext.request.contextPath }/resources/img/mask0.jpg"
						class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<ul class="list-unstyled d-flex justify-content-between">
							<li>중요도:<i class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i></li>
							<li class="text-muted text-right"></li>
						</ul>
						<a href="shop-single.html"
							class="h2 text-decoration-none text-dark">마스크</a>
						<p class="card-text">코로나를 손쉽게 예방할 수 있는 필수 현대인의 필수품 입니다.</p>
						<p class="text-muted">
							<!-- Reviews (24) -->
						</p>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-4 mb-4">
				<div class="card h-100">
					<a href="shop-single.html"> <img
						src="${pageContext.request.contextPath }/resources/img/mask1.jpg"
						class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<ul class="list-unstyled d-flex justify-content-between">
							<li>중요도:<i class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-muted text-right"></i></li>
							<li class="text-muted text-right"></li>
						</ul>
						<a href="shop-single.html"
							class="h2 text-decoration-none text-dark">손 소독제</a>
						<p class="card-text">어디든지 손쉽게 들고다녀 사용하시면 코로나 전파위험을 낮춰줍니다.</p>
						<p class="text-muted"></p>
					</div>
				</div>
			</div>
			<div class="col-12 col-md-4 mb-4">
				<div class="card h-100">
					<a href="shop-single.html"> <img
						src="${pageContext.request.contextPath }/resources/img/mask2.jpg"
						class="card-img-top" alt="...">
					</a>
					<div class="card-body">
						<ul class="list-unstyled d-flex justify-content-between">
							<li>중요도:<i class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-warning fa fa-star"></i> <i
								class="text-muted fa fa-star"></i></li>
							<li class="text-muted text-right"></li>
						</ul>
						<a href="shop-single.html"
							class="h2 text-decoration-none text-dark">체온계</a>
						<p class="card-text">열이나 두통 등의 증상이 생기면 사용하시어 37도이상이면 진료소에
							방문바랍니다.</p>
						<p class="text-muted">
							<!-- Reviews (74) -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- End Featured Product -->

<jsp:include page="./include/footer.jsp" />
