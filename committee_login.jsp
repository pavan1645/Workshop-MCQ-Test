<html>
<head>
<title>SELECT Operation</title>
</head>
<body>
 
	<%@ page import = "java.sql.*" %>
	<%@ page import="java.util.*" %>
	<%
    Class.forName("oracle.jdbc.driver.OracleDriver");

		String srole = request.getParameter("role");
		String spwd = request.getParameter("pwd");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521/xe",srole,spwd);
		Statement stmt = conn.createStatement();
		String sql = request.getParameter("query");
		ResultSet rs = stmt.executeQuery(sql);
		ResultSetMetaData rsmd = rs.getMetaData();
		int count = rsmd.getColumnCount();
		ArrayList al;
			 try
			{
			if(rs.isBeforeFirst())
			{
	%>
			<table border=1 cellpadding=5>
				<tr>
				<%
				al = new ArrayList();
				for(int i=0;i<count;i++){
				%>
					<td><% al.add(rsmd.getColumnName(i+1)); out.print(al.get(i)); %></td>
				<%
				}
				%>
				</tr>
			<%
				while(rs.next()){
			%>
				<tr>
					<%
					for(int i=0;i<count;i++){
					%>
						<td><% String temp=al.get(i).toString(); out.println(rs.getString(temp));%></td>
					<%
					}
					%>
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
</body>
</html>