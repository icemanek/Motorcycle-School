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
    <link href="../css/instruktor.css" rel="stylesheet">


</head>
<%@ include file="parts/header.jsp" %>
<body id="body" class="light-mode">
<center>
<div class="content">
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
</form:form>
    <br>
    <button class="button" type="submit" name="light-mode"><span>Zapisz</span></button>
    <button class="button" name="light-mode" onclick="window.location.href='/'"><span>Strona główna </span></button>
</div>
</center>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
