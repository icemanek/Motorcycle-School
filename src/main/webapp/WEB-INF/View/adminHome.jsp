<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 25.11.18
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szkoła motocyklowa</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <%@ include file="parts/header.jsp" %>

</head>
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
            <li class="nav-item">
                <a class="nav-link" href="/kursy/add">Dodaj kurs</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/kursy/all">Lista kursow</a>
            </li>
        </ul>
    </div>
</nav>

<%@ include file="parts/footer.jsp" %>
</body>
</html>