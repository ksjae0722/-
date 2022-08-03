<%@ page language="java" contentType="text/html; charset=UTF-8" session = "true"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String abc = (String)request.getAttribute("IdPwNum");
String num = (String)request.getAttribute("num");

if(num!=null)
	{
	if(num.equals("1"))
		{
%>
		<script type="text/javascript">
			alert("회원가입이 완료되었습니다.")
		</script>
<%		
		}
	
	if(num.equals("2"))
		{
%>
		<script type="text/javascript">
			alert("비밀번호가 변경되어 로그아웃 되었습니다.")
		</script>
<%		
		}

	if(num.equals("3"))
		{
%>
		<script type="text/javascript">
			alert("로그아웃 되었습니다.")
		</script>
<%
		}
	}

if (abc == null){}

else if(abc.equals("3"))
   {
%>
   <script type="text/javascript">
         alert("아이디/비밀번호를 확인해주세요.")
   </script>
<%
   }
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="http://localhost:8080/pro5_lms/resource/CSS/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    
	<script type="text/javascript">
		function idpwcheck(){
			if(document.getElementById("id").value == "")
				{
				alert("아이디를 입력해주세요.");
				document.login_form.id.focus();
				return false;
				}
			
			if(document.getElementById("passwd").value == "")
				{
				alert("비밀번호를 입력해주세요.");
				document.login_form.passwd.focus();
				return false;
				}
			
			document.login_form.submit();
		}
	</script>
</head>
<body>
	<div class="section">
        <div class="container">
            <div class="left-box">
                <img src="../resource/images/login.jpg" alt="" class="banner">
            </div>
            <div class="right-box">
               <div class="service">
                    <div class="image">
                        <img src="../resource/images/logo.png" class="logo">
                    </div>
                    <div class="integrated"><a>통합서비스 </a><span>로그인</span></div>
                    <div class="login">
                        <form action="http://localhost:8080/pro5_lms/member/login_process" class="form" name = "login_form" method="post">
                            <div class="input">                           
                                <input type="text" name="id" id="id" placeholder="아이디/직번">                        
                                <input type="password" name="passwd" id="passwd" placeholder="비밀번호">
                            </div>
                            <div class="submit">                                         
                                <input type="button" onclick="idpwcheck()" name = "button" class="btn-login" value="로그인"></input>
                            </div>
                        </form>
                    </div>
                    <button class="signin"><a href="http://localhost:8080/pro5_lms/member/join">회원가입</a></button>         
                </div>    
                <div class="text">
                    <p>주소 : (11111) 경남 창원시 마산합포구 영덕동 15-27번지 경민인터빌 407호</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>