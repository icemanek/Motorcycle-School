<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 19.03.19
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/verified.css" rel="stylesheet">

    <script type="text/javascript">
        function Validate() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm_password").value;

            if (password != confirmPassword) {
                document.getElementById("message").style.color = "red";
                document.getElementById("message").innerHTML = "Hasła nie pasują!";

                return false;
            }
            return true;
        }
    </script>

</head>
<body>

<%@ include file="parts/header.jsp" %>

<center>


    <form:form  method="post" modelAttribute="user">


        <form:input type="password"  path="password" title="Musi zawierać jedną mała literę, jedną wielką, jedną cyfrę i jeden znak specjalny" placeholder="Ustaw hasło" id="password" class="form-control" maxlength="100" minlength="8" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required="true" />

        <br>

        <input type="password" id="confirm_password"  placeholder="Powtórz hasło" required />

        <span id="message" ></span>

        <br>

        <button type="submit" class="btn-liquid" onclick="return Validate()">Wyślij</button>

    </form:form>


</center>

</body>
</html>
