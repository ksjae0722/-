<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "mvc.model.ssubjectDTO" %>
<%@ page import = "mvc.model.QuestionDTO" %>
<%@ page import = "java.util.ArrayList" %>
    
<%
ArrayList<ssubjectDTO> mylist = (ArrayList<ssubjectDTO>)request.getAttribute("mylist");
ArrayList<QuestionDTO> queDTO_List = (ArrayList<QuestionDTO>)request.getAttribute("queDTO_List");
ArrayList<QuestionDTO> isTest_List = (ArrayList<QuestionDTO>)request.getAttribute("isTest_List");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시험응시</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/s_exam.css">
</head>

<Script language="JavaScript">
    function func(subject_name)
        {
        window.open('s_popup_exam.so?subject='+subject_name, '시험출제', 'Width=1600px, Height=1000px, Top=50px, Left=100px, Toolbar=yes, Menubar=yes, Statusbar=yes, Scrollbar=yes, Resizable=yes, fullscreen=yes');
        }

    function No_try()
        {
        alert("이미 답안을 제출한 시험은 다시 응시할 수 없습니다.")
        }
</Script>

<body>
   <!--nav 시작-->
    <nav id = "navbar">
        <div class = "nav_container">
            <div class = "nav_logo_container">
                <a href = "http://localhost:8080/pro5_lms/student/s_main.so"><img src="../resource/images/logo.png" alt="ITUNIVERSITY"></a>
            </div>
            <div class = "nav_user_container">
                <a><%=session.getAttribute("s_name") %></a>
            </div>
            <div class = "nav_ul_container information">
                <ul>
                    <input type="checkbox" name="box" id="box1">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box1">학적 관리</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_info.so">기본 정보 조회</a></li>
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
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_subject.so">수강 신청</a></li>
                    <li><a href="http://localhost:8080/pro5_lms/student/s_schedule.so">시간표 조회</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container test">
                <ul>
                    <input type="checkbox" name="box" id="box3" checked>
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box3">시험 응시</label>
                    </div>
                   
                    <li><a href="http://localhost:8080/pro5_lms/student/s_exam.so">시험 응시</a></li>
                </ul>
            </div>

            <hr>

            <div class = "nav_ul_container gradecheck">
                <ul>
                    <input type="checkbox" name="box" id="box4">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box4">성적 조회</label>
                    </div>
                    
                    <li><a href="http://localhost:8080/pro5_lms/student/s_inquiry.so">성적 조회</a></li>
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
                    <div class="title">시험 응시</div>
                    <!--수정은 기본 display-none 필요하면 사용-->
                    <div class="title_sub">수정</div>
                </div>
                <div class="frame_bottom">
                	<%
                	for (int i = 0; i < isTest_List.size(); i++)
                		{
                		
                		QuestionDTO isTest_DTO = isTest_List.get(i);
                		
                		for (int j = 0; j < mylist.size(); j++)
                			{
                			ssubjectDTO subDTO = mylist.get(j);
                			
                			if (isTest_DTO.getSub_name().equals(subDTO.getSub_name()))
                				{
                	%>
                				<form action = "s_popup_exam.so" name = "subject_form" class="subject">
			                        <div class="sname">2020 2학기 <%= subDTO.getSub_name() %></div>                        
			                        <div class="excute">
			                        	<%
			                        	QuestionDTO queDTO = queDTO_List.get(j);
			                        	if(queDTO.getAnslist().equals(""))
			                        		{
			                        	%>
			                            	<input type="button" value="응시하기" class="before1" onclick="func('<%=subDTO.getSub_name()%>')">
			                            <%
			                        		}
			                        	
			                        	else
			                        		{
			                            %>
			                            	<input type="button" value="응시완료" class="before2" onclick = "No_try()">
			                            <%
			                        		}
			                            %>
			                        </div>
			                    </form>
                	<%
                				}
                			}
                		}
                	%>
                </div>
            </div>
            <!--프레임 끝-->    
        </div>
<!--기본 틀 안에 내용 작성 끝-->
   </section>
<!--틀 끝-->
</body>
</html>