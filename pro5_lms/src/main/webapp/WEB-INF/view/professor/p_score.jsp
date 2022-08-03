<%@ page language="java" contentType="text/html; charset=UTF-8" session = "true" session = "true"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.*" %>
<!DOCTYPE html>
<%
	ArrayList<String> mylist = (ArrayList<String>) request.getAttribute("ssubject");
	ArrayList<StudentDTO> st_list = (ArrayList<StudentDTO>) request.getAttribute("st_list");
	String subject = (String) request.getAttribute("subject");
	String s_id = (String) request.getAttribute("student");
	scoreDTO scDTO = (scoreDTO) request.getAttribute("scDTO");
	String suballday = (String) request.getAttribute("suballday");
	lectureDTO lecdto = (lectureDTO) request.getAttribute("lecdto");
	int lec_nodate = 0;
	String lec_point = "";
	
	if (lecdto == null)
		{
		lecdto = new lectureDTO();
		}
	
	if (lecdto.getLec_score() != null)
		{
		lec_nodate = lecdto.getLec_no_date();
		lec_point = lecdto.getLec_score();
		}
	int test_score = 0;
	if (scDTO != null && scDTO.getAnswer() != null) {
		test_score = scDTO.getPoint();
	}
	String msg = (String)request.getAttribute("msg");
	if (msg != null && msg.equals("1")){
%>
<script type="text/javascript">
alert("확정되었습니다.");
</script>
<%
	}
%>

