<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 20.03.19
  Time: 19:28
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


    <c:if test="${not empty succ}">

        <span>${succ}</span>

    </c:if>



</center>
</body>

</html>
