<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
   <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
	<h2>CommentTest</h2>
	comment: <input type="text" name="comment"><br>
	<button id="sendBtn" type="button">SEND</button>
	<button id="modBtn" type="button">수정</button>
	<div id="commentList"></div>
	<script>
		let bno = '345';

		let showList = function(bno) {
			$.ajax({
				type : 'GET', // 요청 메서드
				url : '/board/comments?bno='+ bno, // 요청 URI
				success : function(result) {
					$("#commentList").html(toHtml(result))//서버로부터 응답이 도착하면 호출될 함수
				},
				error : function() {
					alert("error")
				} // 에러가 발생했을 때, 호출될 함수
			}); // $.ajax()
		}
		
		
		$(document).ready(function() {
			showList(bno);//목록창 새로고침 (댓글 목록 나타냄 )
			

			$("#sendBtn").click(function() {
				let comment =$("input[name=comment]").val();
				
				if(comment.trim()==''){ //공백을 입력하면 댓글입력하라고 알림
					alert("댓글을 입력해주세요");
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

			
			
			
			
			$("#modBtn").click(function() {
				let cno =$(this).attr("data-cno");
				let comment =$("input[name=comment]").val();
				
				if(comment.trim()==''){ //공백을 입력하면 댓글입력하라고 알림
					alert("댓글을 입력해주세요");
				$("input[name=comment]").focus()
				return;
				}
				
			       $.ajax({
	                    type:'PATCH',       // 요청 메서드
	                    url: '/board/comments'+bno,  // 요청 URI 커맨트레스트 컨트롤러에서 수정 uri랑 똑같이@@(확인해)
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
				let comment =$("span.comment", $(this).parent()).text();//this는 modBtn클릭하면 부모의 스팬 커맨트만 가져옴

			//1.comment의내용 input에 넣기
			$("input[name=comment]").val(comment); //정보1
				
			//2.cno 전달
			$("#modBtn").attr("data-cno",cno);//#modBtn은 id 수정버튼 맨위에있는 수정버튼//정보2
			});
			
			
			
			
			
			
			
			
			
			$("#commentList").on("click", ".delBtn",function(){
				let cno = $(this).parent().attr("data-cno");
				let bno = $(this).parent().attr("data-bno");

				$.ajax({
				  type: 'DELETE', //삭제 요청 메서드
					url : '/board/comments/'+cno+'?bno='+bno, // 요청 URI
				   success : function(result) {
						alert(result)
						showList(bno);//목록창 새로고침 (댓글 목록 나타냄 )
					},
					error : function() {
						alert("error")
					} // 에러가 발생했을 때, 호출될 함수
				}); // $.ajax()

			});
		});

		let toHtml = function(comments) {
			let tmp = "<ul>";

			comments.forEach(function(comment) {
						tmp += '<li data-cno='+ comment.cno
        				tmp += ' data-pcno='+ comment.pcno
        				tmp += ' data-bno='+ comment.bno + '>'
						tmp += ' commenter=<span class="commenter">'+ comment.commenter + '</span>'
						tmp += ' comment=<span class="comment">'+ comment.comment + '<span>'
						tmp += ' up_date=' + comment.up_date
						tmp += '<button class="delBtn">삭제</button>'
						tmp += '<button class="modBtn">수정</button>'
						tmp += '</li>'
					})
			return tmp + "</ul>";
		}
	</script>
</body>
</html>