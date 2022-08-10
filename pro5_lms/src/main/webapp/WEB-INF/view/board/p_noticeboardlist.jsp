<%@ page language="java" contentType="text/html; charset=UTF-8" session = "true"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.notice_boardDTO"%>

<%
ArrayList nblist = (ArrayList) request.getAttribute("nblist");
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교직원 공지사항 목록</title>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/p_noticeboardlist.css">
</head>
<body>
<!--nav 시작-->
    <nav id = "navbar">
        <div class = "nav_container">
            <div class = "nav_logo_container">
                <a href = "<c:url value='/professor/p_main'/>"><img src="../resource/images/logo.png" alt="ITUNIVERSITY"></a>
            </div>
            <div class = "nav_user_container">
                <a>
				${remember.getName()}
				</a>
            </div>
            <div class = "nav_ul_container information">
                <ul>
                    <input type="checkbox" name="box" id="box1">
                    <div>
                        <i class="fa-brands fa-blogger"></i>
                        <label for="box1">교원 정보</label>
                    </div>
                    
                    <li><a href="<c:url value='/professor/p_info'/>">기본 정보 조회</a></li>
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
                    
                    <li><a href="<c:url value='/professor/p_lecture'/>">수강 신청 현황</a></li>
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
                   
                    <li><a href="<c:url value='/professor/p_exam'/>">시험 출제</a></li>
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
                    
                    <li><a href="<c:url value='/professor/p_score'/>">성적 산출</a></li>
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
         <form class="incontain" action = "p_noticeboardlist">
             <div class="p-contain">
                 <div class="title">공지사항</div>
                 <!--수정은 기본 display-none 필요하면 사용-->
                 <div class="title_sub">수정</div>
             </div>
             <div class = "select_form">
				<select name="items" id="class">
					<option value="n_subject">제목에서</option>
					<option value="n_contents">본문에서</option>
					<option value="p_name">글쓴이에서</option>
				</select>
				<input type="text" name="text" id = "text" />
				<input type="submit" id="btnAdd" value="검색 " />
             </div>
             <div class="posts">
                 <div class="table">
                     <ul class="first">
                         <li class="td a"><p>번호</p></li>
                         <li class="td b"><p>작성자</p></li>
                         <li class="td c"><p>제목</p></li>
                         <li class="td d"><p>부서</p></li>
                         <li class="td e"><p>작성일</p></li>
                     </ul>
                     
                     <%
                     for (int i = 0; i < nblist.size(); i++)
                     	{
						notice_boardDTO nbDTO = (notice_boardDTO) nblist.get(i);
                     %>
						<ul class = "tr">
							<li class = "td a"><p><%= nbDTO.getN_num() %></p></li>
	                     	<li class = "td b"><p><%= nbDTO.getP_name() %></p></li>
	                     	<li class = "td c"><a href = "http://localhost:8080/pro5_lms/board/p_notice?n_num=<%=nbDTO.getN_num()%>&pageNum=<%=pageNum%>"><%=nbDTO.getN_subject()%></a></li>
	                     	<li class = "td d"><p><%= nbDTO.getP_department() %></p></li>
	                     	<li class = "td e"><p><%= nbDTO.getN_date() %></p></li>
						</ul>
                     <%
                     	}
                     %>
                 </div>
                 <div class="pages">
                 	<div class="left"><a href="#"><i class="fa-solid fa-angle-left"></i></a></div>
                 	<c:set var="pageNum" value="<%=pageNum%>" />
                 	<c:forEach var="i" begin="1" end="<%=total_page%>">
                 		<div class="number">
	                 		<a href="<c:url value="/board/p_noticeboardlist?pageNum=${i}" /> ">
		                 		<c:choose>
		                 			<c:when test="${pageNum==i}">
		                 				<font><b>${i}</b></font>
		                 			</c:when>
		                 			<c:otherwise>
		                 				<font>${i}</font>
									</c:otherwise>
								</c:choose>
							</a>
						</div>
                 	</c:forEach>
                     <div class="right"><a href="#"><i class="fa-solid fa-angle-right"></i></a></div>
                 </div>
                 <div class="bottom">
                     <a href="p_noticewrite">글쓰기</a>
                 </div>
             </div>
         </form>
         <!--프레임 끝-->    
     </div>
<!--기본 틀 안에 내용 작성 끝-->
</section>
<!--틀 끝-->
</body>
</html>