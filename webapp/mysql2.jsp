<%@ page language="java"
	import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*,jodd.example.test.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	/** JDBC connect to Mysql **/
	try     
	{     
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		String url="jdbc:mysql://192.168.190.**:3306/word?rewriteBatchedStatements=true";
		String user="bbs";
		String password="123456";
		Connection   conn=   DriverManager.getConnection(url,user,password);
		conn.setAutoCommit(false);

		int	stmt_type=1;
		long start_time = System.currentTimeMillis();			
		LogManager lmng = new LogManager("D:\\data2\\", true);  
		//4=jianshe,231756+518230
		if (stmt_type==1)
		{ //total:518230,332258
			String pbase_sql="select postid,content from posts_js02 where  siteid=4 and deltag=0 "
					+ "order by postid limit ?,?";						
				PreparedStatement  prepared_stmt=conn.prepareStatement(pbase_sql);				
				int batch=1000;
				for(int i=0;i<=520;i++){
					
					prepared_stmt.setInt(1, i*batch);
					prepared_stmt.setInt(2, batch);				
					ResultSet rs=prepared_stmt.executeQuery();
					while(rs.next())
					{
						String content=rs.getString("content");
						String encontent = java.net.URLEncoder.encode(content, "utf-8");						
						//String sr=HttpRequest.sendPost("http://filter.***.com/retstr", "content="+encontent);						
						//if(!sr.trim().equals("0")){		
							lmng.log(rs.getInt("postid")+"	http://bbs.***.com/backend/check_posts_filter.php?postid="+rs.getInt("postid"), true);
						//}
					}									
					conn.commit();
					System.out.println("建设网共52万正在执行第"+(i+1)*batch+"条记录！");
					
				}		
			
				prepared_stmt.close();
		}else if(stmt_type==2){
				
		}		
		System.out.println("开始时间："+start_time);
		System.out.println("结束时间："+System.currentTimeMillis());		
		conn.close();
	}     
	catch(Exception e)
	{
		//e.printStackTrace();
		System.out.println("e.getMessage()==:"+e.getMessage());
		out.println(e.getMessage());
	}
	out.println("**网第二批52万数据执行完毕！");
	%>
</body>
</html>