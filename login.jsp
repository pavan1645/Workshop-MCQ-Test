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
		String srno = request.getParameter("rno");
		String sphno = request.getParameter("phno");
		String sql = "SELECT * FROM student where roll_no='"+srno+"' and phno='"+sphno+"'";
		ResultSet rs = stmt.executeQuery(sql);
		 try
			{
			if(rs.isBeforeFirst())
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
				else out.println("not dess");      
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
		



	<form action="login2.jsp" method="POST">
		<b>Question 1: It is a very important question</b><br>
		<input type="radio" name="q10" value="1" checked> Answer 1<br>
		<input type="radio" name="q10" value="2"> Answer 2<br>
		<input type="radio" name="q10" value="3"> Answer 3<br>
		<input type="radio" name="q10" value="4"> Answer 4<br>
		<br>
		<b>Question 2: It is a very important question</b><br>
		<input type="radio" name="q11" value="1" checked> Answer 1<br>
		<input type="radio" name="q11" value="2"> Answer 2<br>
		<input type="radio" name="q11" value="3"> Answer 3<br>
		<input type="radio" name="q11" value="4"> Answer 4<br>
		<br>
		<b>Question 3: It is a very important question</b><br>
		<input type="radio" name="q12" value="1" checked> Answer 1<br>
		<input type="radio" name="q12" value="2"> Answer 2<br>
		<input type="radio" name="q12" value="3"> Answer 3<br>
		<input type="radio" name="q12" value="4"> Answer 4<br>
		<br>
		<b>Question 4: It is a very important question</b><br>
		<input type="radio" name="q13" value="1" checked> Answer 1<br>
		<input type="radio" name="q13" value="2"> Answer 2<br>
		<input type="radio" name="q13" value="3"> Answer 3<br>
		<input type="radio" name="q13" value="4"> Answer 4<br>
		<br>
		<b>Question 5: It is a very important question</b><br>
		<input type="radio" name="q14" value="1" checked> Answer 1<br>
		<input type="radio" name="q14" value="2"> Answer 2<br>
		<input type="radio" name="q14" value="3"> Answer 3<br>
		<input type="radio" name="q14" value="4"> Answer 4<br>
		<br>
		<b>Question 6: It is a very important question</b><br>
		<input type="radio" name="q15" value="1" checked> Answer 1<br>
		<input type="radio" name="q15" value="2"> Answer 2<br>
		<input type="radio" name="q15" value="3"> Answer 3<br>
		<input type="radio" name="q15" value="4"> Answer 4<br>
		<br>
		<b>Question 7: It is a very important question</b><br>
		<input type="radio" name="q16" value="1" checked> Answer 1<br>
		<input type="radio" name="q16" value="2"> Answer 2<br>
		<input type="radio" name="q16" value="3"> Answer 3<br>
		<input type="radio" name="q16" value="4"> Answer 4<br>
		<br>
		<b>Question 8: It is a very important question</b><br>
		<input type="radio" name="q17" value="1" checked> Answer 1<br>
		<input type="radio" name="q17" value="2"> Answer 2<br>
		<input type="radio" name="q17" value="3"> Answer 3<br>
		<input type="radio" name="q17" value="4"> Answer 4<br>
		<br>
		<b>Question 9: It is a very important question</b><br>
		<input type="radio" name="q18" value="1" checked> Answer 1<br>
		<input type="radio" name="q18" value="2"> Answer 2<br>
		<input type="radio" name="q18" value="3"> Answer 3<br>
		<input type="radio" name="q18" value="4"> Answer 4<br>
		<br>
		<b>Question 10: It is a very important question</b><br>
		<input type="radio" name="q19" value="1" checked> Answer 1<br>
		<input type="radio" name="q19" value="2"> Answer 2<br>
		<input type="radio" name="q19" value="3"> Answer 3<br>
		<input type="radio" name="q19" value="4"> Answer 4<br>
		<br>
		<input type="radio" name="roll_no" value="<%=srno%>" checked>
		<input type="submit" value="Submit">
	</form>		


</body>
</html>