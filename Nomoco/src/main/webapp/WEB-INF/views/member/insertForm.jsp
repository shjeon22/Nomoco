<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<script src="http://wooshin.mireene.co.kr/g5/js/jquery-1.8.3.min.js"></script> <!--jquery library 추가 해줌으로 서 유효성 추가  -->
<head>
<meta charset="UTF-8">

<!--회원가입 모달창 -->
<style>
body {
	font-family: Arial, Helvetica, sans-serif;
}

* {
	box-sizing: border-box;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 15px;
	margin: 5px 0 22px 0;
	display: inline-block;
	border: none;
	background: #f1f1f1;
}

/* Add a background color when the inputs get focus */
input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for all buttons */
button {
	background-color: #04AA6D;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

button:hover {
	opacity: 1;
}

/* Extra styles for the cancel button */
.cancelbtn {
	padding: 14px 20px;
	background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
	float: left;
	width: 50%;
}

/* Add padding to container elements */
.container {
	padding: 16px;
}

/* The Modal (background) */
.modal2 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: #474e5d;
	padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
	border: 1px solid #f1f1f1;
	margin-bottom: 25px;
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 35px;
	top: 15px;
	font-size: 40px;
	font-weight: bold;
	color: #f1f1f1;
}

.close:hover, .close:focus {
	color: #f44336;
	cursor: pointer;
}

/* Clear floats */
.clearfix::after {
	content: "";
	clear: both;
	display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
	.cancelbtn, .signupbtn {
		width: 100%;
	}
}
</style>


</head>
<body>

<script>

$(document).ready(function(){
	

});
function duplicate(){
	var id=$("#id").val();

	var submitObj = new Object();
	submitObj.id=id;
	
	$.ajax({
		url : "/member/idCnt",
		type : "POST",
		contentType : "application/json; charset-utf-8",
		data : JSON.stringify(submitObj),
		dataType : "json"
		}).done(function(resMap) {
		if (resMap.res == "ok") {
		if (resMap.idCnt == 0) {
		alert("사용할 수 있는 아이디입니다.");
		$("#id_yn").val("Y");
		} else {
		alert("중복된 아이디 입니다.");
		$("#id_yn").val("N");
		}
		}
		
		}).fail(function(e) {
		alert("등록 시도에 실패하였습니다." + e);
		}).always(function() {
		pass = false;
		});
		
		}

function fnSubmit() {
	 
	var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// var tel_rule = /^\d{2,3}-\d{3,4}-\d{4}$/; 전화번호용
	 
	if ($("#name").val() == null || $("#name").val() == "") {
	alert("이름을 입력해주세요.");
	$("#name").focus();
	 
	return false;
	}
	 
	if ($("#id").val() == null || $("#id").val() == "") {
	alert("아이디를 입력해주세요.");
	$("#memberId").focus();
	 
	return false;
	}
	 
	if ($("#id_yn").val() != 'Y') {
	alert("아이디 중복체크를 눌러주세요.");
	$("#id_yn").focus();
	 
	return false;
	}
	 
	 
	if ($("#email").val() == null || $("#email").val() == "") {
	alert("이메일을 입력해주세요.");
	$("#email").focus();
	 
	return false;
	}
	 
	 
	if ($("#pw").val() == null || $("#pw").val() == "") {
	alert("비밀번호를 입력해주세요.");
	$("#pw").focus();
	 
	return false;
	}
	 
	if ($("#pw2").val() == null || $("#pw2").val() == "") {
	alert("비밀번호 확인을 입력해주세요.");
	$("#pw2").focus();
	 
	return false;
	}
	 
	if ($("#pw").val() != $("#pw2").val()) {
	alert("비밀번호가 일치하지 않습니다.");
	$("#pw2").focus();
	 
	return false;
	}
	 
	if(!email_rule.test($("#email").val())){
		alert("이메일을 형식에 맞게 입력해주세요. ex) 1234@naver.com");
		$("#email").focus();
		return false;
		}
	
	if (confirm("회원가입하시겠습니까?")) {
	 
	$("#join").submit();
	 
	return false;
	}
	}
	 


</script>















	<!--회원가입  -->



	<button onclick="document.getElementById('id02').style.display='block'"
		style="width: auto;">회원가입</button>
 
	<div id="id02" class="modal2">
		
		<form class="modal-content" action="${pageContext.request.contextPath }/member/insert" method="post">
			<div class="container">
				<h1>회원가입</h1>
				<p>Nomoco에 오신걸 환영합니다.</p>
				<hr>
				<label for="id"><b>아이디</b></label> <input type="text"
					placeholder="아이디를 입력해주세요." name="id" required> 
					<a href="#" class="btn btn-success btn-icon-split" style="text-align:center;" onclick="duplicate(); return false;">
           			<span class="icon text-white-30">
            		  <i class="fas fa-check"></i>
            		   
           			</span>
           				 <span class="text">중복체크</span>
        				</a>
        				</div><label
					for="pw"><b>비밀번호</b></label> <input type="password"
					placeholder="비밀번호를 입력해주세요." name="pw" required> <label
					for="pw2"><b>비밀번호</b></label> <input type="password"
					placeholder="비밀번호를 입력해주세요." name="pw2" required> <label
					for="name"><b>서명</b></label> <input type="text"
					placeholder="이름을 입력해주세요." name="name" required> <label
					for="tel"><b>전화번호</b></label> <input type="text"
					placeholder="전화번호를 입력해주세요." name="tel" required> <label
					for="email"><b>이메일</b></label> <input type="text"
					placeholder="이메일을 입력해주세요." name="email" required> <label
					for="address"><b>주소</b></label> <input type="text"
					placeholder="주소를 입력해주세요." name="address" required>

				<p>
					By creating an account you agree to our <a href="#"
						style="color: dodgerblue">Terms & Privacy</a>.
				</p>

				<div class="clearfix">
					<button type="button"
						onclick="document.getElementById('id02').style.display='none'"
						class="cancelbtn">닫기</button>
					<button type="submit" class="signupbtn">회원가입</button>
				</div>
			</div>
		</form>
	</div>

	<!--회원가입  -->
</body>
</html>