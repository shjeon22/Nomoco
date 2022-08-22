<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Zay Shop eCommerce HTML CSS Template</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="apple-touch-icon"
	href="${pageContext.request.contextPath }/resources/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/img/favicon.ico">

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/templatemo.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/custom.css">

<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/fontawesome.min.css">
<!--
    
TemplateMo 559 Zay Shop

https://templatemo.com/tm-559-zay-shop

-->
</head>
<body>
	<!-- Start Top Nav -->
	<nav
		class="navbar navbar-expand-lg bg-dark navbar-light d-none d-lg-block"
		id="templatemo_nav_top">
		<div class="container text-light">
			<div class="w-100 d-flex justify-content-between">
				<div>
					<i class="fa fa-envelope mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="mailto:info@company.com">shjeon510@gmail.com</a> <i
						class="fa fa-phone mx-2"></i> <a
						class="navbar-sm-brand text-light text-decoration-none"
						href="tel:010-020-0340">Git: shjein22</a>
				</div>
				<div>
					<a class="text-light" href="https://fb.com/templatemo"
						target="_blank" rel="sponsored"><i
						class="fab fa-facebook-f fa-sm fa-fw me-2"></i></a> <a
						class="text-light" href="https://www.instagram.com/"
						target="_blank"><i class="fab fa-instagram fa-sm fa-fw me-2"></i></a>
					<a class="text-light" href="https://twitter.com/" target="_blank"><i
						class="fab fa-twitter fa-sm fa-fw me-2"></i></a> <a class="text-light"
						href="https://www.linkedin.com/" target="_blank"><i
						class="fab fa-linkedin fa-sm fa-fw"></i></a>
				</div>
			</div>
		</div>
	</nav>
	<!-- Close Top Nav -->


	<!-- Header -->
	<nav class="navbar navbar-expand-lg navbar-light shadow">
		<div
			class="container d-flex justify-content-between align-items-center">

			<a class="navbar-brand text-success logo h1 align-self-center"
				href="${pageContext.request.contextPath }/index"> Nomoco <BR> <H5 style="color: BLACK;">No More Corona</H5></a>
                                                             
			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#templatemo_main_nav"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div
				class="align-self-center collapse navbar-collapse flex-fill  d-lg-flex justify-content-lg-between"
				id="templatemo_main_nav">
				<div class="flex-fill">
					<ul
						class="nav navbar-nav d-flex justify-content-between mx-lg-auto">
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath }/index">Home</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/covid/info ">코로나 현황</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/board/list">게시판</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath }/member/mypage">마이페이지</a>
						</li>
					</ul>

				</div>


				<!-- 로그인 상단바 표시 -->
				<c:catch var="ex">
					<c:choose>
						<c:when test="${empty sessionScope.id  }">
							<a href="${pageContext.request.contextPath }/member/login">로그인</a> &nbsp;&nbsp;
         <a href="${pageContext.request.contextPath }/member/insert">회원가입</a>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${sessionScope.id eq 'admin'}">
           ${id }님 환영 합니다.<br>
									<input type="button" value="관리자 페이지"
										onclick=" location.href='${pageContext.request.contextPath }/admin/memberList'; ">
									<input type="button" value="로그아웃"
										onclick=" location.href='${pageContext.request.contextPath }/member/logout'; ">
								</c:when>
								<c:otherwise>
	   	${id }님 환영 합니다.<br>
									<input type="button" value="로그아웃"
										class="btn btn-block btn-success"
										onclick=" location.href='${pageContext.request.contextPath }/member/logout'; ">
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:catch>
				<c:out value="${ex }" />
				<!--error시 코드  -->
				<!-- 로그인 상단바 표시 -->


			</div>

		</div>
	</nav>
	<!-- Close Header -->