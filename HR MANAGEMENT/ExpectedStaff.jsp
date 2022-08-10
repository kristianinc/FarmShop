<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
  <form action="hr.jsp" method="post">
      
      <label for="cars">Choose category of product to register the staff under</label><br>
        
 <%

try{

    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    Statement st1=con1.createStatement();
    ResultSet resultset=st1.executeQuery("SELECT * FROM categories");
    while(resultset.next()){
 
        %>   
        
        <input type="radio"  name="categoryID" required="true" checked value=<%=resultset.getString("category_id")%> > 
        <label for="html"><%=resultset.getString("name") %></label> <br> 
        <%
    }
}


catch(Exception error){
    out.println(error);}
 %>
   <input type="submit" value="Submit">
 </form>

