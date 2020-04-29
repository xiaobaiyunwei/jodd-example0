<%@page import="java.text.DateFormat"%>
<%@page language="java" import="java.util.*,java.text.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	/**method1: use Date and FormatDate to get current date、time.**/	
	Date date = new Date();
	DateFormat df1=DateFormat.getInstance();
	DateFormat df2=DateFormat.getTimeInstance();
	DateFormat df3=DateFormat.getDateInstance();
	DateFormat df4=DateFormat.getDateTimeInstance();
	String date1 = df1.format(date);
	String date2 = df2.format(date);
	String date3 = df3.format(date); 
	String date4 = df4.format(date);
	System.out.println("format_instance=="+date1);
	System.out.println("fmtime_instance=="+date2);
	System.out.println("fmdate_instance=="+date3);
	System.out.println("fmdatt_instance=="+date4);
	/**method2: use Calendar*/
	Calendar cal = Calendar.getInstance();
	System.out.println("cal==:"+cal.getTime());
	%>
</body>
</html>