<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 17.03.19
  Time: 08:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Odzyskiwanie hasła</title>

    <script>
        var serverContext = [[@{
            /}]];

            function resetPass() {
                var email = $("#email").val();
                $.post(serverContext + "user/resetPassword", {email: email},
                    function (data) {
                        window.location.href =
                            serverContext + "login?message=" + data.message;
                    })
                    .fail(function (data) {
                        if (data.responseJSON.error.indexOf("MailError") > -1) {
                            window.location.href = serverContext + "emailError.html";
                        } else {
                            window.location.href =
                                serverContext + "login?message=" + data.responseJSON.message;
                        }
                    });
            }
        }

    </script>


</head>
<body>





</body>
</html>
