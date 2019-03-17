<%--
  Created by IntelliJ IDEA.
  User: emil
  Date: 16.03.19
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/verified.css" rel="stylesheet">

    <title>Rejestracja</title>


    <script>
        function resendToken(){
            var token = [[${param.token}]];
            $.get(serverContext + "user/resendRegistrationToken?token="+token, function(data){
                window.location.href = serverContext +"login?message=" + data.message;
            })
                .fail(function(data) {
                    if(data.responseJSON.error.indexOf("MailError") > -1)
                    {
                        window.location.href = serverContext + "error";
                    }
                    else{
                        window.location.href = serverContext + "login?message=" + data.responseJSON.message;
                    }
                });
        }
        $(document).ajaxStart(function() {
            $("title").html("LOADING ...");
        });


    </script>
</head>
<body>
<div class="content">

    <%@ include file="parts/header.jsp" %>

    <center>
        <c:if test="${not empty newToken}">

            <span>${newToken}</span>

            <button onclick="resendToken()">Wyślij</button>


        </c:if>

    </center>

</div>
</body>
<footer><%@ include file="parts/footer.jsp" %></footer>
</html>
