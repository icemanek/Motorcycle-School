<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<c:if test="${pageContext.request.userPrincipal.name != null}">
            <li class="nav-list-item">
                <a href="/instructor/all" class="nav-link"> <i class="fas fa-chalkboard-teacher"></i> Nauczyciele</a>
            </li>
</c:if>

            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <li class="nav-list-item">
                    <a href="/user/updatePassword" class="nav-link"> <i class="fas fa-chalkboard-teacher"></i> Zmień hasło</a>
                </li>
            </c:if>
            <li class="nav-list-item">
                <a href="/onas" class="nav-link"> <i class="fas fa-building"></i> O Nas</a>
            </li>
            <li class="nav-list-item">
                <a href="/drive" class="nav-link"> <i class="fas fa-car"></i> Jak dojechać</a>
            </li>
            <li class="nav-list-item">
                <a href="/contact" class="nav-link"> <i class="fas fa-file-signature"></i> Kontakt</a>
            </li>
<c:if test="${pageContext.request.userPrincipal.name != null}">
            <li class="nav-list-item">
                <a href="/user/all" class="nav-link"> <i class="fas fa-users"></i> Kursanci</a>
            </li>
</c:if>
            <li class="nav-list-item">
                <a href="/kursy/all" class="nav-link"> <i class="fas fa-shopping-cart"></i> Kursy</a>
            </li>
            <c:if test="${pageContext.request.userPrincipal.name == null}">
            <li class="login_btn">
                <a href="/login" class="nav-link"> <i class="fas fa-user"></i> Zaloguj się</a>
            </li>
            <li class="signup_btn">
                <a href="/user/add" class="nav-link"> <i class="fas fa-user-plus"></i> Rejestracja</a>
            </li>
            </c:if>
<c:if test="${pageContext.request.userPrincipal.name != null}">

    <li class="login_btn">
        <a  class="nav-link"> <i class="fas fa-user"></i>Witaj <c:out value="${pageContext.request.remoteUser}"/></a>
    </li>

            <li class="signup_btn">
                <a href="/user/add" class="nav-link"> <i class="fas fa-shopping-basket"></i> Koszyk</a>
            </li>
    <li class="nav-link">

        <c:url var="logoutUrl" value="/logout"/>

        <form class="login_btn" id="logout" action="${logoutUrl}" method="post">

    <li class="login_btn">
        <a href="javascript:document.getElementById('logout').submit()" class="nav-link">Wyloguj</a>
    </li>

            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>


</c:if>
            <div class="onoffswitch">
                <input type="checkbox" name="onoffswitch" class="onoffswitch-checkbox" id="myonoffswitch" onclick="toggleDarkLight()">
                <label class="onoffswitch-label" for="myonoffswitch">
                    <span class="onoffswitch-inner"></span>
                    <span class="onoffswitch-switch"></span>
                </label>
            </div>

        </ul>
    </nav>
    </body>
</html>
