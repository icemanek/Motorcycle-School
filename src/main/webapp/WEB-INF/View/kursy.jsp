<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 26.11.18
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodawanie kursu</title>
    <title>Szkoła motocyklowa</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%@ include file="parts/header.jsp" %>
</head>
<body>
<div class="content">
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- Brand -->
    <a class="navbar-brand" href="#">Menu</a>

    <!-- Toggler/collapsibe Button -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!-- Navbar links -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/user/all">Lista użytkoniwków</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user/add">Dodawanie użytkownika</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/instructor/add">Dodawanie instruktora</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/instructor/all">Lista instruktorow</a>
            </li>
        </ul>
    </div>
</nav>
<h1 class="header">Dodaj kurs</h1>
<form:form method="post" modelAttribute="activities">

    <label for="titleId">Nazwa</label>

    <form:input type="text" path="title" id="titleId"/>
    <br>
    <br>
    <br>

    <input type="submit" value="Save">
</form:form>
<br>
<br>
<br>
<a href="/kursy/all">Lista kursów</a>
<br>
<br>
<br>

<a href="/">Strona Główna</a>
<br>
</div>
<%@ include file="parts/footer.jsp" %>
</body>
</html>
