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

    <link href="../css/head.css" rel="stylesheet">


    <script>

        function toggleDarkLight() {
            var body = document.getElementById("body");
            var currentClass = body.className;
            body.className = currentClass == "dark-mode" ? "light-mode" : "dark-mode";
        }

    </script>
</head>

<body id="body" class="light-mode">

    <nav class="main-navigation">
        <div class="navbar-header animated fadeInUp">
            <a class="navbar-brand" href="#">Szkoła motocyklowa</a>
        </div>
        <ul class="nav-list">
            <li class="nav-list-item">
                <a href="/" class="nav-link">Home</a>
            </li>

            <li class="nav-list-item">
                <a href="/instructor/all" class="nav-link">Nauczyciele</a>
            </li>
            <li class="nav-list-item">
                <a href="/onas" class="nav-link">O Nas</a>
            </li>
            <li class="nav-list-item">
                <a href="/drive" class="nav-link">Jak dojechać</a>
            </li>
            <li class="nav-list-item">
                <a href="/contact" class="nav-link">Kontakt</a>
            </li>
            <li class="nav-list-item">
                <a href="/user/all" class="nav-link">Kursanci</a>
            </li>
            <li class="login_btn">
                <a href="/login" class="nav-link">Zaloguj się</a>
            </li>
            <li class="signup_btn">
                <a href="/user/add" class="nav-link">Rejestracja</a>
            </li>
            <div class="onoffswitch">
                <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" onclick="toggleDarkLight()">
                <label class="onoffswitch-label" for="myonoffswitch">
                    <span class="onoffswitch-inner"></span>
                    <span class="onoffswitch-switch"></span>
                </label>
            </div>

            </li>
        </ul>
    </nav>
    </body>
</html>
