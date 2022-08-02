<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.*" %>
<!DOCTYPE html>
<%
	ArrayList<ssubjectDTO> MonList = (ArrayList<ssubjectDTO>) request.getAttribute("MonList");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시간표</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/s_schedule.css">
</head>
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
                    <input type="checkbox" name="box" id="box2" checked>
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
                    <input type="checkbox" name="box" id="box3">
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
                    <div class="title">시간표</div>
                    <!--수정은 기본 display-none 필요하면 사용-->
                    <div class="title_sub">수정</div>
                </div>
                <div class="frame_bottom">
                        <div class="tablewrap">
					        <div class="tb_time">
					            <table>
					                <tr>
					                    <th class="tb_first">교시</th>
					                </tr>
					                <tr>
					                    <th class="tb">1교시<br>09:00 ~ 09:50</th>
					                </tr>
					                <tr>
					                    <th class="tb">2교시<br>10:00 ~ 10:50</th>
					                </tr>
					                <tr>
					                    <th class="tb">3교시<br>11:00 ~ 11:50</th>
					                </tr>
					                <tr>
					                    <th class="tb">4교시<br>12:00 ~ 12:50</th>
					                </tr>
					                <tr>
					                    <th class="tb">5교시<br>13:00 ~ 13:50</th>
					                </tr>
					                <tr>
					                    <th class="tb">6교시<br>14:00 ~ 14:50</th>
					                </tr>
					                <tr>
					                    <th class="tb">7교시<br>15:00 ~ 15:50</th>
					                </tr>
					                <tr>
					                    <th class="tb">8교시<br>16:00 ~ 16:50</th>
					                </tr>
					                <tr>
					                    <th class="tb">9교시<br>17:00 ~ 17:50</th>
					                </tr>
					            </table>
					        </div>
					        
					        <div class="tb_day tb_mon">
					            <table>
					                <tr>
					                    <th class="tb_first">월</th>
					                </tr>
					                <%
					                	String[] pname = new String[MonList.size()];
					                	String[] subname = new String[MonList.size()];
					                	int[] room = new int[MonList.size()];
					                	int[] hakjum = new int[MonList.size()];
					                	String time = "";
					                	int mon_x=0;
					                	int mon_y=0;
					                	int mon_z=0;
					                	for(int j=0; j<MonList.size(); j++){
					                		pname[j] = MonList.get(j).getP_name();
					                		subname[j] = MonList.get(j).getSub_name();
					                		room[j] = MonList.get(j).getSub_room();
					                		hakjum[j] = MonList.get(j).getSub_hakjum();
					                		if (j == 0) {
					                			time = MonList.get(j).getSub_classtime();
					                		}
					                		else {
					                			time += "," + MonList.get(j).getSub_classtime();
					                		}
					                	}
					                	String[] times = time.split(",");
					                	for(int i=9; i<18; i++){
					                		if (i==Integer.valueOf(times[mon_x])) {
					                %>
					                	<tr>
						                    <th class="tb"><%=subname[mon_z] %><br><%=room[mon_z] %><br><%=pname[mon_z] %></th>
						                </tr>
					                <%
					                			mon_x++;
					                			mon_y++;
					                			if (mon_y == hakjum[mon_z]) {
					                				mon_y = 0;
					                				mon_z++;
					                			}
					                			
					                		}
					                		else{
					                %>
						                <tr>
						                    <th class="tb"></th>
						                </tr>
					                <%
					                		}
					                	}
					                %>
					            </table>
					        </div>
					
					        <div class="tb_day tb_tue">
					            <table>
					                <tr>
					                    <th class="tb_first">화</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					            </table>
					        </div>
					
					        <div class="tb_day tb_wed">
					            <table>
					                <tr>
					                    <th class="tb_first">수</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					            </table>
					        </div>
					
					        <div class="tb_day tb_thu">
					            <table>
					                <tr>
					                    <th class="tb_first">목</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					                <tr>
					                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
					                </tr>
					            </table>
					        </div>
					
					        <div class="tb_day tb_fri">
            <table>
                <tr>
                    <th class="tb_first">금</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
                <tr>
                    <th class="tb">과목명<br>강의실번호<br>교수명</th>
                </tr>
            </table>
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