<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title> Zaloguj się </title>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/log.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
    <script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
    <script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
    <script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
   <meta name="robots" content="noindex"><link rel="shortcut icon" type="image/x-icon" href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
    <link rel="mask-icon" type="" href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg" color="#111" />
    <link rel="canonical" href="https://codepen.io/frytyler/pen/EGdtg" />

    <link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css'><script src='https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js'></script>
    <script type="text/javascript">
        function validate() {

            if (document.f.username.value == "") {
                alert("Login jest wymagany");
                document.f.username.focus();
                return false;
            }
            if (document.f.password.value == "") {
                alert("Hasło jest wymagane");
                document.f.password.focus();
                return false;
            }
        }
    </script>
</head>
<body id="body" class="light-mode">

<a href="/"> Strina główna </a>


<form:form modelAttribute="login" method="post" action="/spring_security_check" name="f">

                <div class="login">

                    <h1>Logowanie</h1>


                   <label for="usernameId" name="u">
                            <form:input type="text" path="username" id="usernameId" class="form-control" placeholder="Login" required=""/>
                            <form:errors path="username" element="div" cssClass="error"/>
                            </label>



                     <label for="passwordId" name="p">
                            <form:input type="password" path="password" id="passwordId" class="form-control" placeholder="Hasło" required=""/>
                            <form:errors path="password" element="div" cssClass="error"/>


                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                            <button  type="submit" class="btn-liquid" onclick="validate()" >Zaloguj Się</button>
                     </label>

                     <p>Nie masz konta? <a href="/user/add">Zarejestruj się!</a></p>
                </div>
                                </form:form>

</body>
</html>
