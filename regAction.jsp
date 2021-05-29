<%@ page import="java.sql.*"%>
<%

String name = request.getParameter("name");
String mobile = request.getParameter("mobile");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String userValue = request.getParameter("userValue");
String standard = request.getParameter("standard");
System.out.println("Standard: " + standard);

String epassword = request.getParameter("epassword");

System.out.println("password is " + epassword);

try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registration", "root", "harshu03");
	Statement st1 = con.createStatement();
	String strQuery = "SELECT COUNT(*) FROM reg";
	ResultSet rs = st1.executeQuery(strQuery);
	String student_id = "";
	while (rs.next()) {
		student_id = rs.getString(1);
		System.out.println("Total students :" + student_id);
	}
	PreparedStatement st = con.prepareStatement("insert into reg values(?, ?, ?, ?, ?, ?, ?, ?)");
	st.setString(1, name);
	st.setString(2, mobile);
	st.setString(3, email);
	st.setString(4, gender);
	st.setString(5,userValue);
	st.setString(6, standard);
	st.setString(7, epassword);
	st.setInt(8, Integer.parseInt(student_id) + 1);
	st.executeUpdate();

	String[] courses = request.getParameterValues("courses");
	for (int i = 0; i < courses.length; i++) {

		String myCourses = request.getParameter(courses[i]);
		//System.out.println(courses[i]);
		//System.out.println("hello " + myCourses);
		if (myCourses == null) {
	//System.out.println(courses[i] + "=checked");

	PreparedStatement st2 = con.prepareStatement("insert into courses values(?,?)");
	st2.setInt(1, Integer.parseInt(student_id) + 1);
	st2.setString(2, courses[i]);
	st2.executeUpdate();
		}
	}
	response.sendRedirect("save.html");
} catch (Exception e) {
	response.sendRedirect("error.html");
}
%>