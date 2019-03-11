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


    <title>Rejestracja pomyślna</title>


</head>
<body>
<div class="content">

    <span>Email poszedł na adres ${pageContext.request.userPrincipal.email}</span>


<br>
<a href="/">Strona Główna</a>
<br>
</div>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
