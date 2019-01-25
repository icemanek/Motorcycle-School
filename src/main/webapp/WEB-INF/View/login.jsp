<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <title>Login Page</title>
    <!--Made with love by Mutiullah Samim -->

    <!--Bootsrap 4 CDN-->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <!--Fontawesome CDN-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <!--Custom styles-->
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
</head>
<body>
<form:form method="post" modelAttribute="user">
<a href="/" >Strona Główna</a>
<div class="container">
    <div class="d-flex justify-content-center h-100">
        <div class="card">
            <div class="card-header">
                <h3>Logowanie</h3>
                <div class="card-body">
                    <form>
                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                            </div>
                            <label for="usernameId"></label>
                            <form:input type="text" path="username" id="usernameId" class="form-control"
                                        placeholder="Login"/>
                            <form:errors path="username" element="div" cssClass="error"/>
                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <label for="passwordId"></label>
                            <form:input type="password" path="password" id="passwordId" class="form-control"
                                        placeholder="Hasło"/>
                            <form:errors path="password" element="div" cssClass="error"/>
                        </div>
                        <div class="row align-items-center remember">
                            <input type="checkbox">Zapamiętaj mnie
                        </div>

                        <div class="form-group">
                            <input type="submit" value="Zaloguj" class="btn float-right login_btn"/></div>
                </div>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    Nie masz konta?<a href="/user/add">Zrejestruj się</a>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="#">Zapomniałeś hasła?</a>
                </div>
            </div>

        </div>

    </div>
    </form:form>
</div>
</body>
</html>
