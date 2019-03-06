<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 28.11.18
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szkoła motocyklowa</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <script>

        function toggleDarkLight() {
            var body = document.getElementById("body");
            var currentClass = body.className;
            body.className = currentClass == "dark-mode" ? "light-mode" : "dark-mode";
        }

    </script>
</head>

<body id="body" class="light-mode">
<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <button type="button" name="dark_light" onclick="toggleDarkLight()" title="Przełącz na tryb nocny/dzienny">Noc/Dzień</button>
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
                <li class="nav-item">
                    <a class="nav-link" href="/user/all">Kursanci</a>
                </li>
            </ul>
        </div>

        <div class="login">
            <a href="/login" class="login_btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block" style="padding-right: inherit">Zaloguj się</span></a></div> &nbsp
        <div class="signin">
            <a href="/user/add" class="signup-btn"><i class="fa fa-user"></i><span class="d-none d-md-inline-block">Zarejestruj się</span></a></div>

    </nav>

</header>
</body>

</body>
</html>
