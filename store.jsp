<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/user";
    String dbUser = "root";
    String dbPassword = "Pnlgs@as2004";

    Connection connection = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
        out.println("Connected successfully!");
    } catch (Exception e) {
        e.printStackTrace();
    }

    String uname = request.getParameter("uname");
    String upassword = request.getParameter("upassword");

    try {
        String insertUserQuery = "INSERT INTO usertable (uname, upassword) VALUES (?, ?)";
        PreparedStatement insertUserStmt = connection.prepareStatement(insertUserQuery);
        insertUserStmt.setString(1, uname);
        insertUserStmt.setString(2, upassword);
        insertUserStmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<%
    response.sendRedirect("print.jsp");
%>
