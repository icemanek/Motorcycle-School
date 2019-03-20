<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 19.03.19
  Time: 14:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/verified.css" rel="stylesheet">

    <script type="text/javascript">

        var serverContext = [[@{/}]];
            function savePass(){
                var pass = $("#pass").val();
                var valid = pass == $("#passConfirm").val();
                if(!valid) {
                    $("#error").show();
                    return;
                }
                $.post(serverContext + "user/updatePassword",
                    {password: pass, oldpassword: $("#oldpass").val()} ,function(data){
                        window.location.href = serverContext +"/home?message="+data.message;
                    })
                    .fail(function(data) {
                        $("#errormsg").show().html(data.responseJSON.message);
                    });
            }
    </script>

</head>
<body>

<center>


<form:form modelAttribute="password"  method="post" >


<form:input path="password" type="password" class="form-control" placeholder="Nowe Hasło" required="true" />

    <input type="password" id="confirm_password"  placeholder="Powtórz hasło" required="true">


    <input type="submit" onclick="savePass()">Change Password</input>


</form:form>

</center>

</body>

<footer><%@ include file="parts/footer.jsp" %></footer>

</html>
