<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "mvc.model.Remember" %>
<!DOCTYPE html>
<%
Remember remember = (Remember) session.getAttribute("remember");
String id = remember.getId();
String pwchknum = (String) request.getAttribute("pwchknum");

if(pwchknum!=null)
	{
	if(pwchknum.equals("0"))
		{
%>
		<script type="text/javascript">
			alert("현재 비밀번호가 맞지 않습니다. 다시 확인해주세요. ")
		</script>
<%
		}
	}

String p_id;
String s_id;

if(id.charAt(0) == 'p')
	{
	p_id = id;
	}

else
	{
	s_id = id;
	}
%>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="../resource/CSS/changepw.css">
	<title>비밀번호변경</title>
	<script type="text/javascript">
		function accord()
			{
			if(document.getElementById("pw_new").value==""||document.changepw.pw_new.value.length<4)
				{
				alert("비밀번호를 4자리 이상 입력해주세요.");
				document.changepw.pw_new.select();
				return false;
				}
			
			if(document.getElementById("pw_before").value==document.getElementById("pw_new").value)
				{
				alert("기존 비밀번호와 동일합니다.");
				document.changepw.pw_new.select();
				return false;
				}
			
			if(document.getElementById("pw_newchk").value!=document.getElementById("pw_new").value)
				{
				alert("비밀번호가 일치하지 않습니다.");
				document.changepw.pw_newchk.select();
				return false;
				}
   			document.changepw.submit();
			}
	</script>
</head>
<body>
	<div class="background">
		<div class="pw_container">
			<div class="pw_back">
				<div class="pw_section1">
					<h1>비밀번호 변경</h1>
					<p>이전에 사용하신 비밀번호는 새 비밀번호로 사용하실 수 없습니다.</p>
					<p>비밀번호를 변경하시면 자동 로그아웃되며 새 비밀번호로 로그인하시기 바랍니다.</p>
				</div>
				<div class="pw_section2">
					<ul>
						<form name="changepw" action="http://localhost:8080/pro5_lms/member/pwprocess" method="post">
							<li><input type="text" class="box number" id="id" name="id" placeholder="${remember.getId()}" readonly value=<%=id%>></li>
							<li><input type="password" class="box" id="pw_before" name="pw_before" placeholder="이전 비밀번호"></li>
							<li><input type="password" class="box" id="pw_new" name="pw_new" placeholder="새 비밀번호"></li>
							<li><input type="password" class="box" id="pw_newchk" name="pw_newchk" placeholder="새 비밀번호 확인"></li>
							<li><input type="button" onclick="accord()" class="sub box" value="비밀번호 변경"></li>
						</form>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>