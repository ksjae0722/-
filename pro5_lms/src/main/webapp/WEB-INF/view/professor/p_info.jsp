<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="mvc.model.PersonalDTO"%>
<!DOCTYPE html>
<%
String check = (String) request.getAttribute("check");
	
if(check!=null)
	{
	if(check.equals("1"))
		{
%>
		<script type="text/javascript">
			alert("수정 되었습니다.");
		</script>
<%		
		}
	}
%>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>교수정보</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="http://localhost:8080/pro5_lms/resource/CSS/p_info.css">
	<script type="text/javascript">
		function update_info()
			{
			if(isNaN(document.getElementById("p_phone").value))
				{
				alert("숫자만 입력해주세요!");
				document.getElementById("p_phone").focus();
				return false;
				}
			
			if(document.getElementById("p_phone").value==""||!(document.getElementById("p_phone").value.length==11||document.getElementById("p_phone").value.length==10))
				{
				alert("전화번호 10~11자리를 입력해주세요!");
				document.getElementById("p_phone").focus();
				return false;
				}
			
			var text = document.getElementById("p_email").value;

			var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if (regEmail.test(text) === false)
				{
				alert("올바른 형식의 이메일이 아닙니다.");
				document.getElementById("p_email").focus();
			  	return false;
				}
				
			document.p_infos.submit();
			}
	</script>
</head>
<body>
	<!--nav 시작-->
	<nav id = "navbar">
		<div class = "nav_container">
			<div class = "nav_logo_container">
				<a href = "http://localhost:8080/pro5_lms/professor/p_main"><img src="../resource/images/logo.png" alt="ITUNIVERSITY"></a>
			</div>
			<div class = "nav_user_container">
				<a>${remember.getName()}</a>
			</div>
			<div class = "nav_ul_container information">
				<ul>
					<input type="checkbox" name="box" id="box1" checked>
					<div>
						<i class="fa-brands fa-blogger"></i>
						<label for="box1">교원 정보</label>
					</div>
					
					<li><a href="http://localhost:8080/pro5_lms/professor/p_info">기본 정보 조회</a></li>
				</ul>
			</div>

			<hr>

			<div class = "nav_ul_container enrolment">
				<ul>
					<input type="checkbox" name="box" id="box2">
					<div>
						<i class="fa-brands fa-blogger"></i>
						<label for="box2">수강 신청 현황</label>
					</div>
					
					<li><a href="http://localhost:8080/pro5_lms/professor/p_lecture">수강 신청 현황</a></li>
				</ul>
			</div>

			<hr>

			<div class = "nav_ul_container test">
				<ul>
					<input type="checkbox" name="box" id="box3">
					<div>
						<i class="fa-brands fa-blogger"></i>
						<label for="box3">시험 관리</label>
					</div>
				   
					<li><a href="http://localhost:8080/pro5_lms/professor/p_exam">시험 출제</a></li>
				</ul>
			</div>

			<hr>

			<div class = "nav_ul_container gradecheck">
				<ul>
					<input type="checkbox" name="box" id="box4">
					<div>
						<i class="fa-brands fa-blogger"></i>
						<label for="box4">성적 관리</label>
					</div>
					
					<li><a href="http://localhost:8080/pro5_lms/professor/p_score">성적 산출</a></li>
				</ul>
			</div>
		</div>
	</nav>
<!--nav 끝-->
<!--틀 시작-->
   <section id="main">
	   <!--배너 시작-->
		<div class ="banner">
			<input type="button" value="로그아웃" onClick="location.href='http://localhost:8080/pro5_lms/member/logout'">
		</div>
		<!--배너 끝-->
<!--기본 틀 안에 내용 작성-->
		<div class ="container">
			<!--프레임 시작 // class명(frame)은 페이지에 맞게 수정-->
			<div class="frame">
				<form action="modify_process" name="p_infos">
					<div class="frame_top">
						<div class="title">기본 정보</div>
						<!--수정은 기본 display-none 필요하면 사용-->
						<div class="title_sub">
							<input type = "button" onclick="update_info()" name = "sub" value = "수정">
						</div>
					</div>
					<div class="frame_bottom">
						<div class="info_top">
							<div class="info_top_left">
								<div class="info_pic">
									<img src="../resource/personal_pic/${remember.id}.jpg" alt="img">
								</div>
								<div class="info_student">
									<p class="info_name">${p_dto.getP_name()}</p>
									<p class="info_number">${p_dto.getP_id()}</p>
								</div>
							</div>
							<div class="info_top_right">
								<a href="http://localhost:8080/pro5_lms/member/changepw">비밀번호 변경</a>
							</div>
						</div>
						
						<div class="info_bottom">
							<div class="info_a">
								<div class="category1">
									<div class="info_set">
										<div class="information">대학</div>
										<input type="text" class="fix" name="p_college" placeholder="${p_dto.getP_college()}" readonly>
									</div>
									<div class="info_set">
										<div class="information">학과</div>
										<input type="text" class="fix" name="p_department" placeholder="${p_dto.getP_department()}" readonly>
									</div>
									<div class="info_set">
										<div class="information">전공</div>
										<input type="text" class="fix" name="p_major" placeholder="${p_dto.getP_major()}" readonly>
									</div>
								</div>
							</div>
							<div class="category2">
								<div class="info_set">
									<div class="information">사무실</div>
									<input type="text" class="fix" id="p_adress" name="p_adress" value="${p_dto.getP_office()}">
								</div>
								<div class="info_set">
									<div class="information">전화번호</div>
									<input type="text" class="fix" id="p_phone" name="p_phone" value="${p_dto.getP_oNumber()}">
								</div>
								<div class="info_set">
									<div class="information">이메일</div>
									<input type="text" class="fix" id="p_email" name="p_email" value="${p_dto.getP_email()}">
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			<!--프레임 끝-->	
		</div>
<!--기본 틀 안에 내용 작성 끝-->
   </section>
<!--틀 끝-->
</body>
</html>