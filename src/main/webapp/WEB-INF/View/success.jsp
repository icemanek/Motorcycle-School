<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 13.03.19
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/verified.css" rel="stylesheet">

    <title>Rejestracja</title>
</head>
<body>
<div class="content">
<%@ include file="parts/header.jsp" %>
<center>
    <c:if test="${not empty confirmationMessage}">

    <span>${confirmationMessage}</span>


</c:if>
</center>

</div>
</body>
<footer><%@ include file="parts/footer.jsp" %></footer>
</html>
