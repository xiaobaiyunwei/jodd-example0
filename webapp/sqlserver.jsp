<%@ page language="java"
	import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*"%>
<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	/** JDBC connect to sqlserver  **/
	try     
	{     
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
		String url="jdbc:sqlserver://192.168.181.**:1433; DatabaseName=aaa";
		String user="sa";
		String password="**";
		Connection   conn=   DriverManager.getConnection(url,user,password);
		conn.setAutoCommit(false);
		long start_time = System.currentTimeMillis();						
		/**		
		55.54 seconds produce 1000,000 records by useing PreparedStatement class when bachnum is 1000;
		46.49 seconds produce 1000,000 records by useing PreparedStatement class when bachnum is 10000;
		45.78 seconds produce 1000,000 records by useing PreparedStatement class when bachnum is 50000;
		45.78 seconds produce 1000,000 records by useing PreparedStatement class when bachnum is 100000;
		**/
		int	stmt_type=1;
		if (stmt_type==1)
		{ 
				String pbase_sql="insert into IVR_MENU_INFO (IVR_MENU_ID,CALLER_NUMBER,CALLED_NUMBER,SSP_ID,IVR_MENU_TYPE_CODE,CHANGE_CHOICE)" 
				+"values (?,?,?,?,?,?)";
				PreparedStatement  prepared_stmt=conn.prepareStatement(pbase_sql);
				String str_[]={",'good'",",'great'",",'wonderful'",",'awesome'",",'fantastic'",",'beautiful'",",'perfect'",",'terrific'"};
				for(int i=1;i<=1000000;i++){
					int index =(int)(Math.random()*str_.length);		
					prepared_stmt.setInt(1, i);
					prepared_stmt.setString(2, "10");
					prepared_stmt.setString(3, "8");
					prepared_stmt.setInt(4, i);
					prepared_stmt.setString(5, str_[index]);
					prepared_stmt.setString(6, "1");	
					prepared_stmt.addBatch();
					if(i%1000==0){
						prepared_stmt.executeBatch();
						conn.commit();
						System.out.println("正在执行第"+i+"条记录！");
						out.println("正在执行第"+i+"条记录！<br>");
					}
				}		
				prepared_stmt.close();
		}else if(stmt_type==2){							
				Statement   stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
				String base_sql="insert into IVR_MENU_INFO (IVR_MENU_ID,CALLER_NUMBER,CALLED_NUMBER,SSP_ID,IVR_MENU_TYPE_CODE,CHANGE_CHOICE) values (";
				String str[]={",'good'",",'great'",",'wonderful'",",'awesome'",",'fantastic'",",'beautiful'",",'perfect'",",'terrific'"};
				for(int i=1;i<=5000000;i++){
					String insert_sql="";
					int index =(int)(Math.random()*str.length);
					insert_sql=base_sql+i+",'10'"+",'8',"+i+str[index]+",'1')";			
					stmt.addBatch(insert_sql);
					if(i%1000==0){
						stmt.executeBatch();
						conn.commit();
						System.out.println("正在执行第"+i+"条记录！");
						out.println("正在执行第"+i+"条记录！<br>");
					}
				}		
				stmt.close();
		}	
		
		
		System.out.println("开始时间："+start_time);
		System.out.println("结束时间："+System.currentTimeMillis());		
		conn.close();
	}     
	catch(Exception e)
	{
		out.println(e);
	}

	%>
</body>
</html>