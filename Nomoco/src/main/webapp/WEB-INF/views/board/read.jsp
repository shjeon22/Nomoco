<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="../include/header.jsp" />
<script src="http://wooshin.mireene.co.kr/g5/js/jquery-1.8.3.min.js"></script>

<!--게시글 상세보기 css  -->
    <style>
* {
    border : 0;
    padding : 0;
}

ul {
    border:  1px solid rgb(235,236,239);
    border-bottom : 0;
}

li {
    background-color: #f9f9fa;
    list-style-type: none;
    border-bottom : 1px solid rgb(235,236,239);
    padding : 18px 18px 0 18px;
}

#commentList {
    width : 50%;
    margin : auto;
}

.comment-content {
    overflow-wrap: break-word;
}

.comment-bottom {
    font-size:9pt;
    color : rgb(97,97,97);
    padding: 8px 0 8px 0;
}

.comment-bottom > a {
    color : rgb(97,97,97);
    text-decoration: none;
    margin : 0 6px 0 0;
}

.comment-area {
    padding : 0 0 0 46px;
}

.commenter {
    font-size:12pt;
    font-weight:bold;
}

.commenter-writebox {
    padding : 15px 20px 20px 20px;
}

.comment-img {
    font-size:36px;
    position: absolute;
}

.comment-item {
    position:relative;
}

.up_date {
    margin : 0 8px 0 0;
}

#comment-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
}

textarea {
    display: block;
    width: 100%;
    min-height: 17px;
    padding: 0 20px;
    border: 0;
    outline: 0;
    font-size: 13px;
    resize: none;
    box-sizing: border-box;
    background: transparent;
    overflow-wrap: break-word;
    overflow-x: hidden;
    overflow-y: auto;
}

#comment-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

.btn {
    font-size:10pt;
    color : black;
    background-color: #eff0f2;
    text-decoration: none;
    padding : 9px 10px 9px 10px;
    border-radius: 5px;
    float : right;
}

#btn-write-comment, #btn-write-reply { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-reply { 
    background-color: #eff0f2;
    margin-right : 10px;
}

#btn-write-modify { 
    color : #009f47;
    background-color: #e0f8eb;
}

#btn-cancel-modify { 
    margin-right : 10px;
}

#reply-writebox {
    display : none;
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#reply-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

#modify-writebox {
    background-color: white;
    border : 1px solid #e5e5e5;
    border-radius: 5px;
    margin : 10px;
}

#modify-writebox-bottom {
    padding : 3px 10px 10px 10px;
    min-height : 35px;
}

/* The Modal (background) */
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 100px; /* Location of the box */
    left: 0;
    top: 0;
    width: 100%; /* Full width */
    height: 100%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    background-color: #fefefe;
    margin: auto;
    padding: 20px;
    border: 1px solid #888;
    width: 50%;
}

