<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
Integer pdt_id = Integer.parseInt(request.getParameter("product_id"));

try{

    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    
    Statement st2=con1.createStatement();
    
    String sql ="select * from products WHERE product_id = '"+pdt_id+"'";
    ResultSet resultSet = st2.executeQuery(sql);
    while (resultSet.next()) {
        Statement st1=con1.createStatement();
        Integer updateedlikes = resultSet.getInt(4)+1;
        String UpdateQuery = "update products SET likes='"+updateedlikes+"' WHERE product_id ="+pdt_id+"  ;";
        st1.executeUpdate(UpdateQuery);
        response.sendRedirect("index.jsp");
    }
    
    }


    
    

   
   

catch(Exception error){
    out.println(error);}
 %>