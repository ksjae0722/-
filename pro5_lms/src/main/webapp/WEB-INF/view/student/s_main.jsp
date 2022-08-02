<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.*" %>
<!DOCTYPE html>
<%
String sessionName = (String) request.getAttribute("s_name");
ArrayList<calendarDTO> callist = (ArrayList<calendarDTO>) request.getAttribute("callist");	
ArrayList<BoardDTO> boardlist = (ArrayList<BoardDTO>) request.getAttribute("boardlist");
ArrayList<ssubjectDTO> ssubject = (ArrayList<ssubjectDTO>) request.getAttribute("mylist"); 
ArrayList<notice_boardDTO> nbArr = (ArrayList<notice_boardDTO>)request.getAttribute("nbArr");

int CpageNum = (Integer) request.getAttribute("CpageNum"); 
int Ctotal_page = (Integer) request.getAttribute("Ctotal_page");

int total_record = (Integer) request.getAttribute("total_record");
int pageNum = (Integer) request.getAttribute("pageNum"); //pageNum
int total_page = (Integer) request.getAttribute("total_page");

int nbPageNum = (Integer) request.getAttribute("nbPageNum"); //pageNum
int nbtotalpage = (Integer) request.getAttribute("nbtotalpage");

int num = 0; 
if(request.getParameter("num") !=null){
   num= Integer.parseInt(request.getParameter("num"));
}
if (num==1){
%>
   <script type="text/javascript">
      alert("로그인 성공")
   </script>
<%
}
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학생 메인</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/s_main.css">
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
    <section id="format">
        <!--배너 시작-->
        <div class ="banner">
            <input type="button" value="로그아웃"  onClick="location.href='http://localhost:8080/pro5_lms/member/logout.do'">
        </div>
        <!--배너 끝-->
        <div class="main">
            <div class="frame">
            <!--프레임 시작-->
                <div class = "top">
                    <img src="../resource/images/logo.png" alt="img">
                </div>
                <div class = "middle">
                    <div class = "left">
                        <div class = "info_container">
                            <a href = "<c:url value='/board/s_noticeboardlist.notice'/>">공지사항</a>
                            <div>
								<%
								if (nbPageNum == 1)
									{
									}
								
								else
									{
	                        	%>
                                	<a href="http://localhost:8080/pro5_lms/student/s_main.so?nbPageNum=<%=nbPageNum-1%>"><i class="fa-solid fa-angle-left"></i></a>
								<%
									}

								if (nbPageNum == nbtotalpage)
									{
									}

								else
									{
								%>
                                <a href="http://localhost:8080/pro5_lms/student/s_main.so?nbPageNum=<%=nbPageNum+1%>"><i class="fa-solid fa-angle-right"></i></a>
								<%
									}
								%>
                            </div>
                        </div>
                        <div class = "ul_container">
                            <ul>
                            	<%
                            	for (int i = 0; i < nbArr.size(); i++)
                            		{
                            		notice_boardDTO nbDTO = nbArr.get(i);
                            	%>
                            		<li><div class="list"><%= nbDTO.getN_num() %></div><a href="http://localhost:8080/pro5_lms/board/s_notice.notice?num=<%=nbDTO.getN_num()%>&pageNum=<%=nbPageNum%>"><%=nbDTO.getN_subject()%></a></li>
                            	<%
                            		}
                            	%>
                            </ul>
                        </div>
                    </div>
                    <div class = "right">
                        <div class = "info_container">
                            <p>학사일정</p>
                            <div>
                                <a href="http://localhost:8080/pro5_lms/student/s_main.so?CpageNum=<%=CpageNum-1%>"><i class="fa-solid fa-angle-left"></i></a>
                                <a href="http://localhost:8080/pro5_lms/student/s_main.so?CpageNum=<%=CpageNum+1%>"><i class="fa-solid fa-angle-right"></i></a>
                            </div>
                        </div>
                        <div class = "ul_container">
                            <ul>
                          	<%
                          		for(int i=0; i<callist.size(); i++){
                          			calendarDTO calen = callist.get(i);
                          	%>
                                <li><div class="list"><%=calen.getCal_num() %></div><a><%=calen.getDate1()%>~<%=calen.getDate2()%>&nbsp;<%=calen.getCal_contents() %></a></li>                                
                            <%
                          		}
                            %>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class = "bottom">
                    <div class = "top">
                        <a href = "http://localhost:8080/pro5_lms/board/ListAction2.go?pageNum=1">과목별 게시판</a>
                        
                        <form action="http://localhost:8080/pro5_lms/student/s_main.so">
	                        <select name="subjects" id="class">
	                            <option value="sub_all">전체</option>
				               <%
				               for(int i=0; i<ssubject.size(); i++){
                      				ssubjectDTO ssubdto = ssubject.get(i);
			                                    
			                   %>
			                        <option value="<%=ssubdto.getSub_name() %>"><%=ssubdto.getSub_name() %></option>
			                   <% 
			                        }
			                   %>
	                        </select>
	                        <input type="submit" class="sel_subject" value="검색">
                        </form>
                    </div>
                    <div class = "middle">
                        <%
							int i = 1;
                        	for (i = 0; i < boardlist.size(); i++) {
							BoardDTO dto =  (BoardDTO) boardlist.get(i); 	
					 	%> 
	                        <ul>
	                            <li><div class="list"><%=dto.getPo_num() %></div><a href="http://localhost:8080/pro5_lms/board/s_post.go?num=<%=dto.getPo_num()%>&pageNum=<%=pageNum%>"><%=dto.getPo_subject()%></a></li>
	                        </ul>
                        <%
							}
                        %>
                    </div>
                    <div class = "bottom">
                        <div class="space"></div>
                        <div>
		                    <%
		                    	if(pageNum==1){
		                    %>
		                    	<a><i class="fa-solid fa-angle-left"></i></a>
		                    <% 
			                    }
			                    else{
		                    %>
		                    	<a href="http://localhost:8080/pro5_lms/student/s_main.so?pageNum=<%=pageNum-1%>"><i class="fa-solid fa-angle-left"></i></a>
		                    <%
			                    }
		                    	if(pageNum==total_page){
		                    %> 
		                        <a><i class="fa-solid fa-angle-right"></i></a>
		                    <%
		                    	}
		                    	else{
		                    %>
		                        <a href="http://localhost:8080/pro5_lms/student/s_main.so?pageNum=<%=pageNum+1%>"><i class="fa-solid fa-angle-right"></i></a>
		                    <%
		                    	}
		                    %>        
                        </div>
                        <div class = "text_container">
                            
                        </div>
                    </div>
                
                    
                </div>
            </div>
        <!--프레임 끝-->    
        </div>
   </section>
<!--틀 끝-->
</body>
</html>