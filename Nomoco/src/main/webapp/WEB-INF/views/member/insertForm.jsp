<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://wooshin.mireene.co.kr/g5/js/jquery-1.8.3.min.js"></script>
<!--jquery library 추가 해줌 유효성 추가  -->

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
<!-- Daum postcode API -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	/* Daum PostCode Api */
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
	/* Daum PostCode Api */

	/* 회원가입 유효성검사 */

	var result_pw = false;
	var result_id = false;
	var result_email = false;
	var result_tel = false;

	function checkForm() {

		var regId = /^[a-z0-9]{4,12}$/; // id 유효성검사
		var regPw = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/; // 비번 유효성검사
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; // 메일 유효성검사
		var regName = /^[가-힣]{2,4}$/; // 이름 유효성검사
		var regTel = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/; // 전화번호 유호성검사

		var id = document.getElementById("id");
		var pw = document.getElementById("pw");
		var name = document.getElementById("name");
		var email = document.getElementById("email");
		var tel = document.getElementById("tel");
		var pw = document.getElementById("pw").value;
		var pw2 = document.getElementById("pw2").value;

		if ($("#id").val() == "") { // 아이디 공백 검사
			alert("아이디를 입력하지 않으셨습니다.");
			$("#id").focus();
			return false;
		} else if (!regId.test(id.value)) { // 아이디 유효성검사
			alert("아이디는 4~12자의 영문 소문자와 숫자로만 입력하여 주세요.");
			$("#id").focus();
			return false;
		} else if (result_id == false) { // 아이디 중복 검사
			alert("이미 가입된 아이디 입니다.");
			$("#id").focus();
			return false;
		} else if ($("#pw").val() == "") { // 비밀번호 공백 검사
			alert("비밀번호를 입력하지 않으셨습니다.");
			$("#pw").focus();
			return false;
		} else if (!regPw.test(pw.value)) { // 비밀번호 유효성검사 
			/* alert("비밀번호는 8~12자의 영문 대소문자와 숫자, 특수문자를 사용해주세요.");
			@$("#pw").focus();
			return false; */
			return true;
		} else if ($("#pw").val() != $("#pw2").val()) { // 비밀번호 확인 검사
			alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
			$("#pw").focus();
			return false;
		} else if ($("#name").val() == "") { // 이름 공백 검사
			alert("이름을 입력하지 않으셨습니다.");
			$("#name").focus();
			return false;
		} else if (!regName.test(name.value)) { // 이름 유효성검사
			alert("한글만 입력해주세요.");
			$("#name").focus();
			return false;
		} else if ($("#email").val() == "") { // 이메일 공백 검사
			alert("메일주소를 입력하지 않으셨습니다.");
			$("#email").focus();
			return false;
		} else if (!regEmail.test(email.value)) { // 이메일 유효성 검사
			alert("올바른 이메일 형식이 아닙니다.");
			return false;
		} else if (result_email == false) { // 이메일 중복 검사
			alert("이미 사용중인 이메일 입니다.");
			return false;
		} else if ($("#tel").val() == "") { // 전화번호 공백 검사
			alert("전화번호를 입력하지 않으셨습니다.");
			$("#tel").focus();
			return false;
		} else if (!regTel.test(tel.value)) { // 전화번호 유효성 검사
			alert("숫자로만 입력하세요.");
			$("#tel").focus();
			return false;
		} else if (result_tel == false) { // 전화번호 중복 검사
			alert("이미 사용중인 전화번호 입니다.");
			$("#tel").focus();
			return false;
		} else {
			alert("회원가입이 완료되었습니다.")
		}
	}

	function checkId() {
		var id = $("#id").val(); //id값이 "id"인 입력란의 값을 저장
		var checkUserId = $("#checkId1");
		var reId = /^[a-z0-9]{4,12}$/;

		if (!reId.test(id)) {
			checkUserId
					.html("<font color='red'><b>아이디는 영문(소문자), 숫자로 4-12 글자 입니다.</b></font>");
		} else {
			$
					.ajax({
						url : '/member/idChk', //Controller에서 인식할 주소
						type : 'POST', //POST 방식으로 전달
						data : {
							id : id
						},
						success : function(cnt) {
							if (cnt == 0) {
								checkUserId
										.html("<font color='green'><b>사용 가능한 아이디 입니다.</b></font>");
								result_id = true;
							} else {
								checkUserId
										.html("<font color='red'><b>이미 사용중인 아이디 입니다.</b></font>");
								result_id = false;
							}
						},

						error : function() {
							alert("에러입니다");

						}
					})
		}
	}

	function checkTel() {
		var tel = $("#tel").val();
		var checkSpan4 = $("#checkTel");
		var regTel = /^01([0|1|6|7|8|9])-?([0-9]{4})-?([0-9]{4})$/;

		if (!regTel.test(tel)) {
			checkSpan4.html("<font color='red'><b>형식이 맞지 않습니다.</b></font>");
		} else {

			$
					.ajax({
						url : '/member/telChk', //Controller에서 인식할 주소
						type : 'POST', //POST 방식으로 전달
						data : {
							tel : tel
						},
						success : function(tCnt) {
							if (tCnt == 0) {
								checkSpan4
										.html("<font color='green'><b>사용가능한 전화번호 입니다.</b></font>");
								result_tel = true;
							} else {
								checkSpan4
										.html("<font color='red'><b>이미 사용중인 전화번호 입니다.</b></font>");
								result_tel = false;
							}
						},

						error : function() {
							alert("에러입니다");
						}
					})
		}
	}

	function checkEmail() {
		var email = $("#email").val();
		var checkSpan5 = $("#checkEmail");
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if (!regEmail.test(email)) {
			checkSpan5.html("<font color='red'><b>형식이 맞지 않습니다.</b></font>");
		} else {

			$
					.ajax({
						url : '/member/emailChk', //Controller에서 인식할 주소
						type : 'POST', //POST 방식으로 전달
						data : {
							email : email
						},
						success : function(eCnt) {
							if (eCnt == 0) {
								checkSpan5
										.html("<font color='green'><b>사용가능한 이메일 입니다.</b></font>");
								result_email = true;
							} else {
								checkSpan5
										.html("<font color='red'><b>이미 사용중인 이메일 입니다.</b></font>");
								result_email = false;
							}
						},

						error : function() {
							alert("에러입니다");
						}
					})
		}
	}

	function checkPw() {
		var pw = $("#pw").val();
		var checkSpan = $("#checkPw");
		var regPw = /^(?=.*[a-zA-Z])((?=.*\d)(?=.*\W)).{8,16}$/;

		if (!regPw.test(pw)) {
			checkSpan
					.html("<font color='red'><b>비밀번호는 영문/숫자/특수문자 포함 8~16 자리로 입력하세요</b></font>");
		} else {
			checkSpan.html("<font color='green'><b>사용가능한 비밀번호</b></font>");
			result_pw = true;
		}
	};

	/* 비밀번호 재입력 일치 검사 메서드 */
	function checkPw2() {
		var pw1 = document.getElementById("pw").value;
		var pw2 = document.getElementById("pw2").value;
		var checkSpan = document.getElementById("checkPw2");
		if (pw2 != "") {
			if (pw2 == pw1) {
				checkSpan.innerHTML = "<font color='green'><b>비밀번호가 일치합니다.</b></font>";
				result_pw = true;
			} else {
				checkSpan.innerHTML = "<font color='red'><b>비밀번호가 일치하지 않습니다.</b></font>";

			}
		}
	}

	function checkName() {
		var name = $("#name").val();
		var checkSpan3 = $("#checkName");
		var regName = /^[가-힣]{2,4}$/;

		if (!regName.test(name)) {
			checkSpan3.html("<font color='red'><b>형식이 맞지 않습니다.</b></font>");
		} else {
			checkSpan3.html("<font color='green'><b>사용가능한 성명</b></font>");
		}
	}
