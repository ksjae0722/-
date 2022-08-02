<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>시험응시팝업</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;700&family=Noto+Sans:wght@200;400;600;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/10dae3550b.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./s_popup_exam.css">
</head>

<script language = "JavaScript">
    function func()
        {
        if (confirm("정말로 제출하시겠습니까?"))
            {
            window.close()
            document.form.submit.submit()
            }

        else
            {
            return false
            }
        }
</script>

<body>
    <div class = "container">
        <p>select학 온라인 시험</p>
        <div class = "test one">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num1-1">
                <label for="num1-1">1번</label>
                <input type="radio" name = "check" id = "num1-2">
                <label for="num1-2">2번</label>
                <input type="radio" name = "check" id = "num1-3">
                <label for="num1-3">3번</label>
                <input type="radio" name = "check" id = "num1-4">
                <label for="num1-4">4번</label>
            </div>
        </div>
        <div class = "test two">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num2-1">
                <label for="num2-1">1번</label>
                <input type="radio" name = "check" id = "num2-2">
                <label for="num2-2">2번</label>
                <input type="radio" name = "check" id = "num2-3">
                <label for="num2-3">3번</label>
                <input type="radio" name = "check" id = "num2-4">
                <label for="num2-4">4번</label>
            </div>
        </div>
        <div class = "test three">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num3-1">
                <label for="num3-1">1번</label>
                <input type="radio" name = "check" id = "num3-2">
                <label for="num3-2">2번</label>
                <input type="radio" name = "check" id = "num3-3">
                <label for="num3-3">3번</label>
                <input type="radio" name = "check" id = "num3-4">
                <label for="num3-4">4번</label>
            </div>
        </div>
        <div class = "test four">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num4-1">
                <label for="num4-1">1번</label>
                <input type="radio" name = "check" id = "num4-2">
                <label for="num4-2">2번</label>
                <input type="radio" name = "check" id = "num4-3">
                <label for="num4-3">3번</label>
                <input type="radio" name = "check" id = "num4-4">
                <label for="num4-4">4번</label>
            </div>
        </div>
        <div class = "test five">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num5-1">
                <label for="num5-1">1번</label>
                <input type="radio" name = "check" id = "num5-2">
                <label for="num5-2">2번</label>
                <input type="radio" name = "check" id = "num5-3">
                <label for="num5-3">3번</label>
                <input type="radio" name = "check" id = "num5-4">
                <label for="num5-4">4번</label>
            </div>
        </div>
        <div class = "test six">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num6-1">
                <label for="num6-1">1번</label>
                <input type="radio" name = "check" id = "num6-2">
                <label for="num6-2">2번</label>
                <input type="radio" name = "check" id = "num6-3">
                <label for="num6-3">3번</label>
                <input type="radio" name = "check" id = "num6-4">
                <label for="num6-4">4번</label>
            </div>
        </div>
        <div class = "test seven">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num7-1">
                <label for="num7-1">1번</label>
                <input type="radio" name = "check" id = "num7-2">
                <label for="num7-2">2번</label>
                <input type="radio" name = "check" id = "num7-3">
                <label for="num7-3">3번</label>
                <input type="radio" name = "check" id = "num7-4">
                <label for="num7-4">4번</label>
            </div>
        </div>
        <div class = "test eight">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num8-1">
                <label for="num8-1">1번</label>
                <input type="radio" name = "check" id = "num8-2">
                <label for="num8-2">2번</label>
                <input type="radio" name = "check" id = "num8-3">
                <label for="num8-3">3번</label>
                <input type="radio" name = "check" id = "num8-4">
                <label for="num8-4">4번</label>
            </div>
        </div>
        <div class = "test nine">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num9-1">
                <label for="num9-1">1번</label>
                <input type="radio" name = "check" id = "num9-2">
                <label for="num9-2">2번</label>
                <input type="radio" name = "check" id = "num9-3">
                <label for="num9-3">3번</label>
                <input type="radio" name = "check" id = "num9-4">
                <label for="num9-4">4번</label>
            </div>
        </div>
        <div class = "test ten">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num10-1">
                <label for="num10-1">1번</label>
                <input type="radio" name = "check" id = "num10-2">
                <label for="num10-2">2번</label>
                <input type="radio" name = "check" id = "num10-3">
                <label for="num10-3">3번</label>
                <input type="radio" name = "check" id = "num10-4">
                <label for="num10-4">4번</label>
            </div>
        </div>
        <div class = "test eleven">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num11-1">
                <label for="num11-1">1번</label>
                <input type="radio" name = "check" id = "num11-2">
                <label for="num11-2">2번</label>
                <input type="radio" name = "check" id = "num11-3">
                <label for="num11-3">3번</label>
                <input type="radio" name = "check" id = "num11-4">
                <label for="num11-4">4번</label>
            </div>
        </div>
        <div class = "test twelve">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num12-1">
                <label for="num12-1">1번</label>
                <input type="radio" name = "check" id = "num12-2">
                <label for="num12-2">2번</label>
                <input type="radio" name = "check" id = "num12-3">
                <label for="num12-3">3번</label>
                <input type="radio" name = "check" id = "num12-4">
                <label for="num12-4">4번</label>
            </div>
        </div>
        <div class = "test thirteen">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num13-1">
                <label for="num13-1">1번</label>
                <input type="radio" name = "check" id = "num13-2">
                <label for="num13-2">2번</label>
                <input type="radio" name = "check" id = "num13-3">
                <label for="num13-3">3번</label>
                <input type="radio" name = "check" id = "num13-4">
                <label for="num13-4">4번</label>
            </div>
        </div>
        <div class = "test fourteen">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num14-1">
                <label for="num14-1">1번</label>
                <input type="radio" name = "check" id = "num14-2">
                <label for="num14-2">2번</label>
                <input type="radio" name = "check" id = "num14-3">
                <label for="num14-3">3번</label>
                <input type="radio" name = "check" id = "num14-4">
                <label for="num14-4">4번</label>
            </div>
        </div>
        <div class = "test fifteen">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num15-1">
                <label for="num15-1">1번</label>
                <input type="radio" name = "check" id = "num15-2">
                <label for="num15-2">2번</label>
                <input type="radio" name = "check" id = "num15-3">
                <label for="num15-3">3번</label>
                <input type="radio" name = "check" id = "num15-4">
                <label for="num15-4">4번</label>
            </div>
        </div>
        <div class = "test sixteen">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num16-1">
                <label for="num16-1">1번</label>
                <input type="radio" name = "check" id = "num16-2">
                <label for="num16-2">2번</label>
                <input type="radio" name = "check" id = "num16-3">
                <label for="num16-3">3번</label>
                <input type="radio" name = "check" id = "num16-4">
                <label for="num16-4">4번</label>
            </div>
        </div>
        <div class = "test seventeen">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num17-1">
                <label for="num17-1">1번</label>
                <input type="radio" name = "check" id = "num17-2">
                <label for="num17-2">2번</label>
                <input type="radio" name = "check" id = "num17-3">
                <label for="num17-3">3번</label>
                <input type="radio" name = "check" id = "num17-4">
                <label for="num17-4">4번</label>
            </div>
        </div>
        <div class = "test eighteen">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num18-1">
                <label for="num18-1">1번</label>
                <input type="radio" name = "check" id = "num18-2">
                <label for="num18-2">2번</label>
                <input type="radio" name = "check" id = "num18-3">
                <label for="num18-3">3번</label>
                <input type="radio" name = "check" id = "num18-4">
                <label for="num18-4">4번</label>
            </div>
        </div>
        <div class = "test nineteen">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num19-1">
                <label for="num19-1">1번</label>
                <input type="radio" name = "check" id = "num19-2">
                <label for="num19-2">2번</label>
                <input type="radio" name = "check" id = "num19-3">
                <label for="num19-3">3번</label>
                <input type="radio" name = "check" id = "num19-4">
                <label for="num19-4">4번</label>
            </div>
        </div>
        <div class = "test twenty">
            <p>시험문제~~~~~~~~~~~~~~~~~~~~~~~</p>
            <div class = "check_container">
                <input type="radio" name = "check" id = "num20-1">
                <label for="num20-1">1번</label>
                <input type="radio" name = "check" id = "num20-2">
                <label for="num20-2">2번</label>
                <input type="radio" name = "check" id = "num20-3">
                <label for="num20-3">3번</label>
                <input type="radio" name = "check" id = "num20-4">
                <label for="num20-4">4번</label>
            </div>
        </div>
        <form name = "form" action="s_exam.jsp">
            <input type="button" value="제출하기" name = "submit" onclick = "func()">
        </form>
    </div>
</body>
</html>