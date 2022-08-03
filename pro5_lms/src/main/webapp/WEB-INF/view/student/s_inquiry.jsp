<%@ page language="java" contentType="text/html; charset=UTF-8" session = "true"
    pageEncoding="UTF-8"%>
<%@ page import="mvc.model.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<%
	ArrayList<lectureDTO> scorelist = (ArrayList<lectureDTO>) request.getAttribute("scorelist");
	ArrayList<ssubjectDTO> isuhakjum = (ArrayList<ssubjectDTO>) request.getAttribute("isuhakjum");
	Calendar ld = Calendar.getInstance();
	int totalhakjum = (int) request.getAttribute("totalhakjum");
	int gethakjum = (int) request.getAttribute("gethakjum");
	float average = (float) request.getAttribute("average");

%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성적조회</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/s_inquiry.css">
</head>
<body>
<!--nav 시작-->
    <nav id = "navbar">
        <div class = "nav_container">
            <div class = "nav_logo_container">
                <a href = "http://localhost:8080/pro5_lms/student/s_main"><img src="../resource/images/logo.png" alt="ITUNIVERSITY"></a>
            </div>
            <div class = "nav_user_container">
                <a>${remember.getName()}</a>
            </div>
            <div class = "nav_ul_container information">
                <ul>
                    <input type="checkbox" name="box" id="box1">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box1">학적 관리</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_info">기본 정보 조회</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container enrolment">
                <ul>
                    <input type="checkbox" name="box" id="box2">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box2">수강 신청</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_subject">수강 신청</a></li>
                    <li><a href="http://localhost:8080/pro5_lms/student/s_schedule">시간표 조회</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container test">
                <ul>
                    <input type="checkbox" name="box" id="box3">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box3">시험 응시</label>
                    </div>
                   
                    <li><a href="http://localhost:8080/pro5_lms/student/s_exam">시험 응시</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container gradecheck">
                <ul>
                    <input type="checkbox" name="box" id="box4" checked>
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box4">성적 조회</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_inquiry">성적 조회</a></li>
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
                    <div class="title">성적조회</div>
                    <!--수정은 기본 display-none 필요하면 사용-->
                    <div class="title_sub">수정</div>
                </div>
                <div class="frame_bottom">
                    <div>
                        <div>
                            <div class="th">년도</div>
                            <div class="th">학기</div>
                            <div class="th">교과구분</div>
                            <div class="th wide">과목명</div>
                            <div class="th">학점</div>
                            <div class="th">등급</div>
                            <div class="th">비고</div>
                        </div>
                        <%
                        	for(int i=0; i<scorelist.size(); i++){
                        		if(scorelist.get(i).getSub_name().equals(isuhakjum.get(i).getSub_name())){
                        %>
			                        <div>
			                            <div class="a td"><%=scorelist.get(i).getLec_year()%></div>
			                            <div class="a td"><%=scorelist.get(i).getLec_semester()%></div>
			                            <div class="a td"><%=isuhakjum.get(i).getSub_isu()%></div>
			                            <div class="a td wide"><%=scorelist.get(i).getSub_name()%></div>
			                            <div class="a td"><%=isuhakjum.get(i).getSub_hakjum()%></div>
			                            <div class="a td"><%=scorelist.get(i).getLec_score()%></div>
			                            <div class="a td">&nbsp;</div>
			                        </div>
                        <%
                        		}
                        	}
                        %>
                        <div>
                            <div class="last td"><%=ld.get(Calendar.YEAR)%></div>
                            <div class="last td width">신청학점 <%=totalhakjum%> &nbsp; | &nbsp; 취득학점 <%=gethakjum%> &nbsp; | &nbsp; 평균평점 <%=average%>
                            </div>
                        </div>
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