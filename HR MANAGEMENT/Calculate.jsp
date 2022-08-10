<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"/>

    <script type="text/javascript" src=" https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    </head>
        <table id="a2" class="table" style="width:100%">
  <thead class="table-dark">
      <tr> 
    <th>Category</th>
    <th>Long term products </th>
    <th>Long term staff</th>
    <th>Medium term staff</th>
     <th>Short term staff</th>
      </tr>
  </thead>
  
<%
try{

    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    Statement st1=con1.createStatement();
    ResultSet resultset=st1.executeQuery("SELECT * FROM categories");
    while(resultset.next()){
    Integer expected = resultset.getInt(3);
    Integer  long_term_staff = (expected * 4)/ 7;
    Integer medium_term_staff = (long_term_staff/2);
    Integer short_term_staff = (long_term_staff/4);
        %>

   
  <tr>
      
    <td><%=resultset.getString("name") %></td>
    <td><%=resultset.getString("longterm") %></td>
    <td><%= long_term_staff %></td>
    <td><%= medium_term_staff %></td>
    <td><%= short_term_staff %></td>
    
  </tr>
   
        <%
    }
}


catch(Exception error){
    out.println(error);}
 %>
 
 </table>
   <script>
     $(document).ready( function () {
    $('#a2').DataTable();
} );
 </script>
    </body>
</html>




  