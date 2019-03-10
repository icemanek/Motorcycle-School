<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/main.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
</head>

<body>
<form:form modelAttribute="login" method="post" action="/login">

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

                            </div>
                            <label for="usernameId">
                            <form:input type="text" path="username" id="usernameId" class="form-control" placeholder="Login"/>
                            <form:errors path="username" element="div" cssClass="error"/>
                            </label>
                        </div>

                        <div class="input-group form-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                            </div>
                            <label for="passwordId">
                            <form:input type="password" path="password" id="passwordId" class="form-control" placeholder="Hasło"/>
                            <form:errors path="password" element="div" cssClass="error"/>
                        </div>
                        <div class="row align-items-center remember">
                            <input type="checkbox">Zapamiętaj mnie
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        <div class="form-group">
                            <input type="submit" value="Zaloguj" class="btn float-right login_btn"/></div>
                    </form></div>
            </div>
            <div class="card-footer">
                <div class="d-flex justify-content-center links">
                    Nie masz konta?<a href="/user/add">Zrejestruj się</a></div>
                </div>
                <div class="d-flex justify-content-center">
                    <a href="#">Zapomniałeś hasła?</a>
                </div>
            </div>

        </div>
</div>
    </div>

    </form:form>
</div>
</body>
</html>
