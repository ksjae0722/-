<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.ssubjectDTO" %>
<%
	String sessionName = (String) session.getAttribute("p_name");
	ArrayList<ssubjectDTO> sbDTO = (ArrayList<ssubjectDTO>) request.getAttribute("ssubject");
	Map<String, Integer> cmap = (HashMap) request.getAttribute("cmap");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수강 신청 현황</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="http://localhost:8080/pro5_lms/resource/CSS/p_lecture.css">
</head>
<Script language="JavaScript">
    function func(subject_name){
        window.open('p_popup_lecture.per?subject_name='+subject_name, '수강생 목록', 'Width=1600px, Height=1000px, Top=50px, Left=100px, Toolbar=yes, Menubar=yes, Statusbar=yes, Scrollbar=yes, Resizable=yes, fullscreen=yes');
    }
</Script>
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
                    <input type="checkbox" name="box" id="box2" checked>
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
                    <div class="title">수강 신청 현황</div>
                    <!--수정은 기본 display-none 필요하면 사용-->
                    <div class="title_sub">수정</div>
                </div>
                <div class="frame_bottom">
                    <div class = "head">
                        <div class = "right">
                            <p>담당 과목</p>
                        </div>
                        <div class = "left">
                            <p>인원</p>
                        </div>
                    </div>
                    <div class = "sugang">
                        <div class = "ul_container con1">
                            <ul class = "right">
                            	<%
                            		for(int i=0; i<sbDTO.size(); i++){
                            	%>
                                <li><p><%=sbDTO.get(i) %></p></li>
                                <%
                            		}
                                %>
                            </ul>
                            <ul class = "left">
	                            <%
	                            	for(int i=0; i<sbDTO.size(); i++){
	                            %>
                                <li><input type="button" name="human_count" value="<%=cmap.get(sbDTO.get(i)) %>" onclick = "func('<%= sbDTO.get(i) %>')"></li>
                                <%
                            		}
                                %>
                            </ul>
                        </div>
                    </div>
                    <div class = "foot">
                        <p><i class="fa-solid fa-angle-left"></i></p>
                        <p><i class="fa-solid fa-angle-right"></i></p>
                    </div>
                </div>
            </div>
            <!--프레임 끝-->    
        </div>
<!--기본 틀 안에 내용 작성 끝-->
   </section>
<!--틀 끝-->
</body>
</html>