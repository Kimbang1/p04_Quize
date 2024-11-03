<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>숫자 입력화면</title>
	<link rel="stylesheet" href="style/style.css?v">
</head>
<body>



	<div id="wrap">
		<p>숫자 입력(3~9사이 값 입력)</p>
		<div id="inputArea">
		<form action="" method="post">
		<input type="text" name = "num1">
		<button type="submit">결과보기</button>
		</form>
		</div>
		
		<div id="printArea">
		<span>[출력영역]</span><br>
		<span><%
		 // POST 요청일 때만 처리
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String input = request.getParameter("num1");
            try {
                int num = Integer.parseInt(input);

                // 숫자 유효성 검사
                if (num >= 3 && num <= 9) {
                    for (int row = 1; row <= 10; row++) {
                        for (int col = 1; col <= 10; col++) {
                            // 1부터 num까지 반복하여 출력
                            out.print(((col - 1) % num + 1) + "\t");
                        }
                        out.print("<br>");
                    }
                } else {
                    out.print("입력 오류! 3에서 9 사이의 값을 입력해주세요.");
                    out.print("<button onclick=\"window.location.href='';\">재실행</button>");
                }
            } catch (NumberFormatException e) {
                out.print("잘못된 입력입니다. 숫자를 입력해주세요.");
                out.print("<button onclick=\"window.location.href='';\">재실행</button>");
            }
        }
%>
</span>
		</div>
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.7.1.min.js"></script>
	<script src="/script/script.js"></script>
</body>
</html>    