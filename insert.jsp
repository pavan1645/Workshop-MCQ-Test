<html>
<head>
<title>SELECT Operation</title>
</head>
<body>
 
	<%@ page import = "java.sql.*" %>
	<%
    Class.forName("oracle.jdbc.driver.OracleDriver");

		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe","system","tiger");
		Statement stmt = conn.createStatement();
		String sname = request.getParameter("name");
		String srno = request.getParameter("rno");
		String syear = request.getParameter("year");
		String sphno = request.getParameter("phno");
		String semail = request.getParameter("email");
		String sgender = request.getParameter("gender");
		String sql = "insert into student values('"+srno+"','"+syear+"','"+sname+"','"+sphno+"','"+sgender+"','"+semail+"','1')";
		try{
			stmt.executeQuery(sql);
			out.println("You Registered Successfully for the Workshop");
		}catch(SQLException e){
			out.println("des2"+e);
			e.printStackTrace();
		}
		stmt.close();
		conn.close();
			
	%>
</form>
</body>
</html>