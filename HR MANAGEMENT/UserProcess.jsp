<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% 
    Class.forName("com.mysql.jdbc.Driver");// Driver to establish connection to the database
    Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root",""); //Create connection using your ID and Password
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="DataTables/datatables.min.css"/>
        <script type="text/javascript" src="DataTables/datatables.min.js"></script>
    </head>
    <body>
        <form action="index.jsp" method="post" width="310">
              
             <div class="row">
                 
  <div class="row mb-3 mt-5">
      <input type="text" class="form-control" name="firstname" required="true" placeholder="First name" aria-label="First name"  >
  </div>
  <div class="row mb-3">
    <input type="text" class="form-control" name="lastname" required="true" placeholder="Last name" aria-label="Last name">
  </div>
   <div class="row mb-3">
    <input type="text" class="form-control" name="phoneNumber" required="true" placeholder="Phone number" aria-label="Last name">
  </div>


            <select name="Cat" class="form-select form-select-lg mb-3" size="1" aria-label=".form-select-lg example" width="200" >
<%



try{
    Statement st1=con1.createStatement();
    ResultSet resultset=st1.executeQuery("SELECT * FROM categories");
   while(resultset.next()){
 
        %>  
        <option value=<%=resultset.getString("category_id")%> ><%=resultset.getString("name") %></option>
        <%
    }
    }        
   
catch(Exception error){
    out.println(error);
}
 %>
 </select>       
  <div class="row">
    <input type="submit" value="Add Staff" class="btn btn-info"> 
  </div>
 </div>
 </form> 
 <%
String firstname=request.getParameter("firstname");
String lastname = request.getParameter("lastname");
String tel = request.getParameter("phoneNumber");
String category_Id = request.getParameter("Cat");

try{
    Statement st2=con1.createStatement();
   // while(rs1.next()){

    //-----------------------------Then, Create an InsertQuery using a String:---------------------

    String InsertQuery = "insert into staff (firstname,lastname, tel, category_id) values('"+firstname+"','"+lastname+"', '"+tel+"','"+category_Id+"')";
//     session.setAttribute("registered","New staff registered successfully");
    
    //----------------------------Finally, Execute your Insert Query:-----------------------------

    st2.executeUpdate(InsertQuery);
    
   //  }
     
  }
     
catch(Exception error){
    //out.println(error);
     }
 %>
    </body>
</html>
