<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%-- <%@ page import="com.market.ProductRepository" %> --%>
<%@ page import="com.market.Product" %>

<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>


<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<%
	request.setCharacterEncoding("utf-8");


	String filename = "";
	String realFolder = "C:\\Market";
	int maxSize = 10 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = 
			new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		

	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer= multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");

	Integer price;
	if (unitPrice.isEmpty()){
		price = 0;
	} else {
		price = Integer.valueOf(unitPrice);
	}
	
	long stock;
	
	if(unitsInStock.isEmpty()){
		stock = 0;
	}else {
		stock = Long.valueOf(unitsInStock);
	}
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);

	PreparedStatement pstmt = null;
	String sql = "select * from product where p_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	ResultSet rs = pstmt.executeQuery();
	if(fileName != null){
		sql = "update product SET p_name=?, p_unitprice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitinstock=?,"+
				"p_condition=? p_filename=? where p_id=?";
	}else {
		sql = "update product SET p_name=?, p_unitprice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitinstock=?,"+
				"p_condition=? where p_id=?";
	}
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setInt(2, price);
	pstmt.setString(3, description);
	pstmt.setString(4, manufacturer);
	pstmt.setString(5, category);
	pstmt.setLong(6, stock);
	pstmt.setString(7, condition);
	if(fileName !=null){
		pstmt.setString(8, fileName);
		pstmt.setString(9, productId);
	} else {
		pstmt.setString(8, productId);
	}
	
	pstmt.executeUpdate();
	
	if (pstmt != null) pstmt.close();
	if (conn != null) conn.close();
	
	response.sendRedirect("editProducts.jsp");
	
%>