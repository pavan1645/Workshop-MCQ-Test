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
		String sql = "SELECT * FROM student";
		ResultSet rs = stmt.executeQuery(sql);
		 try
			{
			if(rs!=null)
			{
	%>
			<table border=1 cellpadding=5>
				<tr>
					<td>Name</td>
					<td>Roll Number</td>
					<td>Gender</td>
					<td>Email ID</td>
					<td>Year</td>
					<td>Phone Number</td>
				</tr>
			<%
			while(rs.next())
			{
			%>
				<tr>
				<td><%=rs.getString("name")%></td>
				<td><%=rs.getString("roll_no")%></td>
				<td><%=rs.getString("gender")%></td>
				<td><%=rs.getString("emailid")%></td>
				<td><%=rs.getString("year")%></td>
				<td><%=rs.getString("phno")%></td>
				</tr>
			<%
			}
			}        
			}
			catch(SQLException e)
			{
				e.printStackTrace();
			}
			stmt.close();
			rs.close();
			conn.close();
			stmt=null;
			rs=null;
			conn=null;
			%>
			</table>
		

</body>
</html>