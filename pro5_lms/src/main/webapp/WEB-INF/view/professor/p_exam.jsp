<%@ page language="java" contentType="text/html; charset=UTF-8" session = "true"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
<%
ArrayList<String> ssubject = (ArrayList<String>) request.getAttribute("ssubject");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시험문제출제</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="http://localhost:8080/pro5_lms/resource/CSS/p_exam.css">
</head>

<Script language="JavaScript">
    function func()
        {
   		var sv = document.getElementsByClassName('subjectval'); // 'class이름' 요소를 배열로 반환하는 함수
   		var objectsv;
   		for (let i = 0; i < sv.length; i++)
   			{
   			if (sv[i].selected == true)
   				{
   				objectsv = sv[i].value;
   				}
   			}
       	window.open('p_popup_exam?subject='+objectsv, '시험출제', 'Width=1600px, Height=1000px, Top=50px, Left=100px, Toolbar=yes, Menubar=yes, Statusbar=yes, Scrollbar=yes, Resizable=yes, fullscreen=yes');
		}
</Script>
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
                    <input type="checkbox" name="box" id="box3" checked>
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
                <div class="frame_top">
                    <div class="title">시험문제 출제</div>
                    <!--수정은 기본 display-none 필요하면 사용-->
                    <div class="title_sub">수정</div>
                </div>
                <div class="frame_bottom">
                    <form class="sub-box" action = "p_popup_exam" method = "post">
                        <select name="subject" id="subject">
							<%
							for (int i = 0; i < ssubject.size(); i++)
								{
								String subjects = ssubject.get(i);
							%>
								<option class="subjectval" value="<%=subjects%>"><%=subjects%></option>
                            <%
								}
                            %>
                        </select>
                        <input type="button" value="출제하기" onclick="func()">
                    </form>
                    <div class="text">                            
                        <span>*시험 원안 작성 시 유의사항*</span>
                        <div class="textbox">
                            <div class="text-first">
                                <p>1) 모든 문항 끝에 배점 표기는 [  ]를 사용한다.  예) [3점]</p>
                                <p>2) 원안지(타이틀 부분)의 글꼴은 바꾸지 않는다. </p>
                                <p>3) 글자 크기는 11 포인트로 한다.</p>
                                <p>4) 선택지 배열은 글자 수가 적은 것을 앞에 배열한다.
                                예) ① 어머니   ② 어머니와 아들  ③ 어머니와 예쁜 인형... </p>
                                <p>5) 문항의 질문 형태를 긍정문으로 하고, 부정문의 비율을 최소화한다.</p>
                                <p>6) 문항의 질문 형태가 부정문일 경우는 부정어에 밑줄만 친다. 
                                예) ... 옳지 않은 것은? ...이 아닌 것은?</p>
                                <p>7) 문제를 공동 출제할 경우, 담당 교사 간 문항의 형태는 한가지로 통일한다.
                                    예)  ... 알맞은 것을 찾으면? / .... 알맞은 것은?  / 옳은 것은?
                                        가장 적절한 것은? / 적절하지 않은 것은? / ... 가장 적절한 것을 고르시오
                                        에 대한 설명으로 옳은 것만을 <보기>에서 있는 대로 고른 것은? 
                                        ...의 값을 구하시오 / 의 값(합, 곱)은?</p>
                            </div>
                            <div class="text-second">                                
                                <p>8) 2문제 이상 출제되는 지문일 경우는 그 지문에 테두리를 한다.</p>
                                <p>9) 선택지가 '① ㉠㉡㉢'인 경우 → ‘① ㉠, ㉡, ㉢ ’로 표기(쉼표와 뛰어 쓰기)</p>
                                <p>10) 문항 답지의 띄우기 칸 수를 동일하게 한다.</p>
                                <p>11) 문제를 진하게 하지 않는다.</p>
                                <p>12) 원안지 하단(꼬리말)에 이수과정을 표시한다.</p>
                                    ․ 1학년 (공통)과정 
                                    ․ 2학년 (인문사회공통)과정 또는 (자연공통)과정   
                                    ․ 3학년 (인문사회공통)과정 또는 (자연공통)과정
                                <p>13) <보기>가 있는 문항의 경우, 질문에 ‘아래 <보기>’등의 표현을 넣는다.</p>
                                <p>14) 출제문항 수를 조절한다. </p>
                                <p>15) 문항 작성 시 띄어쓰기에 유의한다. (시험문항 공개됨)</p>
                                <p>16) 원안 제출 후 수정하거나, 채점 후 문항 오류가 생기는 일이 없도록 여러 번 확인한다.</p>
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