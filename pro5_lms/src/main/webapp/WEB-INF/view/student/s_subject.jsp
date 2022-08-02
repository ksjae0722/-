<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.*" %>
<!DOCTYPE html>
<%
	String sessionId = (String) session.getAttribute("s_id");
	ArrayList<ssubjectDTO> sublist = (ArrayList<ssubjectDTO>) request.getAttribute("sublist");
	ArrayList<departmentDTO> majorlist = (ArrayList<departmentDTO>) request.getAttribute("majorlist");
	String searchmajor = (String) request.getAttribute("searchmajor");
	ArrayList<ssubjectDTO> mylist = (ArrayList<ssubjectDTO>) request.getAttribute("mylist");

	int pageNum = (Integer) request.getAttribute("pageNum"); //pageNum
	int total_page = (Integer) request.getAttribute("total_page");
	
	String type = (String) request.getAttribute("type");
	if(type!=null){
		if(type.equals("1")){
			%>
			   <script type="text/javascript">
			      alert("최대 신청 학점(18학점)을 초과하였습니다.")
			   </script>
			<%
		}
		if(type.equals("2")){
			%>
			   <script type="text/javascript">
			      alert("중복된 항목이 있습니다. (과목/시간/요일)")//안내멘트 수정할 것
			   </script>
			<%
		}

		if(type.equals("3")){
			%>
			   <script type="text/javascript">
			      alert("최대수강인원을 초과하였습니다.")
			   </script>
			<%
		}
		
		if(type.equals("4")){
			%>
			   <script type="text/javascript">
			      alert("삭제되었습니다.")
			   </script>
			<%
		}

		if(type.equals("5")){
			%>
			   <script type="text/javascript">
			      alert("수강신청 되었습니다.")
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
    <title>수강신청</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/s_subject.css">
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
                    <div class="title">수강 신청</div>
                    <!--수정은 기본 display-none 필요하면 사용-->
                    <div class="title_sub">수정</div>
                </div>
                <div class="frame_bottom">
                    <input type="radio" name="sugang" id="open_subject" checked>
                    <label for="open_subject" class = "right">개설 과목</label>
                    <input type="radio" name="sugang" id="success_list">
                    <label for="success_list" class = "left">수강 신청 내역</label>

                    <div class = "subject right">
                        <div class = "subject_title">
                            
                        </div>
                        <div class = "case">
                            <div class = "major">
                                <p>학부(과)</p>
                                <form action="http://localhost:8080/pro5_lms/student/s_subject.so">
                                	<select name="sel_sub" class="sel_sub" id="class">
	                                    <option value="major_all">전체</option>
	                                    <%
	                                    	for(int i=0; i<majorlist.size(); i++){
	                                    %>
	                                    	<option value="<%=majorlist.get(i).getD_name()%>"><%=majorlist.get(i).getD_name()%></option>
	                                    <%
	                                    	}
	                                    %>
                                	</select>
                                	<input type="submit" value="검색" class = "sel_submit">
                                </form>
                            </div>
                            <div class = "search">
                                <p>입력 검색</p>
                                <form action="http://localhost:8080/pro5_lms/student/s_subject.so">
                                    <input type="text" name = "code" class = "text" placeholder="과목명 또는 코드">
                                    <input type="submit" value="검색" class = "submit">
                                </form>
                            </div>
                        </div>
                        <div class = "head">
                            <div class = "box one">
                                <p>수강신청</p>
                            </div>
                            <div class = "box two">
                                <p>과목코드</p>
                            </div>
                            <div class = "box three">
                                <p>과목명</p>
                            </div>
                            <div class = "box four">
                                <p>이수구분</p>
                            </div>
                            <div class = "box five">
                                <p>학점</p>
                            </div>
                            <div class = "box six">
                                <p>담당교수</p>
                            </div>
                            <div class = "box seven">
                                <p>강의시간</p>
                            </div>
                        </div>
                        <div class = "sugang">      
                          <%
                          	for(int i=0; i<sublist.size(); i++){
                          		int starttime = sublist.get(i).getSub_time();
                          		int endtime = sublist.get(i).getSub_time()+(sublist.get(i).getSub_hakjum()-1);
                          				
                         %>
                         	<div class = "ul_container con1">
                         		<ul class = "ul_box one">
                              		<li><a href="http://localhost:8080/pro5_lms/student/subjectProcess.so?subject=<%=sublist.get(i).getSub_code()%>"><input type="submit" value = "신청"></a></li>
                          		</ul>
                         		<ul class = "ul_box two">
                              		<li><p><%=sublist.get(i).getSub_code()%></p></li>
                          		</ul>
                           		<ul class = "ul_box three">
                               		<li><p><%=sublist.get(i).getSub_name()%></p></li>
                           		</ul>
                           		<ul class = "ul_box four">
                               		<li><p><%=sublist.get(i).getSub_isu()%></p></li>
                        		</ul>
                           		<ul class = "ul_box five">
                               		<li><p><%=sublist.get(i).getSub_hakjum()%></p></li>
                           		</ul>
                           		<ul class = "ul_box six">
                      		     	<li><p><%=sublist.get(i).getP_name()%></p></li>
                           		</ul>
                           		<ul class = "ul_box seven">
                                	<li><p><%=sublist.get(i).getSub_day()%><br>(<%=starttime%>:00~<%=endtime%>:50)</p></li>
                           		</ul>
                  	 		</div>
                         	<%
                          	}
                          %>     
                        </div>
                        <div class = "foot">
                            
                            <%
		                    	if(pageNum==1){
		                    %>
		                    		<a><p><i class="fa-solid fa-angle-left"></i></p></a>
		                    <% 
		                   		}
		                    	else{
		                    %>
		                    		<a href="http://localhost:8080/pro5_lms/student/s_subject.so?pageNum=<%=pageNum-1%>&sel_sub=<%=searchmajor%>"><p><i class="fa-solid fa-angle-left"></i></p></a>
		                    <% 	
		                    	}
		                     %>
		                     <%
                     			if(pageNum==total_page){
                     		 %>
                     				<a><p><i class="fa-solid fa-angle-right"></i></p></a>
                     		 <% 
                    			}
                    			else{
                   			 %>
                    				<a href="http://localhost:8080/pro5_lms/student/s_subject.so?pageNum=<%=pageNum+1%>&sel_sub=<%=searchmajor%>"><p><i class="fa-solid fa-angle-right"></i></p></a>
		                    <% 	
		                   		}
		                    %>
                        </div>
                    </div>
                    <div class = "subject left">
                        <div class = "subject_title">
                            
                        </div>
                        <div class = "head">
                            <div class = "box one">
                                <p>수강삭제</p>
                            </div>
                            <div class = "box two">
                                <p>과목코드</p>
                            </div>
                            <div class = "box three">
                                <p>과목명</p>
                            </div>
                            <div class = "box four">
                                <p>이수구분</p>
                            </div>
                            <div class = "box five">
                                <p>학점</p>
                            </div>
                            <div class = "box six">
                                <p>담당교수</p>
                            </div>
                            <div class = "box seven">
                                <p>강의시간</p>
                            </div>
                        </div>
                        <div class = "sugang">      
                          <%
                          	for(int i=0; i<mylist.size(); i++){
                          		int starttime = mylist.get(i).getSub_time();
                          		int endtime = mylist.get(i).getSub_time()+(mylist.get(i).getSub_hakjum()-1);
                          				
                         %>
                         	<div class = "ul_container con1">
                         		<ul class = "ul_box one">
                              		<li><a href="http://localhost:8080/pro5_lms/student/deleteProcess.so?subject=<%=mylist.get(i).getSub_code()%>"><input type="submit" value = "삭제"></a></li>
                          		</ul>
                         		<ul class = "ul_box two">
                              		<li><p><%=mylist.get(i).getSub_code()%></p></li>
                          		</ul>
                           		<ul class = "ul_box three">
                               		<li><p><%=mylist.get(i).getSub_name()%></p></li>
                           		</ul>
                           		<ul class = "ul_box four">
                               		<li><p><%=mylist.get(i).getSub_isu()%></p></li>
                        		</ul>
                           		<ul class = "ul_box five">
                               		<li><p><%=mylist.get(i).getSub_hakjum()%></p></li>
                           		</ul>
                           		<ul class = "ul_box six">
                      		     	<li><p><%=mylist.get(i).getP_name()%></p></li>
                           		</ul>
                           		<ul class = "ul_box seven">
                                	<li><p><%=mylist.get(i).getSub_day()%><br>(<%=starttime%>:00~<%=endtime%>:50)</p></li>
                           		</ul>
                  	 		</div>
                         	<%
                          	}
                          %>     
                        </div>
                        <div class = "foot">
                        	<%-- <%
		                    	if(pageNum==1){
		                    %>
		                    		<a><p><i class="fa-solid fa-angle-left"></i></p></a>
		                    <% 
		                   		}
		                    	else{
		                    %>
		                    		<a href="http://localhost:8080/pro5_lms/student/s_subject.so?pageNum=<%=pageNum-1%>&sel_sub=<%=searchmajor%>"><p><i class="fa-solid fa-angle-left"></i></p></a>
		                    <% 	
		                    	}
		                     %>
		                     <%
                     			if(pageNum==total_page){
                     		 %>
                     				<a><p><i class="fa-solid fa-angle-right"></i></p></a>
                     		 <% 
                    			}
                    			else{
                   			 %>
                    				<a href="http://localhost:8080/pro5_lms/student/s_subject.so?pageNum=<%=pageNum+1%>&sel_sub=<%=searchmajor%>"><p><i class="fa-solid fa-angle-right"></i></p></a>
		                    <% 	
		                   		}
		                    %> --%>
                            <p><i class="fa-solid fa-angle-left"></i></p>
                            <p><i class="fa-solid fa-angle-right"></i></p>
                        </div>
                        <!-- * 수강 신청 기간이 끝나면 정정할 수 없습니다.</p> --><p>
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