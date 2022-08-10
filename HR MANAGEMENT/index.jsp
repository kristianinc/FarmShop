<%-- 
    Document   : hr
    Created on : Aug 1, 2022, 2:09:46 PM
    Author     : Asa99
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title >HR Department</title>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.1.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css"/>

    
    </head>
    <body>
        <jsp:include page="autoReallocation.jsp" />
           <h1>HR MANAGEMENT</h1> 
         <form action="buttonReallocation.jsp" method="post">
        <div >
            
            <input type="submit" value="Reallocate staff" class="btn btn-info" width="300"> 
        </div>
    </form>
        
        <div class="container ml-6 ">
            <div class=" row row-cols-2 m-1">
                   
              <div class="card col p-4">               
                   <jsp:include page="Calculate.jsp" />
              </div>
              
              <div class="card col p-4 ml-2 pl-5">
                  <h5>REGISTER STAFF</h5>

                  <jsp:include page="UserProcess.jsp" />
              </div>
            
            </div>
              <br>
            <div class="row row-cols-1">
              <div class="col"><jsp:include page="StaffTableCategory.jsp" /></div>
            </div>
        </div>
   <script type="text/javascript" src=" https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    </body>
</html>
