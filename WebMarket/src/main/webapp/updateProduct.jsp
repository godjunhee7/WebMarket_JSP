<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.market.Product" %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
	<title>웹 쇼핑몰 데모 - 상품 수정</title>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
	<script type="text/javascript" src="./js/validation.js"></script>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
			상품 수정
			</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String productId = request.getParameter("id");
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_id= ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if (rs.next()){
			pageContext.setAttribute("category", rs.getString("p_category"));
			pageContext.setAttribute("condition", rs.getString("p_condition"));
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./images/<%=rs.getString("p_filename") %>" style="width:100%">
			</div>
		</div>	 
	<form id="newProduct" name="newProduct" enctype="multipart/form-data"  action="./processUpdateProduct.jsp" class="form-horizontal" method="post">
		<div class="form-group row">
			<label class="col-sm-2">상품 코드</label>
			<div class="col-sm-3">
				<input type="text" id="productId" name="productId" 
				class="form-control" value="<%=rs.getString("p_id") %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상품명</label>
			<div class="col-sm-3">
				<input type="text" id="name" name="name" class="form-control"
				value="<%=rs.getString("p_name") %>">
			</div>
		</div><div class="form-group row">
			<label class="col-sm-2">가격</label>
			<div class="col-sm-3">
				<input type="text" id="unitPrice" name="unitPrice" class="form-control"
				value="<%=rs.getString("p_unitprice") %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상세 정보</label>
			<div class="col-sm-3">
				<textarea name="description" cols="50" rows="2" class="form-control">
				<%=rs.getString("p_description") %>
				</textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">제조사</label>
			<div class="col-sm-3">
				<input type="text" name="manufacturer" class="form-control"
				value="<%=rs.getString("p_manufacturer") %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">분류</label>
			<div class="col-sm-3">
				<select name="category">
					<option value="">선택하세요.</option>
					<option value="Phone" ${category == 'Phone' ? 'selected="selected"' : ''} >Phone</option>
					<option value="NoteBook"  ${category == 'NoteBook' ? 'selected="selected"' : ''} >NoteBook</option>
					<option value="Tablet"  ${category == 'Tablet' ? 'selected="selected"' : ''} >Tablet</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">재고</label>
			<div class="col-sm-3">
				<input type="text" id="unitsInStock" name="unitsInStock" class="form-control"
				value="<%=rs.getString("p_unitinstock") %>">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">상태</label>
			<div class="col-sm-5">
				<input type="radio" name="condition" value="새제품" id="new"
				${condition == '새제품' ? 'checked="checked"' :'' } >
				<label for="new">새 제품</label>
				<input type="radio" name="condition" value="중고품" id="old"
				${condition == '중고품' ? 'checked="checked"' :'' } >
				<label for="old">중고 제품</label>
				<input type="radio" name="condition" value="재생품" id="renew"
				${condition == '재생품' ? 'checked="checked"' :'' } >
				<label for="renew">재생 제품</label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2">이미지</label>
			<div class="col-sm-5">
				<input type="file" name="productImage" class="form-control">
			</div>
		</div>
		
		<div class="form-group row">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="button" class="btn btn-primary" value="등록"
					onclick="checkAddProduct()">
			</div>
		</div>
	</form>
	</div>
	<%
		}

		if (rs != null){
			rs.close();
		}
		if (pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	%>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>