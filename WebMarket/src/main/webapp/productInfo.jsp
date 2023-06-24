<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.market.Product" %>
<%@ page import="com.market.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
	<title>웹 쇼핑몰 데모 - 상품 상세 정보</title>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<script>
	function addToCart(){
		if (confirm("상품을 장바구니에 추가하겠습니까?")){
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
			상품 상세 정보
			</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product prod = dao.getProductById(id);

	%>
	<div class="container">
		<div class="row">
			<div class=col-md-5">
				<img src="./images/<%=prod.getFilename() %>" style="width:100%">
			</div>
			<div class="col-md-6">
				<h3><%=prod.getPname() %></h3>
				<p><%=prod.getDescription() %></p>
				<p>
					<b>상품 코드: </b>
					<span class="badge badge-danger">
						<%=prod.getProductId() %>				
					</span>
				</p>
				<p> <b>제조사: </b><%=prod.getManufacturer() %></p>
				<p> <b>분류: </b><%=prod.getCategory() %></p>
				<p> <b>재고: </b><%=prod.getUnitsInStock() %></p>
				<h4><%=prod.getUnitPrice() %>원</h4>
				<form action="./processAddCart.jsp?id=<%=prod.getProductId()%>" name="addForm" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문(장바구니추가)&raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
				</form>
			</div>			
		</div>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>