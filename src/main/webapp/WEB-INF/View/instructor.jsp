<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 26.11.18
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj Instruktora</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%@ include file="parts/header.jsp" %>
</head>
<body>

<h1 class="header">Dodaj instruktora</h1>
<form:form method="post" modelAttribute="instructor">

    <label for="firstNameId">Imię</label>

    <form:input type="text" path="firstNameInstructor" id="firstNameId"/>
    <form:errors path="firstNameInstructor" element="div"/>
    <br/>

    <label for="lastNameId">Nazwisko</label>

    <form:input type="text" path="lastNameInstructor" id="lastNameId"/>
    <form:errors path="lastNameInstructor" element="div"/>
    <br>
    <br>

    <label for="emailId">E-Mail</label>

    <form:input type="text" path="emailInstructor" id="emailId"/>
    <form:errors path="emailInstructor" element="div"/>
    <br>
    <br>
    <br>

    <input type="submit" value="Save">
</form:form>
<br>
<br>
<br>
<a href="/">Strona Główna</a>
<br>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
