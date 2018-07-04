
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Connection.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
     
        <c:if test="${!empty users}">
            <jsp:useBean id="d" class="nabeel.Bean"  ></jsp:useBean> 

                <h1>  Hello--<c:out value="${users}--OrdinarayUsers"></c:out>--</h1>
                <form action="OrdinaryUsers.jsp" method="post">   
                    <button type="submit" name="logout" value="Logout">Logout</button>
                </form>
                <br>
                <form action="OrdinaryUsers.jsp" method="post">
                    <h1> Search a Book </h1>
                    <input type="text" name="search">
                    <br>

                    Title:<input type="radio" value="title" name="titleorauthor">
                    <br>

                    Author:<input type="radio" value="author" name="titleorauthor">
                    <br>

                    <input type="submit" value="Search">
                    <br>
                </form>
                <br>
                <hr>
              
            <jsp:setProperty name="d" property="*"></jsp:setProperty>
        </c:if>
        <c:if test="${!empty param.logout && param.logout eq 'Logout'}">

            <c:remove var="users"></c:remove>
            <c:redirect url="index.jsp"></c:redirect>
        </c:if>

        <c:if test="${empty users}">

            <c:out value="Please Login"></c:out>
            <jsp:scriptlet>response.setHeader("Refresh", "1; URL=index.jsp");</jsp:scriptlet> 
        </c:if>  
        <c:if test="${!empty d.search && !empty d.titleorauthor && d.titleorauthor eq 'title'}">
            <sql:query   var="r" dataSource="${s}" >
                Select * From Librarybook Where BookTitle like '%' || ? || '%'
                <sql:param value="${d.search}">

                </sql:param>
            </sql:query>
            <c:if test="${r.rowCount ==1}">
                <table border="1">
                    <tr>
                        <th>BookTitle</th>
                        <th>BookAuthor</th>
                        <th>CallNumber</th>
                        <th>Status</th>
                    </tr>
                    <br>



                    <c:forEach var="row" items="${r.rows}">
                        <tr>
                            <td>${row.Booktitle}</td>
                            <td>${row.bookauthor}</td>
                            <td>${row.callnumber}</td>
                            <c:if test="${!empty row.checkedoutby && row.checkedoutby != '--'}"> 
                                <td>Checked-Out</td>  
                                </c:if>
                                <c:if test="${empty row.checkedoutby}"> 
                                <td>Not-Checked-Out</td>  
                                </c:if>
                                <c:if test="${!empty row.checkedoutby}"> 
                                <td>Not-Checked-Out</td>  
                                </c:if>
                           
                        </tr> 
                    </c:forEach>
                </c:if>
            </c:if>
            <c:if test="${r.rowCount <1}">
                <c:out value="Result not found"></c:out>
            </c:if>
        </table>
        <c:if test="${!empty d.search && !empty d.titleorauthor && d.titleorauthor eq 'author'}">
            <sql:query   var="r" dataSource="${s}" >
                Select * From Librarybook Where Bookauthor like '%' || ? || '%'
                <sql:param value="${d.search}">

                </sql:param>
            </sql:query>
            <c:if test="${r.rowCount ==1}">
                <table border="1">
                    <tr>
                        <th>BookTitle</th>
                        <th>BookAuthor</th>
                        <th>CallNumber</th>
                         <th>Status</th>
                    </tr>
                    <br>



                    <c:forEach var="row" items="${r.rows}">
                        <tr>
                            <td>${row.Booktitle}</td>
                            <td>${row.bookauthor}</td>
                            <td>${row.callnumber}</td>
                            <c:if test="${!empty row.checkedoutby && row.checkedoutby != '--'}"> 
                                <td>Checked-Out</td>  
                                </c:if>
                                <c:if test="${empty row.checkedoutby}"> 
                                <td>Not-Checked-Out</td>  
                                </c:if>
                                <c:if test="${!empty row.checkedoutby}"> 
                                <td>Not-Checked-Out</td>  
                                </c:if>
                            
                        </tr> 
                    </c:forEach>
                </c:if>
                </c:if>
                <c:if test="${r.rowCount <1}">
                    <c:out value="Result not found"></c:out>
                </c:if>
               
        </table>
    </body>
</html>
