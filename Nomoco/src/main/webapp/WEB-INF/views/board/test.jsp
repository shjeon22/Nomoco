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
	<button id="sendBtn" type="button">SEND</button>
	<div id="commentList"></div>
	<script>
    let bno ='1085';
    
    let showList = function(bno){
              $.ajax({
                  type:'GET',       // 요청 메서드
                  url: '/board/comments?bno='+bno,  // 요청 URI
                  success : function(result){
                	  $("#commentList").html(toHtml(result))//서버로부터 응답이 도착하면 호출될 함수
                  },
                  error   : function(){ alert("error") } // 에러가 발생했을 때, 호출될 함수
              }); // $.ajax()
    }
    
        $(document).ready(function(){
         
            $("#sendBtn").click(function(){
               showList(bno);
        });
            });
        
        let toHtml = function(comments){
        let tmp ="<ul>";
        
        comments.forEach(function(comment){
        	tmp+= '<li data-cno='+comment.cno
        	tmp+= 'data-pno='+comment.pcno
        	tmp+= 'data-pno='+comment.bno+'>'
        	tmp+= 'commenter=<span class="commenter">'+comment.commenter+'</span>'
        	tmp+= 'comment=<span class="comment">'+comment.comment+'<span>'
        	tmp+= 'up_date='+comment.update
        	tmp+= '</li>'
        })
        return tmp +"</ul>";
        }
    </script>
</body>
</html>