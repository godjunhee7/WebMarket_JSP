<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
	<title>웹 쇼핑몰 데모</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
			웹 쇼핑몰에 오신 것을 환영합니다.
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="container">
			<div class="text-center">
				<h3>
				WelCome to Web Market!
				</h3>
				<%
				  response.setIntHeader("Refresh", 1);

					Date day = new Date();
					String timeStr = ""; 
					int hour = day.getHours();
					int minute = day.getMinutes();
					int second = day.getSeconds();
					if (hour / 12 == 0){
						timeStr = "AM";
					} else {
						timeStr = "PM";
						hour = hour - 12;
					}
					timeStr = hour + ":" + minute + ":" + second + " " + timeStr;
					out.println("현재 시각: " + timeStr);
				%>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>