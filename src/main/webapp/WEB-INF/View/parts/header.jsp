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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

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
        </div>
        <ul class="nav-list">
            <li class="nav-list-item">
                <a href="/" class="nav-link"> <i class="fas fa-home"></i> Home</a>
            </li>

            <li class="nav-list-item">
                <a href="/instructor/all" class="nav-link"> <i class="fas fa-chalkboard-teacher"></i> Nauczyciele</a>
            </li>
            <li class="nav-list-item">
                <a href="/onas" class="nav-link"> <i class="fas fa-building"></i> O Nas</a>
            </li>
            <li class="nav-list-item">
                <a href="/drive" class="nav-link"> <i class="fas fa-car"></i> Jak dojechać</a>
            </li>
            <li class="nav-list-item">
                <a href="/contact" class="nav-link"> <i class="fas fa-file-signature"></i> Kontakt</a>
            </li>
            <li class="nav-list-item">
                <a href="/user/all" class="nav-link"> <i class="fas fa-users"></i> Kursanci</a>
            </li>
            <li class="nav-list-item">
                <a href="/kursy/all" class="nav-link"> <i class="fas fa-shopping-cart"></i> Kursy</a>
            </li>
            <li class="login_btn">
                <a href="/login" class="nav-link"> <i class="fas fa-user"></i> Zaloguj się</a>
            </li>
            <li class="signup_btn">
                <a href="/user/add" class="nav-link"> <i class="fas fa-user-plus"></i> Rejestracja</a>
            </li>
            <li class="signup_btn">
                <a href="/user/add" class="nav-link"> <i class="fas fa-shopping-basket"></i> Koszyk</a>
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
