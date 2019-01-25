<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 29.11.18
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <title>Szkoła motocyklowa</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
            <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/kursy/all">Kursy</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/instructor/all">Nauczyciele</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/onas">O Nas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/drive">Jak dojechać</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contact">Kontakt</a>
                    </li>
                </ul>
            </div>

            <div class="login">
                <a class="login_btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block" style="padding-right: inherit">Zalogowany jako User</span></a></div>
            <div class="signin">
                <a href="/" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block">Wyloguj</span></a></div>

        </nav>

    </header>
</head>
<body>





<br>
<a href="/">Strona Główna</a>
<br>
<%@ include file="../View/footer.jsp" %>
</body>
</html>
