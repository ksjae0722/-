<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "mvc.model.QuestionDTO" %>
<%
String sub_name = (String)request.getAttribute("sub_name");
ArrayList<QuestionDTO> queDTO_list = (ArrayList<QuestionDTO>)request.getAttribute("queDTO_list");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시험응시팝업</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="../resource/CSS/s_popup_exam.css">
</head>
<script language = "JavaScript">
    function funcchk(){
    	var asdf = document.getElementsByClassName('must');
    	var chkcnt = 0;
    	
    	for (let i = 0; i < asdf.length; i++){
    		if (asdf[i].checked == true){
    			chkcnt++;
    		}
    	}
    	
    	if (chkcnt < 20){
    		alert("정답을 입력하세요.");
    		return false;
    	}
        if (confirm("정말로 제출하시겠습니까?")){
        	document.exam_form.method = "post"
           	window.opener.name = "s_exam.jsp";
           	document.exam_form.target = "s_exam.jsp";
           	document.exam_form.action = "s_exam.so";
   			document.exam_form.submit();
           	alert("저장이 완료되었습니다.");
           	self.close();
        }
        else{
            return false
        }
    }
 </script>

<body>
    <div class = "container">
        <p><%= sub_name %> 온라인 시험</p>
        <form name = "exam_form" action = "p_exam.per">
	        <%
	        for (int i=0; i < queDTO_list.size(); i++){
	        	QuestionDTO queDTO = queDTO_list.get(i);
	        %>
	        	<div class = "test">
	        		<p><%= queDTO.getEx_num() %></p>
		            <textarea readonly><%= queDTO.getEx_contents() %></textarea>
		            <div class = "check_container">
		            	<input type="radio" name = "check<%=queDTO.getEx_num()%>" id = "num<%=queDTO.getEx_num()%>-1" value="1" class = "must"/>
		                <label for="num<%=queDTO.getEx_num()%>-1">1번</label>
		                <input type="radio" name = "check<%=queDTO.getEx_num()%>" id = "num<%=queDTO.getEx_num()%>-2" value="2" class = "must"/>
		                <label for="num<%=queDTO.getEx_num()%>-2">2번</label>
		                <input type="radio" name = "check<%=queDTO.getEx_num()%>" id = "num<%=queDTO.getEx_num()%>-3" value="3" class = "must"/>
		                <label for="num<%=queDTO.getEx_num()%>-3">3번</label>
		                <input type="radio" name = "check<%=queDTO.getEx_num()%>" id = "num<%=queDTO.getEx_num()%>-4" value="4" class = "must"/>
		                <label for="num<%=queDTO.getEx_num()%>-4">4번</label>
		            </div>
	        	</div>
	        <%
	        }
	        %>
	        <input type = "hidden" name = "subject_name" value = "<%= sub_name %>">
            <input type="button" value="제출하기" name = "submit_btn" onclick = "funcchk()">
        </form>
    </div>
</body>
</html>