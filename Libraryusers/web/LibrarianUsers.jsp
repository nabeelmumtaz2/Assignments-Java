    
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>     
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include  file="Connection.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:if test="${!empty users}">
            <jsp:useBean id="d" class="nabeel.Bean"  ></jsp:useBean> 

                <h1>  Hello--<c:out value="${users}--Librarian"></c:out>--</h1>
                <form action="LibrarianUsers.jsp" method="post">   
                    <button type="submit" name="logout" value="Logout">Logout</button>
                </form>
                <br>
                <form action="LibrarianUsers.jsp" method="post">
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
                <form action="LibrarianUsers.jsp" method="post">
                    <h1> Add a book </h1>
                    Title: <input type="text" name="title">
                    <br>

                    Author:<input type="text" name="author">
                    <br>


                    CallNumber:<input type="number" name="callnumber">
                    <br>

                    <input type="submit" value="Add Now">
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
                Select * From Librarybooks Where BookTitle like '%' || ? || '%'
                <sql:param value="${d.search}">

                </sql:param>
            </sql:query>
            <c:if test="${r.rowCount ==1}">
                <table border="1">
                    <tr>
                        <th>BookTitle</th>
                        <th>BookAuthor</th>
                        <th>CallNumber</th>
                        <th>CheckedOutBy</th>
                    </tr>
                    <br>



                    <c:forEach var="row" items="${r.rows}">
                        <tr>
                            <td>${row.Booktitle}</td>
                            <td>${row.bookauthor}</td>
                            <td>${row.callnumber}</td>
                            <td>${row.checkedoutby}</td>
                           <td><form action='LibrarianUsers.jsp' method='post'>
                                   <input type="text" name="checkedbyout" placeholder="UserName here">
                                   <button type='submit' name="U" value="${row.callnumber}">Update</button>
                                </form></td>
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
                Select * From Librarybooks Where Bookauthor like '%' || ? || '%'
                <sql:param value="${d.search}">

                </sql:param>
            </sql:query>
            <c:if test="${r.rowCount ==1}">
                <table border="1">
                    <tr>
                        <th>BookTitle</th>
                        <th>BookAuthor</th>
                        <th>CallNumber</th>
                        <th>CheckedOutBy</th>
                    </tr>
                    <br>

                    <c:forEach var="row" items="${r.rows}">
                        <tr>
                            <td>${row.Booktitle}</td>
                            <td>${row.bookauthor}</td>
                            <td>${row.callnumber}</td>
                            <td>${row.checkedoutby}</td>
                            <td><form action='LibrarianUsers.jsp' method='post'>
                                   <input type="text" name="checkedbyout" placeholder="UserName here">
                                   <button type='submit' value="${row.callnumber}">Update</button>
                                </form></td>
                        </tr> 
                    </c:forEach>
                </c:if>
                <c:if test="${r.rowCount <1}">
                    <c:out value="Result not found"></c:out>
                </c:if>
            </c:if>
        </table>
                <c:if test="${!empty d.title && !empty d.author && !empty d.callnumber}">
                    <sql:update var="r" dataSource="${s}" >
                        INSERT INTO Librarybooks (BookTitle,BookAuthor,CallNumber,Checkedoutby)
                        Values(?,?,?,'--')
                        <sql:param value="${d.title}"></sql:param>
                        <sql:param value="${d.author}"></sql:param>
                        <sql:param value="${d.callnumber}"></sql:param>
                    </sql:update>
                        <c:if test="${r >=1}">
                            <c:out value="Book added successfully"></c:out>
                        </c:if>
                </c:if>
             
                        <c:if test="${!empty d.checkedbyout && !empty d.u}">
                            <sql:update var="r"  dataSource="${s}">
                                Update Librarybooks set checkedoutby=? where callnumber=?
                            </sql:update>
                            <sql:param value="${d.checkedbyout}"></sql:param>
                            <sql:param value="${d.u}"></sql:param>
                            <c:if test="${r >=1}">
                            <c:out value="Update successfully"></c:out>
                        </c:if>
                </c:if>
                        
    </body>
</html>
