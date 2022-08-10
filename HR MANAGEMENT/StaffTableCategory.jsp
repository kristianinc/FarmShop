<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% 
    ResultSet resultset;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
     <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"/>

    <script type="text/javascript" src=" https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    
    </head>
    <body>
        <table id="a1" class="table" style="width:100%">
            <thead class="table-dark">
  <tr>
    <th>First Name</th>
    <th>Last Name</th>
    <th>Phone Number</th>
    <th>Category ID</th>
  </tr>
            </thead>
<%
try{
    String category_Id = request.getParameter("Cat");
    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
    Statement st1=con1.createStatement();
    if(category_Id==null){
         resultset=st1.executeQuery("SELECT * FROM staff");
    }else{
       resultset=st1.executeQuery("SELECT * FROM staff WHERE category_id ="+category_Id+" ");
    }
    while(resultset.next()){
    
        %>
  <tr>     
    <td><%=resultset.getString("firstname") %></td>
    <td><%=resultset.getString("lastname") %></td>
    <td><%=resultset.getString("tel") %></td>
    <td><%=resultset.getString("category_id") %></td> 
  </tr>
        <%
    }
}

catch(Exception error){
    out.println(error);
}
 %>
 </table>
  <script>
     $(document).ready( function () {
    $('#a1').DataTable();
} );
 </script>
    </body>
</html>



