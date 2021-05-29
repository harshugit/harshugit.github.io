<%@ page import="java.sql.*"%>
<%

String userValue = request.getParameter("userValue");
String email = request.getParameter("email");
String epassword = request.getParameter("epassword");

System.out.println("userValue is " + userValue);

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "harshu03");
	
	Statement st= con.createStatement();
ResultSet rs=st.executeQuery("select * from reg where userValue='"+userValue+"' AND email='"+email+"' AND epassword='"+epassword+"'");

try{
//rs.next();
if(rs == null)
	System.out.println("rs is null");
while(rs.next())
{
	System.out.println("fdgdg " +rs.getString("userValue"));
	if(rs.getString("userValue").equals("teacher")&&rs.getString("epassword").equals(epassword)&&rs.getString("email").equals(email))
	{
		response.sendRedirect("tlogin.html");
	}
	else{
		response.sendRedirect("slogin.html");
	}
}
}
catch (Exception e) {
	e.printStackTrace();
}
%>