
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource  var="s" driver="org.apache.derby.jdbc.ClientDriver" 
                          url="jdbc:derby://localhost:1527/LibraryUsers" 
                          user="nabeel" password="nabeel"/>  

    </body>
</html>
