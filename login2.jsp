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
	 try{
		int temp=0;		
		String sql = "";
		for(int i=10;i<20;i++){
			sql = "SELECT ca FROM mcq where mcq_id="+i;
			ResultSet rs = stmt.executeQuery(sql);
			String dca="";
			String sca=request.getParameter("q"+i);
			while(rs.next()){
				dca = rs.getString("ca");
			}
			if(dca.equals(sca)){
				temp++;
			}

		}
		String sql1 = "insert into uat values('"+request.getParameter("roll_no")+"',"+temp+")";
		stmt.execute(sql1);
		if(temp>2){
			out.println("You Passed!!!");
		}
		else{
			out.println("You Failed :(");
		}
	}
	catch(SQLException e){
		e.printStackTrace();
	}
		stmt.close();
		conn.close();
		stmt=null;
		
		conn=null;
%>
</body>
</html>