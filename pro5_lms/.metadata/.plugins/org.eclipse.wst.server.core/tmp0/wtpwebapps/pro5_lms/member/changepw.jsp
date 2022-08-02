<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="changepw.css">
    <title>비밀번호변경</title>
</head>
<body>
	<div class="background">
        <div class="pw_container">
            <div class="pw_back">
                <div class="pw_section1">
                    <h1>비밀번호 변경</h1>
                    <p>이전에 사용하신 비밀번호는 새비밀번호로 사용하실 수 없습니다.</p>
                    <p>비밀번호를 변경하시면 자동 로그아웃되며 새비밀번호로 로그인하시기 바랍니다.</p>
                </div>
                <div class="pw_section2">
                        <ul>
                            <li><input type="readonly" class="box number" name="pw_number" placeholder="11111111"></li>
                            <li><input type="password" class="box" name="pw_before" placeholder="이전 비밀번호"></li>
                            <li><input type="password" class="box" name="pw_new" placeholder="새 비밀번호"></li>
                            <li><input type="password" class="box" name="pw_newchk" placeholder="새 비밀번호 확인"></li>
                            <div><span>비밀번호 일치</span></div>
                            <li><a href="chagepw.html">비밀번호 변경</a></li>
                        </ul>
                </div>
            </div>
        </div>
    </div>
</body>
</html>