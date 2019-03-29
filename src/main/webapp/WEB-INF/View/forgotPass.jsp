<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 19.03.19
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/resetPassword.css" rel="stylesheet">

</head>
<body>

<%@ include file="parts/header.jsp" %>
<center>

   <form:form  method="post" modelAttribute="user">


           <form:input path="email" type="email" placeholder="Email" required="true" />

       <br>

       <button type="submit" class="btn-liquid">Wyślij</button>

   </form:form>

</center>

</body>
</html>
