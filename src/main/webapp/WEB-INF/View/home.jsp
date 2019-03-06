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

    <link href="../css/homepage.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">

</head>
<%@ include file="parts/header.jsp" %>

<body id="body" class="light-mode">

    <div class="content">
    <h1>WItamy na stronie doskonalenia nauki jazdy na motocyklu!</h1>
    <h2>Zapraszamy to zapoznania się z naszą ofertą </h2>


    <button class="button" style="vertical-align:middle" onclick="window.location.href='/kursy/all'"><span>Sprawdź! </span></button>
    </div>
</body>
<footer><%@ include file="parts/footer.jsp" %></footer>
</html>
