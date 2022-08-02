<%-- 
    Document   : shop
    Created on : Aug 2, 2022, 10:07:17 AM
    Author     : Kristian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>shop</title>
    </head>
    <body>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light" style="background-color: #e3f2fd;">
        <a class="nav-logo" href="#"><img src="image/Farmshop_logo.webp" height="1%" width="15%" alt="FARMSHOP"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="#">Home </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Features</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Pricing</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Disabled</a>
            </li>
          </ul>
        </div>
      </nav>
        
        <div class="container">
        <h1>hello username! welcome to the farm shop!</h1><br>
        <h4> choose the category of the goods you want to buy</h4>
        
        <form method="post" action="shop.jsp">
       category:<select name="category">
           <option value="">All categories</option>
           <option value="2">Animal feeds</option>
           <option value="1">meat and butchery</option>
           <option value="3">dairy and milk products</option>
           <option value="4">Organic manure and biogas</option>
            </select>
       <input type="submit" value="select" class="btn btn-success">
        </form>
        <br><br>
         <%@page import="java.sql.*"%>   
        
        <%   
   try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/farmshop","root","");
        Statement st = con.createStatement();
        //ResultSet rs = st.executeQuery("select * from user where username='"+username+"' and password = '"+pwd+"'");
        
         String category = null;
         category = request.getParameter("category");
        // picking products from the database.
        ResultSet result;
        
        if(category==""){
           category=null; 
            }
        if(category==null){
          result = st.executeQuery("select * from products");
            }
            else{
          result = st.executeQuery("select * from products where category_id ='"+category+"'");
            }
            
        out.println("<div class='row'>");
        while(result.next()){
        
          %>
        
  <div class="col-sm-6">
    <div class="card" style="width: 18rem;">
    <img src ="<%out.println( result.getString("imageurl"));%>" alt="<%out.println( result.getString("name"));%>" class="card-img-top" >
  <div class="card-body">
    <h5 class="card-title"><%out.println( result.getString("name"));%></h5>
    <p class="card-text"><%out.println( result.getInt("price")+ " Ushs");%></p>
    <p class="card-text"><%out.println( result.getInt("likes")+ " reviews");%></p>
    <a href="shopping cart.jsp" class="btn btn-success">order</a>
  </div>
</div>
  </div>
       
          <%
              
               }
             out.println("</div>");

            } catch(Exception e){
            
              out.println(e);
            }
 
        %>
               
        </div>
        
     <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