</script>
<!-- 회원가입 유효성검사-->


</head>
<body>


	<!--회원가입  -->



	<button onclick="document.getElementById('id02').style.display='block'"
		style="width: auto;">회원가입</button>

	<div id="id02" class="modal2">

		<form class="modal-content"
			action="${pageContext.request.contextPath }/member/insert"
			method="post" onsubmit="return checkForm()">
			<div class="container">
				<h1>회원가입</h1>
				<p>Nomoco에 오신걸 환영합니다.</p>
				<hr>
				<label for="id"><b>아이디</b></label><br> <span id="checkId1"></span>
				<input type="text" placeholder="아이디를 입력해주세요." id="id" name="id"
					oninput="checkId()" required> <br> <label for="pw">
					<b>비밀번호</b>
				</label><br> <span id="checkPw"></span> <input type="password"
					placeholder="비밀번호를 입력해주세요." id="pw" name="pw" oninput="checkPw()"
					required> <br> <label for="pw2"><b>비밀번호 확인</b></label>
				<br>
				<span id="checkPw2"> &nbsp;</span><input type="password"
					placeholder="비밀번호를 입력해주세요." id="pw2" name="pw2"
					oninput="checkPw2()" required> <br> <label for="name"><b>서명</b></label><br>
				<span id="checkName"> </span> <input type="text"
					placeholder="이름을 입력해주세요." name="name" id="name"
					oninput="checkName()" required> <br> <label for="tel"><b>전화번호</b></label><br>
				<span id="checkTel"></span> <input type="text"
					placeholder="전화번호를 입력해주세요. " name="tel" id="tel"
					oninput="checkTel()" required> <br> <label for="email"><b>이메일</b></label><br>
				<span id="checkEmail"></span> <input type="text"
					placeholder="이메일을 입력해주세요." name="email" id="email"
					oninput="checkEmail()" required> <br> <label
					for="zipcode"><b>우편번호</b></label> <input type="button"
					onclick="sample6_execDaumPostcode()" value="우편번호 찾기"
					style="color: white; background-color: black"> <input
					type="text" name="zipcode" id="sample6_postcode"
					placeholder="(우편번호)"> <label for="address"><b>주소</b></label>
				<input type="text" name="address" id="sample6_address"
					placeholder="주소"> <input type="text"
					id="sample6_extraAddress" placeholder="(동이름_)"> <input
					type="text" name="address2" id="sample6_detailAddress"
					placeholder="상세주소">

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