<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<script src="http://wooshin.mireene.co.kr/g5/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/read.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board/comment.css">


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


	<!-- Start Content Page -->
	<div class="container-fluid bg-light py-5">
		<div class="col-md-6 m-auto text-center">
			<h1 class="h1">게시판내용</h1>
		</div>
	</div>

	<!--///////////게시글 상세/////////////////  -->
	<form action="" role="form">

		<input type="hidden" name="bno" value="${vo.bno }">

		<section class="article-detail table-common con row"
			style="margin-left: auto; margin-right: auto;">
			<div class="box-footer">
				<button type="submit" class="btn btn-danger">삭제</button>
				<button type="submit" class="btn btn-primary">수정</button>
			</div>
			<div class="article-writer cell" style="background-color: black">
				<div class="" style="color: white">작성자</div>
				<span style="color: white">${vo.writer }</span>
			</div>
			<table class="cell" border="1">
				<colgroup>
					<col width="100px">
				</colgroup>
				<tbody>
					<tr class="article-title">
						<th>[번호]제목</th>
						<td colspan="3" style="text-align: center;">[${vo.bno }]
							${vo.title }</td>

						<th>아이피</th>
						<td>${vo.ip }</td>
					</tr>
					<tr class="article-info">
						<th>날짜</th>
						<td>${vo.regdate }</td>
						<th>조회수</th>
						<td>${vo.viewcnt }</td>
					</tr>

					<tr class="article-body">
						<td>내용</td>
						<td colspan="4">${vo.content }</td>
					</tr>
				</tbody>
			</table>

		</section>
	</form>
	<table>
		<tr>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="bg-purple"
					style="background-color: #f8ff4e; width: 60pt; height: 60pt">목록으로◀◀◀</button>
			</td>
		</tr>
	</table>

	<!--///////////////////////////////  -->

	<!--@@@@@@@@@@@@@@@@@@@@@@@@@댓글@@@@@@@@@@@@@@@@@@@@@@@  -->
	<!-- <h2>댓글작성</h2> -->
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span
		style="font-size: 18pt; width: 300px; height: 200px; font-size: 30px; background-color: #e2e2e2;">Comment</span>
	<input type="text" name="comment" size="50" placeholder="댓글을 입력해주세요"
		style="font-size: 18pt; width: 500px; height: 200px; font-size: 30px; background-color: #e2e2e2;">
	<button id="sendBtn" type="button"
		style="width: 120px; height: 200px; background-color: #00bf00;">
		<span style="color: white">등록</span>
	</button>
	<button id="modBtn" type="button"
		style="width: 120px; height: 200px; background-color: #9f54ff;">
		<span style="color: white">수정</span>
	</button>
	<br>


	<div id="commentList"></div>

	<div id="replyForm" style="display: none">
		<input type="text" name="replyComment" class="form-control" placeholder="답글을 입력해주세요">
		<button id="wrtRepBtn" class="btn bg-maroon margin" type="button"
			style="background-color: black">
			<span style="color: white">등록</span>
		</button>
	</div>

	<!--@@@@@@@@@@@@@@@@@@@@@@@@@댓글@@@@@@@@@@@@@@@@@@@@@@@  -->


	<!--//////////댓글스크립트///////////////////////////  -->
	<script>
		let bno = ${vo.bno};

		let showList = function(bno) {

			$.ajax({
				type : 'GET', // 요청 메서드
				url : '/board/comments?bno=' + bno, // 요청 URI
				success : function(result) {
					$("#commentList").html(toHtml(result));
				},
				error : function() {
					alert("error")
				} // 에러가 발생했을 때, 호출될 함수
			}); // $.ajax()

		}

		////////////////////////////////////글쓰기.............../////////////
		$(document).ready(function() {

			showList(bno);//처음에 바로 글쓰기전에  목록갱신해서 댓글리스트 출력

			$("#sendBtn").click(function() {
				let comment = $("input[name=comment]").val();

				if (comment.trim() == '') {
					alert("댓글을 입력하세요");
					$("input[name=comment]").focus()
					return;
				}

				$.ajax({
					type : 'POST', // 요청 메서드
					url : '/board/comments?bno=' + bno, // 요청 URI 커맨트레스트 컨트롤러에서 수정 uri랑 똑같이@@(확인해)
					headers : {
						"content-type" : "application/json"
					}, // 요청 헤더
					data : JSON.stringify({
						bno : bno,
						comment : comment
					}), // 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {
						alert(result);
						showList(bno);//댓글목록 갱신
					},
					error : function() {
						alert("error")
					} // 에러가 발생했을 때, 호출될 함수
				}); // $.ajax()

			});
			////////////////////////////////////글쓰기.............../////////////

			////////////////댓글 수정///////////////////////

			$("#modBtn").click(function() {
				let cno = $(this).attr("data-cno");
				let comment = $("input[name=comment]").val();

				if (comment.trim() == '') {
					alert("수정할 댓글의 변경버튼을 클릭 해주세요!!!");
					$("input[name=comment]").focus()
					return;
				}

				$.ajax({
					type : 'PATCH', // 요청 메서드
					url : '/board/comments/' + cno, // 요청 URI 커맨트레스트 컨트롤러에서 수정 uri랑 똑같이@@(확인해)
					headers : {
						"content-type" : "application/json"
					}, // 요청 헤더
					data : JSON.stringify({
						cno : cno,
						comment : comment
					}), // 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {
						alert(result);

						showList(bno);//댓글목록 갱신
					},
					error : function() {
						alert("error")
					} // 에러가 발생했을 때, 호출될 함수
				}); // $.ajax()

			});

			$("#commentList").on("click", ".modBtn", function() {// .moBtn은 클래스 각 댓글마다 달려있는 수정버튼
				let cno = $(this).parent().attr("data-cno");
				let comment = $("span.comment", $(this).parent()).text();//this= modBtn클릭 하면  li안의 부모의 span comment만 가져옴

				//1.comment의 내용을 input에 전달
				$("input[name=comment]").val(comment);// 댓글내용 input넣음

				//2.cno전달
				$("#modBtn").attr("data-cno", cno);//#modBtn은 id 수정버튼 맨위에있는 수정버튼//정보2 개발자 도구보면 cno 수정되는거 확인 가능

				//1,2번값을 컨트롤러에 정보 넘겨서 업데이트 수정됨

			});////////////////댓글 수정///////////////////////

			///////////////////////삭제버튼////////////////////////////////////////////////
			$("#commentList").on("click", ".delBtn", function() {
				let cno = $(this).parent().attr("data-cno");
				let bno = $(this).parent().attr("data-bno");

				$.ajax({
					type : 'DELETE', // 요청 메서드
					url : '/board/comments/' + cno + '?bno=' + bno, // 요청 URI
					success : function(result) {
						alert(result)
						showList(bno);
					},
					error : function() {
						alert("error")
					} // 에러가 발생했을 때, 호출될 함수
				}); // $.ajax()

			});////////////////////삭제////////////////////////////////////////////

			//////////////////답글///////////////////////////

			$("#commentList").on("click", ".replyBtn", function() {
				//1.replyForm을 옮기고
				$("#replyForm").appendTo($(this).parent());
				//2.답글입력할 폼보여줌
				$("#replyForm").css("display", "block");
			});

			$("#wrtRepBtn").click(function() {
				let comment = $("input[name=replyComment]").val();
				let pcno = $("#replyForm").parent().attr("data-pcno");

				if (comment.trim() == '') {
					alert("댓글을 입력하세요");
					$("input[name=replyComment]").focus()
					return;
				}

				$.ajax({
					type : 'POST', // 요청 메서드
					url : '/board/comments?bno=' + bno, // 요청 URI 커맨트레스트 컨트롤러에서 수정 uri랑 똑같이@@(확인해)
					headers : {
						"content-type" : "application/json"
					}, // 요청 헤더
					data : JSON.stringify({
						pcno : pcno,
						bno : bno,
						comment : comment
					}), // 서버로 전송할 데이터. stringify()로 직렬화 필요.
					success : function(result) {
						alert(result);
						showList(bno);//댓글목록 갱신
					},
					error : function() {
						alert("error")
					} // 에러가 발생했을 때, 호출될 함수
				}); // $.ajax()

				$("#replyForm").css("display", "none")
				$("input[name=replyComment]").val('')
				$("#replyForm").appendTo("body");

			});

			//////////////////답글///////////////////////////

		});

		let toHtml = function(comments) {
			let tmp = "<ul>";

			comments.forEach(function(comment) {

						tmp += '<li data-cno='+ comment.cno
        	tmp += ' data-pcno=' + comment.pcno
        	tmp += ' data-bno=' + comment.bno + '>'
						if (comment.cno != comment.pcno)
							tmp += '&nbsp;'+'&nbsp;'+'&nbsp;'+'&nbsp;'+'&nbsp;'+'ㄴ'
						tmp += '<span class="commenter">'+ comment.commenter +'</span>'
						if(comment.re_ip !=null){
						tmp += '<span class="re_ip">'+comment.re_ip +'</span>'}
						tmp += '<br>'+' <span class="comment">'
								+ comment.comment + '</span>'
						tmp +=  '<br>'+comment.up_date
						tmp +=  '&nbsp;'+'<button class="delBtn" style="background-color: red">삭제</button>'
						tmp +=  '&nbsp;'+'<button class="modBtn"style="background-color: black; color:white;">변경</button>'
						tmp +=  '&nbsp;'+'<button class="replyBtn"style="background-color: black; color:white;">답글</button>'
						tmp += '</li>'
					})

			return tmp + "</ul>";

		}
	</script>
	<!--//////////댓글스크립트///////////////////////////  -->




	<!-- End Contact -->


	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							// 목록 버튼 클릭시
							$('.bg-purple')
									.click(
											function() {
												alert(' 목록 버튼 클릭! ');
												location.href = "<c:url value='/board/list'/>?page=${page}&pageSize=${pageSize}";
											});

							// 폼태그(객체) 정보
							var formObj = $('form[role="form"]');
							//alert(formObj);
							console.log(formObj);

							// 수정 버튼 클릭시 => 폼태그(bno) 사용해서 페이지 이동
							$('.btn-primary')
									.click(
											function() {
												alert(' 수정 버튼 클릭 ! ');

												// 폼태그 정보 => submit()
												// 주소 (/board/modify)
												formObj
														.attr("action",
																"<c:url value='/board/modify?page=${page}&pageSize=${pageSize}'/>");
												// GET방식
												//formObj.attr("method","get");

												formObj.submit();
											});
							/////////////////////////////////////////////////////////////////////

							// 삭제 버튼 클릭
							// /board/remove - POST 방식 
							$(".btn-danger").click(function() {
								alert(" 삭제 버튼 클릭 ");

								// 폼태그 action 정보 변경
								formObj.attr("action", "/board/remove");
								// 폼태그 method 정보 변경
								formObj.attr("method", "POST");

								// 페이지 이동		
								formObj.submit();
							});
						});// JQuery
	</script>
<script src="${pageContext.request.contextPath }/resources/js/board/comment.js"></script>

	<%-- 
	<jsp:include page="../include/footer.jsp" /> --%>