<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>성적관리</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="http://localhost:8080/pro5_lms/resource/CSS/p_score.css">
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
					<input type="checkbox" name="box" id="box1">
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
					<input type="checkbox" name="box" id="box4" checked>
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
				<div class="frame_top">
					<div class="title">제목</div>
					<!--수정은 기본 display-none 필요하면 사용-->
					<div class="title_sub">수정</div>
				</div>
				<div class="frame_bottom">
					<div class="select_item">
						<form action="http://localhost:8080/pro5_lms/professor/getStudent" name="subjectForm">
							<select name="subject" id="subject" onchange="sub_student(this)" class="sub">
							<!-- this : onchange의 객체(태그)를 지정 -->
							<%
								for(int i=0; i<mylist.size(); i++){
									if (subject.equals(mylist.get(i))){
							%>
								<option value="<%=mylist.get(i)%>" selected><%=mylist.get(i)%></option>
							<%
									}else {
							%>
								<option value="<%=mylist.get(i)%>"><%=mylist.get(i)%></option>
							<%
									}
								}
							%>
							</select>
						</form>
						<script>
							function sub_student(obj) {
								document.subjectForm.action = "http://localhost:8080/pro5_lms/professor/p_score?subject="+obj.value;
								document.subjectForm.submit();
							}
						</script>
						
						<form action="" name="search_scoreForm" method="post">
							<select name="student" id="student">
								<%
								if (st_list == null)
									{
								%>
									<div></div>
								<%
									}
								else
									{
									for(int i=0; i<st_list.size(); i++)
										{
										StudentDTO sDTO = st_list.get(i);
										if (s_id==null)
											{
								%>
											<option value="<%=sDTO.getS_id()%>"><%=sDTO.getS_name()%></option>
								<%			
											}
										
										else if (!s_id.equals("null") &&s_id != null && sDTO.getS_id() == Integer.valueOf(s_id))
											{
								%>
											<option value="<%=sDTO.getS_id()%>" selected><%=sDTO.getS_name()%></option>
								<%
											}
										}
									}
								%>
							</select>
							
							<%
								if(st_list == null) {
							%>
									<input type="button" value="조회" disabled="disabled" style="opacity:0.8; cursor:default;">
							<%
								} else {
							%>
									<input type="button" value="조회" onclick="sub_score()">
							<%
								}
							%>
						</form>
						<script>
							function sub_score() {
								var subj = document.getElementById('subject');
								var stdn = document.getElementById('student');
								console.log(stdn);
								document.search_scoreForm.action = "http://localhost:8080/pro5_lms/professor/getScore?student="+stdn.options[stdn.selectedIndex].value[0]+"&subject="+subj.options[subj.selectedIndex].value;
								document.search_scoreForm.submit();
							}
						</script>
					</div>
					<div class="middle1">
						<div class="middle1_border">
							<div class="middle1_left">
								<div class="QA1">
									<div class="Q1">
										<%
											for(int i=1; i<11; i++){
										%>
										<div class="Q_item"><%=i%></div>
										<%
											}
										%>
									</div>
									<div class="A1">
										<%
											for(int i=0; i<10; i++){
												if(scDTO != null && scDTO.getAnswer() != null) {
													if (scDTO.getCompare()[i].equals("1")){
										%>
														<div class="A_item"><%=scDTO.getAnswer().charAt(i)%></div>
										<%
													}else{
														%>
														<div class="A_item incorrect"><%=scDTO.getAnswer().charAt(i)%></div>
														<% 
													}
												}else{
										%>
													<div class="A_item"></div>
										<%
												}
											}
										%>
									</div>
								</div>
								<div class="QA1">
									<div class="Q1">
										<%
											for(int i=11; i<21; i++){
										%>
										<div class="Q_item"><%=i%></div>
										<%
											}
										%>
									</div>
									<div class="A1">
										<%
											for(int i=10; i<20; i++){
												if(scDTO != null) {
													if (scDTO.getCompare()[i].equals("1")){
										%>
														<div class="A_item"><%=scDTO.getAnswer().charAt(i)%></div>
										<%
													}else{
														%>
														<div class="A_item incorrect"><%=scDTO.getAnswer().charAt(i)%></div>
														<% 
													}
												}else{
										%>
													<div class="A_item"></div>
										<%
													
												}
											}
										%>
									</div>
								</div>
							</div>
							<div class="middle1_right">
								<p>점수</p>
								<div class="score">
									<%
										if(scDTO==null){
									%>
										0
									<% 
										}else {
									%>
										<%=scDTO.getPoint() %>
									<%
										}
									%>
								</div>
							</div>

						</div>
					</div>
					<form method="post" name="lecForm">
						
						<div class="middle2">
						
							<div class="total">
								<p>수업일수</p>
								<input type="readonly" name="total" id="total" value="<%=suballday%>" onfocus="this.blur()">
							</div>
							<div class="attend">
								<p>출석일</p>
								<input type="readonly" name="attend" id="attend" value="<%=Integer.valueOf(suballday)-Integer.valueOf(lec_nodate)%>" onfocus="this.blur()">
							</div>
							<div class="absence">
								<p>결석일</p>
								<input type="number" name="absence" id="absence" value="<%=lec_nodate%>" min="0" max="<%=suballday%>" onclick="chkday(this)">
							</div>
						</div>
						<div class="admin_bottom">
							<div class="grade">
								<p>학점</p>
								<input type="readonly" name="point" id="point" onfocus="this.blur()" value="<%=lec_point%>">
							</div>
							<input type="button" value="확정" class="final" onclick="lecsub()">
						</div>
						<input type="hidden" name="lec_score" value="<%=test_score%>">
					</form>
					<script type="text/javascript">
						function lecsub() {
							var subj = document.getElementById('subject');
							var stdn = document.getElementById('student');
							document.lecForm.action = "http://localhost:8080/pro5_lms/professor/calculator?student="+stdn.options[stdn.selectedIndex].value+"&subject="+subj.options[subj.selectedIndex].value;
				   			document.lecForm.submit()	
						} 
					
						function chkday(obj) {
							var today = document.getElementById('total');
							var atday = document.getElementById('attend');
							var po = document.getElementById('point');
							document.getElementById('attend').value = today.value - obj.value;
							if(obj.value >= 4) {
								document.getElementById('point').value = "F";
							}
							else {
								document.getElementById('point').value = "<%=lec_point%>";
							}
						}
					</script>
				</div>
			</div>
			<!--프레임 끝-->
		</div>
<!--기본 틀 안에 내용 작성 끝-->
   </section>
<!--틀 끝-->
</body>
</html>