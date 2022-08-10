<%@ page language="java" contentType="text/html; charset=UTF-8" session = "true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.util.*" %>
<%@ page import="mvc.model.BoardDTO" %>

<%
	String sessionName = (String) session.getAttribute("p_name");
	ArrayList<BoardDTO> boardlist = (ArrayList<BoardDTO>) request.getAttribute("boardlist");
	ArrayList<String> ssubject = (ArrayList<String>) request.getAttribute("ssubject");
	
	String search = (String) request.getAttribute("search");
	
	int pageNum = (Integer) request.getAttribute("pageNum"); //pageNum
	int total_page = (Integer) request.getAttribute("total_page");

	int start = 1 ;
	int end = 5;
	if(total_page<4){
		start = 1;
		end = total_page;
	}
	
	if(pageNum>4){
		start=pageNum-2;
		end = start+4;
	}

	if(total_page<=end){
		end=total_page;
		if (total_page>4){
			start=total_page-4;
		}
	}
	
%>
<html>
<head>
	<meta charset="UTF-8">
	<title>교직원 게시판 목록</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/p_boardlist.css">
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
         <div class="incontain">
             <div class="p-contain">
                 <div class="title">과목 게시판</div>
                 <!--수정은 기본 display-none 필요하면 사용-->
                 <div class="title_sub">수정</div>
             </div>
             <div class = "select_form">
             	<form action="http://localhost:8080/pro5_lms/board/ListAction1">
	            <select name="subjects" id="select_subject">
	               		<option value="sub_all">전체</option>
	               <%
	              		for (int i = 0; i < ssubject.size(); i++) {
							String subjects = ssubject.get(i);
                      		if(subjects.equals(search)){              
                   %>
                        <option selected value="<%=subjects%>"><%=subjects%></option>
                   <% 
                      		}else{
                   %>
                   		<option value="<%=subjects%>"><%=subjects%></option>
                   <%   			
                      		}
                      	}
                   %>
	            </select>
	            <input type="submit" class="sel_subject" value="검색">
	            </form>
             </div>
             <div class="posts">
                 <div class="table">
                     <ul class="first">
                         <li class="td a"><p>번호</p></li>
                         <li class="td b"><p>작성자</p></li>
                         <li class="td c"><p>제목</p></li>
                         <li class="td d"><p>과목</p></li>
                         <li class="td e"><p>작성일</p></li>
                     </ul>
                     <%
						for (int i = 0; i < boardlist.size(); i++) {
							BoardDTO dto =  (BoardDTO) boardlist.get(i); 	
					 %>         
                     <ul class="tr">
                         <li class="td a"><p><%=dto.getPo_num() %></p></li>
                         <li class="td b"><p><%=dto.getP_name() %></p></li>
                         <li class="td c"><a href="http://localhost:8080/pro5_lms/board/p_post?num=<%=dto.getPo_num()%>&pageNum=<%=pageNum%>"><%=dto.getPo_subject()%></a></li>
                         <li class="td d"><p><%=dto.getSub_name() %></p></li>
                         <li class="td e"><p><%=dto.getPo_date() %></p></li>
                     </ul>
                     <%
						}
                     %>
                 </div>
                 <div class="pages">
                    
                    <%
                    if(pageNum==1){
                    %>
                    	<div class="left"><a><i class="fa-solid fa-angle-left"></i></a></div>
                    <% 
                    }
                    else{
                    %>
                    	<div class="left"><a href="http://localhost:8080/pro5_lms/board/ListAction1?pageNum=<%=pageNum-1%>&subjects=<%=search%>"><i class="fa-solid fa-angle-left"></i></a></div>
                    <% 	
                    }
                     	for(int j =start; j<=end; j++){
                     		if (j == pageNum){
                     %>
                     <div class="number"><a href="http://localhost:8080/pro5_lms/board/ListAction1?pageNum=<%=j%>" style="color:black;"><%=j %></a></div>
                    <%
                     		}
                     		else{
                    %>
          			<div class="number"><a href="http://localhost:8080/pro5_lms/board/ListAction1?pageNum=<%=j%>"><%=j %></a></div>
           			<%
                     		}
                     	}
                     if(pageNum==total_page){
                     %>
                     <div class="right"><a><i class="fa-solid fa-angle-right"></i></a></div>
                     <% 
                    }
                    else{
                    %>
                    <div class="right"><a href="http://localhost:8080/pro5_lms/board/ListAction1?pageNum=<%=pageNum+1%>&subjects=<%=search%>"><i class="fa-solid fa-angle-right"></i></a></div>
                    <% 	
                    }
                    %>
                 </div>
                 <div class="bottom">
                     <a href="http://localhost:8080/pro5_lms/board/p_write">글쓰기</a>
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