<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement" %>    
<%@ page import="java.sql.ResultSet, javax.naming.*,javax.sql.*" %>    
jdbcPoolTest.jsp    
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/dbPool");
		String sql = "SELECT deptno, dname, loc FROM dept";
		con = ds.getConnection();
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){
			out.print(rs.getInt("deptno")+", "+rs.getString(2));
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>