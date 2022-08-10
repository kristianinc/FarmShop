<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <a href="EditProductDetails.jsp">Edit products</a>
        <a href="Tracking Sales.jsp">Track sales</a>
        <jsp:include page="ProductsDetails.jsp"/>
        <jsp:include page="AddCategory.jsp"/>
        <jsp:include page="AddProduct.jsp"/>
        <jsp:include page="LikeProduct.jsp">
            <jsp:param name="product_id" value="8" />
        </jsp:include>
       
        <form method="post" action="TrackingSalesPerCategory.jsp">
            <input type="text" name="order_id"/>
            <input type="submit" value="submit"/>
        </form>
    </body>
</html>
