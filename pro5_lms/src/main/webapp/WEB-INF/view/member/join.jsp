<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = (String) request.getAttribute("name");
String id = (String) request.getAttribute("id");
String jumin1 = (String) request.getAttribute("jumin1");
String jumin2 = (String) request.getAttribute("jumin2");
String num = (String) request.getAttribute("num");

if (name == null)
	{
	name = "";
	}

if (id == null)
	{
	id = "";
	}

if (jumin1 == null)
	{
	jumin1 = "";
	}

if (jumin2 == null)
	{
	jumin2 = "";
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="http://localhost:8080/pro5_lms/resource/CSS/join.css">
	<title>회원가입</title>
	<script type="text/javascript">
		function jumin()
			{
			if(document.getElementById("join_jumin1").value == ""||document.join_chkform.join_jumin1.value.length!=6)
				{
				alert("생년월일 6자리를 입력해주세요.");
				document.join_chkform.join_jumin1.focus();
				return false;
				}
			
			if(document.getElementById("join_jumin2").value == ""||document.join_chkform.join_jumin2.value.length!=7)
				{
				alert("주민등록번호 뒤 7자리를 입력해주세요.");
				document.join_chkform.join_jumin2.select();
				return false;
				}
			
			document.join_chkform.submit();
			}
		
		function pwchk()
			{
			if(document.getElementById("join_pw").value==""||document.join_form.join_pw.value.length<4)
				{
				alert("비밀번호를 4자리 이상 입력해주세요.");
				document.join_form.join_pw.select();
				return false;
				}
			
			if(document.getElementById("join_pw").value!=document.getElementById("join_pwchk").value)
				{
				alert("비밀번호가 일치하지 않습니다.");
				document.join_form.join_pwchk.select();
				return false;
				}

			document.join_form.submit();
			}
	</script>
</head>
<body>
	<div class="join_container">
		<div class="join_section1">
			<div class="logo">
				<img src="../resource/images/logo.png" alt="logo">
			</div>
		</div>
		<div class="join_section2">
			<div class="left">
				<ul>
					<li>주민등록번호</li>
					<li>이름</li>
					<li>학번/직번</li>
					<li>비밀번호</li>
					<li>비밀번호 확인</li>
				</ul>
			</div>
			<div class="middle">
				<ul>
					<form name = "join_chkform" action = "http://localhost:8080/pro5_lms/member/join_chkprocess" method = "post">
						<li><input type="text" size = "6" maxlength="6" class="jumin" id="join_jumin1" name="join_jumin1" placeholder="생년월일" value="${jumin1}">-<input type="password" size ="7" maxlength="7" id="join_jumin2" class="jumin" name="join_jumin2" placeholder="뒤 7자리" value="${jumin2}"></li>
					</form>
					
					<form name = "join_form" action = "http://localhost:8080/pro5_lms/member/join_process" method = "post">
						<li><input type="text" class="box number" name="join_name" placeholder="이름" value="${NameId[0]}" readonly></li>
						<li><input type="text" class="box number" name="join_id" placeholder="학번/직번" value="${NameId[1]}" readonly></li>
						<li><input type="password" class="box" id="join_pw" name="join_pw" placeholder="비밀번호"></li>
						<li><input type="password" class="box" id="join_pwchk" name="join_pwchk" placeholder="비밀번호 확인"></li>
						<li><input type="button" onclick="pwchk()" class="sub" value="회원가입"></li>
					</form>
				</ul>
			</div>
			<div class="right">
				<input type="button" onclick="jumin()" value="조회">
			</div>
		</div>
		<div class="join_section3">
			<div class="notice">
				<p class="a"><i class="fa-solid fa-circle-exclamation"></i>알려드립니다</p>
				<p class="b">* 주민등록번호를 입력한 후 조회를 누르면 이름, 학번 및 직번이 자동으로 기입됩니다.</p>
				<br>
				<p class="b">* 회원가입을 하시면 로그인 화면으로 이동합니다.</p>
				<br>
				<p class="b">* 비밀번호는 4자리 이상으로 설정하시기 바랍니다.</p>
			</div>
		</div>
	</div>	
</body>
</html>