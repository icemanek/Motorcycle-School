<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 29.11.18
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>


    <title>Szkoła motocyklowa</title>


</head>
<body>

ZALOGOWALES SIE!

Welcome <c:forEach var="users" items="${user}">
    <tr>
    <td>${users.firstName}</td>
    </tr>
</c:forEach>


<br>
<a href="/">Strona Główna</a>
<br>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