/* The Close Button */
.close {
    color: #aaaaaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}



.paging {
    color: black;
    width: 100%;
    text-align: center;
}

.page {
    color: black;
    text-decoration: none;
    padding: 6px;
    margin-right: 10px;
}

.paging-active {
    background-color: rgb(216, 216, 216);
    border-radius: 5px;
    color: rgb(24, 24, 24);
}

.paging-container {
    width:100%;
    height: 70px;
    margin-top: 50px;
    margin : auto;
}
    </style>
<!--댓글 css  -->

<!--게시글 상세보기 css -->
<style type="text/css">
html {
	font-family: "Noto Sans KR", sans-serif;
}

/* 노말라이즈 */
body, ul, li, h1, h2, h3, h4, h5, h6 {
	margin: 0;
	padding: 0;
	list-style: none;
}

a:link {
	color: lightblue;
}

/* 라이브러리 */
.con {
	margin: 0 auto;
}

.img-box>img {
	width: 100%;
	display: block;
}

.row::after {
	content: "";
	display: block;
	clear: both;
}

.cell {
	float: left;
	box-sizing: border-box;
}

.cell-right {
	float: right;
	box-sizing: border-box;
}

.margin-0-auto {
	margin: 0 auto;
}

.block {
	display: block;
}

.inline-block {
	display: inline-block;
}

.text-align-center {
	text-align: center;
}

.line-height-0-ch-only {
	line-height: 0;
}

.line-height-0-ch-only>* {
	line-height: normal;
}

.relative {
	position: relative;
}

.absolute-left {
	position: absolute;
	left: 0;
}

.absolute-right {
	position: absolute;
	right: 0;
}

.absolute-middle {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
}

/* 커스텀 */
/* 반응형 레이아웃 */
.con {
	max-width: 950px;
}

.con-min-width {
	min-width: 320px;
}

.top-menu a {
	text-decoration: none;
	color: gray;
	font-weight: bold;
	font-size: 1.2rem;
}

html, body {
	overflow-x: hidden;
}

.table-common>table {
	width: 100%;
	border-collapse: collapse;
}

.table-common .btn-box {
	text-align: center;
}

.table-common>table th, .table-common>table td {
	border: 1px solid black;
	padding: 10px;
}

.article-list table {
	border: none;
	border-top: 2px solid lightgray;
	border-bottom: 2px solid lightgray;
}

.article-list>table th, .article-list>table td {
	border: none;
}

.article-list>table td {
	border-bottom: 1px solid lightgray;
}

.article-list>table thead {
	border-bottom: 2px solid lightgray;
	background-color: #F5F5F5;
}

.article-detail {
	border: 2px solid lightgray;
}

.article-detail>table {
	border: none;
	width: calc(100% - 100px);
}

.article-detail>table th, .article-detail>table td {
	border: none;
}

.article-detail>table tr:not(:last-child) {
	border-bottom: 1px solid lightgray;
}

.article-detail>table tr:not(.article-body), .article-detail>table tr:not(.article-body)>td
	{
	height: 20px;
	font-size: 0.8rem;
}

.article-detail>table tr.article-title>td {
	height: 40px;
	font-weight: bold;
	font-size: 1.2rem;
}

.article-detail>table td:last-child {
	padding-right: 100px;
}

.article-detail>.article-writer {
	width: 100px;
	height: 102px;
	background-color: lightgray;
	border-bottom: 1px solid lightgray;
	text-align: center;
}

.article-detail>.article-writer .writer-icon {
	margin: 0 auto;
	background-color: white;
	width: 80px;
	height: 80px;
	border-radius: 50%;
}

.reply {
	margin-top: 20px;
	border: 2px solid lightgray;
	padding: 15px;
	box-sizing: border-box;
}

.reply-form {
	padding: 10px;
}

.reply-form>form input[type="text"] {
	width: 200px;
}

.reply-form>form textarea {
	width: calc(100% - 100px);
	min-height: 40px;
}

.reply-form>form input[type="submit"] {
	width: 80px;
	height: 40px;
	transform: translatey(-40%);
}

.reply-form>form>div:not(:last-child) {
	margin-bottom: 5px;
}

.reply-list>table {
	border: none;
}

.reply-list>table th {
	display: none;
}

.reply-list>table td {
	border: none;
}

.reply-list>table tr:nth-child(2n+1) {
	background-color: rgba(0, 0, 0, 0.06);
}

.reply-list>table td:first-child {
	font-weight: bold;
}

.reply-list>table td:first-child::after {
	content: " : ";
	font-weight: bold;
}
</style>
<!--게시글 상세보기 css  -->


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
			style="margin-left: auto; margin-right: auto;"><div class="box-footer">
				<button type="submit" class="btn btn-danger">삭제</button>
				<button type="submit" class="btn btn-primary">수정</button>
			</div>
			<div class="article-writer cell">
				<div class="writer-icon">작성자</div>
				<span>${vo.writer }</span>
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
	<table><tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button type="submit" class="btn btn-block btn-success btn-lg">뒤로가기</button></td></tr></table>
	
	<!--///////////////////////////////  -->

	<!--@@@@@@@@@@@@@@@@@@@@@@@@@댓글@@@@@@@@@@@@@@@@@@@@@@@  -->
	 <!-- <h2>댓글작성</h2> -->&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span style=" font-size:18pt; width:300px;height:200px;font-size:30px;background-color: #e2e2e2;">댓글입력 >>></span>
    <input type="text" name="comment" size="50" placeholder="댓글을 입력해주세요" style=" font-size:18pt; width:500px;height:200px;font-size:30px;background-color: #e2e2e2;">
    <button id="sendBtn" type="button" style="width: 120px; height: 200px; background-color:;">SEND</button>
    <button id="modBtn" type="button" style="width: 120px; height: 200px; background-color: ;">수정</button>
    <br>
    
    
    <div id="commentList"></div>
    
    <div id="replyForm" style="display: none">
   		 <input type="text" name="replyComment">
   		 <button id="wrtRepBtn" type="button">등록</button>
    </div>
    
	<!--@@@@@@@@@@@@@@@@@@@@@@@@@댓글@@@@@@@@@@@@@@@@@@@@@@@  -->
	


<!--//////////댓글스크립트///////////////////////////  -->
 <script>
     let bno =${vo.bno };
    
    let showList = function(bno){
    
    	
    	 $.ajax({
             type:'GET',       // 요청 메서드
             url: '/board/comments?bno='+bno,  // 요청 URI
             success : function(result){
             $("#commentList").html(toHtml(result));
             },
             error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
         }); // $.ajax()
    	
    	
    }
    
    ////////////////////////////////////글쓰기.............../////////////
        $(document).ready(function(){
        	
        	showList(bno);//처음에 바로 글쓰기전에  목록갱신해서 댓글리스트 출력
        	
            $("#sendBtn").click(function(){
            	let comment =$("input[name=comment]").val();
            	
            	if(comment.trim()==''){
            		alert("댓글을 입력하세요");
            		$("input[name=comment]").focus()
            		return;
            	}
            	
            	
                $.ajax({
                    type:'POST',       // 요청 메서드
                    url: '/board/comments?bno='+bno,  // 요청 URI 커맨트레스트 컨트롤러에서 수정 uri랑 똑같이@@(확인해)
                    headers : { "content-type": "application/json"}, // 요청 헤더
                    data : JSON.stringify({bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success : function(result){
                     alert(result);
                    showList(bno);//댓글목록 갱신
                    },
                    error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
               
            });
            ////////////////////////////////////글쓰기.............../////////////
            
            
            
            ////////////////댓글 수정///////////////////////
            
           
            $("#modBtn").click(function(){
            	let cno =$(this).attr("data-cno");
            	let comment =$("input[name=comment]").val();
            	
            	if(comment.trim()==''){
            		alert("댓글을 입력하세요");
            		$("input[name=comment]").focus()
            		return;
            	}
            	
            	
                $.ajax({
                    type:'PATCH',       // 요청 메서드
                    url: '/board/comments/'+cno,  // 요청 URI 커맨트레스트 컨트롤러에서 수정 uri랑 똑같이@@(확인해)
                    headers : { "content-type": "application/json"}, // 요청 헤더
                    data : JSON.stringify({cno:cno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success : function(result){
                     alert(result);
                     
                    showList(bno);//댓글목록 갱신
                    },
                    error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
               
            });
            
            
            
            
            
             $("#commentList").on("click", ".modBtn",function(){// .moBtn은 클래스 각 댓글마다 달려있는 수정버튼
            	let cno = $(this).parent().attr("data-cno");
            	let comment = $("span.comment", $(this).parent()).text();//this= modBtn클릭 하면  li안의 부모의 span comment만 가져옴
            	
            	//1.comment의 내용을 input에 전달
            	$("input[name=comment]").val(comment);// 댓글내용 input넣음
            	
            	//2.cno전달
            	$("#modBtn").attr("data-cno", cno);//#modBtn은 id 수정버튼 맨위에있는 수정버튼//정보2 개발자 도구보면 cno 수정되는거 확인 가능
            	
            	
            	//1,2번값을 컨트롤러에 정보 넘겨서 업데이트 수정됨
            	
            	
             });////////////////댓글 수정///////////////////////
            
            
            ///////////////////////삭제버튼////////////////////////////////////////////////
            $("#commentList").on("click", ".delBtn",function(){
            	let cno = $(this).parent().attr("data-cno");
            	let bno = $(this).parent().attr("data-bno");
            	
            	$.ajax({
                    type:'DELETE',       // 요청 메서드
                    url: '/board/comments/'+cno+'?bno='+bno,  // 요청 URI
                    success : function(result){
                    	alert(result)
                  showList(bno);
                    },
                    error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
           	
               
            });////////////////////삭제////////////////////////////////////////////
            
            //////////////////답글///////////////////////////
           
            $("#commentList").on("click", ".replyBtn",function(){
            	   //1.replyForm을 옮기고
            	   $("#replyForm").appendTo($(this).parent());
            	   //2.답글입력할 폼보여줌
             	$("#replyForm").css("display","block");
               });
            
            
            $("#wrtRepBtn").click(function(){
            	let comment =$("input[name=replyComment]").val();
            	let pcno =$("#replyForm").parent().attr("data-pcno");
            	
            	if(comment.trim()==''){
            		alert("댓글을 입력하세요");
            		$("input[name=replyComment]").focus()
            		return;
            	}
            	
            	
            	
                $.ajax({
                    type:'POST',       // 요청 메서드
                    url: '/board/comments?bno='+bno,  // 요청 URI 커맨트레스트 컨트롤러에서 수정 uri랑 똑같이@@(확인해)
                    headers : { "content-type": "application/json"}, // 요청 헤더
                    data : JSON.stringify({pcno:pcno, bno:bno, comment:comment}),  // 서버로 전송할 데이터. stringify()로 직렬화 필요.
                    success : function(result){
                     alert(result);
                    showList(bno);//댓글목록 갱신
                    },
                    error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
                }); // $.ajax()
                
                $("#replyForm").css("display", "none")
                $("input[name=replyComment]").val('')
                $("#replyForm").appendTo("body");
               
            });
            
            
            
            
            
            
            
            
            //////////////////답글///////////////////////////
           
        });
        
        let toHtml =function(comments){
        	let tmp = "<ul>";

        comments.forEach(function(comment){
        	
        	tmp += '<li data-cno='+ comment.cno
        	tmp += ' data-pcno=' + comment.pcno
        	tmp += ' data-bno=' + comment.bno + '>'
        	if(comment.cno!=comment.pcno)
        	tmp += 'ㄴ답글:'
        	tmp += ' 작성자:<span class="commenter">' + comment.commenter +'</span>'
        	tmp += '<br>'+' 내용:<span class="comment">' + comment.comment + '</span>'
        //	tmp += '<br>'+'날짜:'+comment.up_date
        	tmp += '<br>'+'<button class="delBtn">삭제</button>'+"&nbsp;&nbsp;&nbsp;"
        	tmp += '<button class="modBtn">수정</button>'+"&nbsp&nbsp;&nbsp;"
        	tmp += '<button class="replyBtn">답글</button>'
        	tmp += '</li>'
        })
        
        return tmp + "</ul>";
        
        }
    </script>
<!--//////////댓글스크립트///////////////////////////  -->




	<!-- End Contact -->


	<script type="text/javascript">
	$(document).ready(function(){
		// 목록 버튼 클릭시
		$('.bg-purple').click(function(){
			alert(' 목록 버튼 클릭! ');
			location.href="<c:url value='/board/list'/>?page=${page}&pageSize=${pageSize}";
		});
		
		// 폼태그(객체) 정보
		var formObj = $('form[role="form"]');
		//alert(formObj);
		console.log(formObj);
		
		
		// 수정 버튼 클릭시 => 폼태그(bno) 사용해서 페이지 이동
		$('.btn-primary').click(function(){
			alert(' 수정 버튼 클릭 ! ');
			
			// 폼태그 정보 => submit()
			// 주소 (/board/modify)
			formObj.attr("action","<c:url value='/board/modify?page=${page}&pageSize=${pageSize}'/>");
			// GET방식
			//formObj.attr("method","get");
			
			formObj.submit();			
		});
		/////////////////////////////////////////////////////////////////////
		
		// 삭제 버튼 클릭
		// /board/remove - POST 방식 
		$(".btn-danger").click(function(){
			alert(" 삭제 버튼 클릭 ");
			
			// 폼태그 action 정보 변경
			formObj.attr("action","/board/remove");
			// 폼태그 method 정보 변경
			formObj.attr("method","POST");
			
			// 페이지 이동		
			formObj.submit();
		});
	});// JQuery
</script>



	<jsp:include page="../include/footer.jsp" />