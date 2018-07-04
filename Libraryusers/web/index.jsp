<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@include  file="Connection.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="index.jsp" method="post">
            UserName:<input type="text" name="username">
            <br>
            Password:<input type="password" name="password">
            <br>
          
            <input type="submit" value="Login">
        </form>
      
        <jsp:useBean id="d" class="nabeel.Bean"  ></jsp:useBean> 
        <jsp:setProperty name="d" property="*"></jsp:setProperty>
       
        <c:if test="${ !empty d.username && !empty d.password}">
            <sql:query dataSource="${s}" var="r">   
                Select * From Libraryusers 
          </sql:query>
          <c:set var="users"  scope="session" value="${d.username}"></c:set>
            <c:forEach var="row" items="${r.rows}">
                <c:if test="${d.username ==row.username && d.password ==row.password && row.librarian==true}">
                    <c:redirect url="LibrarianUsers.jsp"></c:redirect>
                </c:if>
              <c:if test="${d.username ==row.username && d.password ==row.password && row.librarian==false}">
                    <c:redirect url="OrdinaryUsers.jsp"></c:redirect>
                </c:if>
            </c:forEach>
        </c:if>
 
        

    </body>
</html>
