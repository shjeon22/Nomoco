<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
    <h2>commentTest</h2>
    comment:<input type="text" name="comment"><br>
    <button id="sendBtn" type="button">SEND</button>
    <button id="modBtn" type="button">수정</button>
    <div id="commentList"></div>
    
    
    <script>
    let bno =345;
    
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
        });
        
        let toHtml =function(comments){
        	let tmp = "<ul>";

        comments.forEach(function(comment){
        	
        	tmp += '<li data-cno='+ comment.cno
        	tmp += ' data-pcno=' + comment.pcno
        	tmp += ' data-bno=' + comment.bno + '>'
        	tmp += ' commenter=<span class="commenter">' + comment.commenter + '</span>'
        	tmp += ' comment=<span class="comment">' + comment.comment + '</span>'
        	tmp += ' up_date'+comment.up_date
        	tmp += '<button class="delBtn">삭제</button>'
        	tmp += '<button class="modBtn">수정</button>'
        	tmp += '</li>'
        })
        
        return tmp + "</ul>";
        
        }
    </script>
</body>
</html>