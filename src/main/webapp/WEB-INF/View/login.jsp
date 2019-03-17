<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Zaloguj się </title>

    <link href="../css/log.css" rel="stylesheet">



    <link rel="canonical" href="https://codepen.io/frytyler/pen/EGdtg" />

    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'>

</head>
<body id="body" class="light-mode">
<center>
<a href="/"> Powrót do strony głównej </a>

<form:form modelAttribute="login" method="post" action="/spring_security_check" name="f">

    <div class="login">

        <c:if test="${param.error != null}">

            <div class="error alert alert-danger">
                Zły login lub hasło!
            </div>

        </c:if>


        <h1>Logowanie</h1>

        <label for="usernameId" name="u" >
            <form:input type="text"   path="username" id="usernameId" class="form-control" placeholder="Login" required="true"/>
            <form:errors path="username" element="div" cssClass="error"/>
        </label>



        <label for="passwordId" name="p">
            <form:input type="password" path="password" id="passwordId" class="form-control" placeholder="Hasło" required="true"/>
            <form:errors path="password" element="div" cssClass="error"/>


            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button  type="submit" class="btn-liquid" onclick="validate()" >Zaloguj Się</button>

        </label>

        <p>Nie masz konta? <a href="/user/add">Zarejestruj się!</a></p>
        <p>Jesteś instruktorem?<a href="/instructor/add">Kliknij tutaj</a></p>
    </div>
</form:form>
</center>
</body>
</html>
