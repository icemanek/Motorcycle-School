<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 13.03.19
  Time: 17:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/verified.css" rel="stylesheet">
</head>
<body>
<%@ include file="parts/header.jsp" %>
<center>

    <c:if test="${not empty error}">

        <span>${error}</span>


    </c:if>


</center>
</body>

<footer><%@ include file="parts/footer.jsp" %></footer>
</html>
