<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.PersonalDTO" %>
<%
	String sessionId = (String) session.getAttribute("p_id");
	ArrayList<String> ssubject = (ArrayList<String>) request.getAttribute("ssubject");
	PersonalDTO dto = (PersonalDTO) request.getAttribute("dto");
%>
<html>
<head>
	<meta charset="UTF-8">
    <title>게시판글쓰기</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/p_write.css">
</head>
<script language = "JavaScript">
    function func(){
        if (confirm("작성을 취소하시겠습니까?")) {
            window.location.href="http://localhost:8080/pro5_lms/professor/p_main.per"; 
            return false;
        }
    }
    function asdf(){
        if(!document.write_form.title.value){
        	alert("제목을 입력하세요.");
        	return false;
        }
    	if(!document.write_form.summernote.value){
            alert("내용을 입력하세요.");
            return false;
        }        
        document.write_form.submit()
    }
</script>
<body>
<!--nav 시작-->
    <nav id = "navbar">
        <div class = "nav_container">
            <div class = "nav_logo_container">
                <a href = "http://localhost:8080/pro5_lms/professor/p_main.per"><img src="../resource/images/logo.png" alt="ITUNIVERSITY"></a>
            </div>
            <div class = "nav_user_container">
                <a><%= session.getAttribute("p_name") %></a>
            </div>
            <div class = "nav_ul_container information">
                <ul>
                    <input type="checkbox" name="box" id="box1">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box1">교원 정보</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/professor/p_info.per">기본 정보 조회</a></li>
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
                    
                    <li><a href="http://localhost:8080/pro5_lms/professor/p_lecture.per">수강 신청 현황</a></li>
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
                   
                    <li><a href="http://localhost:8080/pro5_lms/professor/p_exam.per">시험 출제</a></li>
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
                    
                    <li><a href="http://localhost:8080/pro5_lms/professor/p_score.per">성적 산출</a></li>
                </ul>
            </div>
        </div>
    </nav>
<!--nav 끝-->
<!--틀 시작-->
   <section id="main">
       <!--배너 시작-->
        <div class ="banner">
            <input type="button" value="로그아웃" onClick="location.href='http://localhost:8080/pro5_lms/member/logout.do'">
        </div>
        <!--배너 끝-->
<!--기본 틀 안에 내용 작성-->
        <div class ="container">
            <!--프레임 시작 // class명(frame)은 페이지에 맞게 수정-->
            <div class="frame">
                <div class="frame_top">
                    <div class="title">게시판 글쓰기</div>
                    <!--수정은 기본 display-none 필요하면 사용-->
                    <div class="title_sub">수정</div>
                </div>
                <div class="frame_bottom">
                    <form action="http://localhost:8080/pro5_lms/board/p_postupload.go" class="post-form" name="write_form" method="post" enctype="multipart/form-data">
                        <input name="id" type="hidden" value="<%=sessionId%>">
                        <input name="phonenum" type="hidden" value="<%=dto.getP_oNumber()%>">
                        <input name="p_name" type="hidden" value="<%=dto.getP_name()%>">
                        <div class = "selector">
                            <div>
                                <select name="select_subject" id="select_sub">
                                    <%
                                    	for(int i=0; i<ssubject.size(); i++){
                                    %>
                                    	<option value="<%=ssubject.get(i)%>"><%=ssubject.get(i)%></option>
                                    <% 
                                    	}
                                    %>
                                </select>
                            </div>
                            <div class="btns">
                                <a href="http://localhost:8080/pro5_lms/board/ListAction1.go?pageNum=1" class="btn-list">목록</a>
                                <a class="btn-reset" onclick="func()">취소</a>
                                <input type="button" class="btn-submit" name="sub" value="게시" onclick="asdf()">
                            </div>
                        </div>
                        <div class="post">                
                            <div class="title">
                                <input type="text" name="title" placeholder="제목을 입력하세요" required>
                            </div>
                            <div class="filebox">
                                <div class="boxing">
                                    <input type="file" name="filename" id="p_file">
                                </div>
                            </div>
                            <div class="contents">
                                <textarea id="summernote" name="summernote" placeholder="내용을 입력해주세요" hard></textarea>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--프레임 끝-->    
        </div>
<!--기본 틀 안에 내용 작성 끝-->
   </section>
<!--틀 끝-->
</body>
</html>