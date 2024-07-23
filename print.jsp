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
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    }
%>

<%
    try {
        String query = "SELECT * FROM usertable";
        PreparedStatement statement = connection.prepareStatement(query);
        ResultSet resultSet = statement.executeQuery();

        while (resultSet.next()) {
            String uname = resultSet.getString("uname");
            String upassword = resultSet.getString("upassword");
            out.println("Username: " + uname + "<br>");
            out.println("Password: " + upassword + "<br>");
        }

        // Close resources
        resultSet.close();
        statement.close();
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
